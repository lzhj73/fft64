/*
####--PASS--####
*/
`timescale 1ns / 1ps

module cb(
    input clk,
    input rst_n,
    input start_count,
    input [79:0] dinre,
    input [79:0] dinim,
    output [79:0] doutre,
    output [79:0] doutim,
    output reg start_send,
    output reg [2:0] counter
    );
    
    reg [1:0] state,nextstate;
    localparam idle = 2'b00,
               read = 2'b01,
               send = 2'b10;
    always@(posedge clk,negedge rst_n)
        if(!rst_n)
            state <= idle;
        else
            state <= nextstate;
    
//    reg [2:0] counter;
    always@(posedge clk,negedge rst_n)begin
        if(!rst_n)
            counter <= 2'b00;
        else if(state==read||state==send)
            counter <= counter + 1;
    end

    always@(*)begin
        case(state)
            idle: if(start_count)
                      nextstate = read;
                  else
                      nextstate = idle;
            read: if(counter==3'd7)
                      nextstate = send;
                  else
                      nextstate = read;
            send: if(counter==3'd7)
                      nextstate = idle;
                  else
                      nextstate = send;
            default:  nextstate = idle;
        endcase
    end

    reg men;
    reg [7:0] ren;

    always@(*)begin
        if(state==send)
            men = 1'b1;
        else
            men = 1'b0;
    end

    always@(posedge clk)begin
        if(nextstate==idle)
            ren <= 8'b0000_0001;
        else if(nextstate==read)
            ren <= ren << 1;
    end
    
    always@(*)begin
        if(state==send)
            start_send = 1'b1;
        else
            start_send = 1'b0;
    end

    shift_register8_ctrl m7(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren[7]),
        .men(men),
        .dinre(dinre),
        .dinim(dinim),
        .doutre(doutre[79:70]),
        .doutim(doutim[79:70])
    );
    shift_register8_ctrl m6(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren[6]),
        .men(men),
        .dinre(dinre),
        .dinim(dinim),
        .doutre(doutre[69:60]),
        .doutim(doutim[69:60])
    );
    shift_register8_ctrl m5(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren[5]),
        .men(men),
        .dinre(dinre),
        .dinim(dinim),
        .doutre(doutre[59:50]),
        .doutim(doutim[59:50])
    );
    shift_register8_ctrl m4(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren[4]),
        .men(men),
        .dinre(dinre),
        .dinim(dinim),
        .doutre(doutre[49:40]),
        .doutim(doutim[49:40])
    );
    shift_register8_ctrl m3(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren[3]),
        .men(men),
        .dinre(dinre),
        .dinim(dinim),
        .doutre(doutre[39:30]),
        .doutim(doutim[39:30])
    );
    shift_register8_ctrl m2(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren[2]),
        .men(men),
        .dinre(dinre),
        .dinim(dinim),
        .doutre(doutre[29:20]),
        .doutim(doutim[29:20])
    );
    shift_register8_ctrl m1(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren[1]),
        .men(men),
        .dinre(dinre),
        .dinim(dinim),
        .doutre(doutre[19:10]),
        .doutim(doutim[19:10])
    );
    shift_register8_ctrl m0(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren[0]),
        .men(men),
        .dinre(dinre),
        .dinim(dinim),
        .doutre(doutre[9:0]),
        .doutim(doutim[9:0])
    );

endmodule
