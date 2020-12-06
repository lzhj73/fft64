`timescale 1ns / 1ps

module fft64_tb();
    reg clk;
    reg start;
    reg rst_n;
    wire [9:0] dinre;
    wire [9:0] dinim;
    wire [9:0] doutre;
    wire [9:0] doutim;
    wire doutvalid;

    wire din_valid;
    fft64_tb_fsm fsm(
            .clk(clk),
            .rst_n(rst_n),
            .start(start),
            .din_valid(din_valid),
            .doutre(dinre),
            .doutim(dinim)
    );

    fft64 fft64(
            .clk(clk),
            .rst_n(rst_n),
            .din_re(dinre),
            .din_im(dinim),
            .din_valid(din_valid),
            .dout_re(doutre),
            .dout_im(doutim),
            .dout_valid(doutvalid)
    );

    initial clk = 1'b0;
    always #2 clk = ~clk;

    initial begin
            rst_n = 1'b1;
            start = 1'b0;
            #2 rst_n = 1'b0;
            #6 rst_n = 1'b1;
            #2 start = 1'b1;
            #4 start = 1'b0;
            #600 $finish;
    end

endmodule

module fft64_tb_fsm(
    input clk,
    input rst_n,
    input start,
    output reg din_valid,
    output reg [9:0] doutre,
    output reg [9:0] doutim
);
    localparam idle = 1'b0,
               send = 1'b1;
    reg state,nextstate;
    
    always@(posedge clk, negedge rst_n)
        if(!rst_n)
            state <= idle;
        else
            state <= nextstate;

    reg [5:0] counter;
    always@(posedge clk,negedge rst_n)
        if(!rst_n)
            counter <= 6'd0;
        else if(state==send)
            counter <= counter + 1;

    always@(*)begin
            case(state)
                    idle: if(start)
                              nextstate = send;
                          else
                              nextstate = idle;
                    send: if(counter==6'd63)
                              nextstate = idle;
                          else
                              nextstate = send;
                    default:  nextstate = idle;
            endcase
    end

    reg [9:0] sregre [0:63];
    reg [9:0] sregim [0:63];
    
    initial begin
            $readmemb("inre.mem",sregre);
            $readmemb("inim.mem",sregim);
    end

    always@(posedge clk)begin
            doutre <= sregre[counter];
            doutim <= sregim[counter];
    end

    always@(*)begin
            if(state==send)
                    din_valid = 1'b1;
            else
                    din_valid = 1'b0;
    end

endmodule
    
