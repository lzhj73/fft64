/*
####-PASS-####
*/
module input_unit_tb_fsm(
    input clk,
    input rst_n,
    input start,
    output reg din_valid,
    output reg [9:0] doutre,
    output reg [9:0] doutim
);
    reg [9:0] sregre [0:63];
    reg [9:0] sregim [0:63];
    initial begin
        $readmemh("re.mem",sregre);
        $readmemh("im.mem",sregim);
    end


    reg state,nextstate;
    localparam idle=1'b0,
               send=1'b1;
    always@(posedge clk,negedge rst_n)
        if(!rst_n)
            state<=idle;
        else
            state<=nextstate;
    
    reg [5:0] counter;
    always@(posedge clk,negedge rst_n)
        if(!rst_n)
            counter<=6'd0;
        else if(state==send)
            counter<=counter+1;
    

    always@(*)begin
        case(state)
            idle: if(start)
                        nextstate=send;
                  else
                        nextstate=idle;
            send: if(counter==6'd63)
                        nextstate=idle;
                  else
                        nextstate=send;
            default:    nextstate=idle;
        endcase
    end

    always@(*)
        if(state==send)
            din_valid=1'b1;
        else
            din_valid=1'b0;
            
    always@(posedge clk)begin
        doutre <= sregre[counter];
        doutim <= sregim[counter];
    end
endmodule

module input_unit_tb();
    reg clk;
    reg rst_n;
    wire [9:0] dinre,dinim;
    wire [9:0] doutre0,doutre1,doutre2,doutre3,doutre4,doutre5,doutre6,doutre7;
    wire [9:0] doutim0,doutim1,doutim2,doutim3,doutim4,doutim5,doutim6,doutim7;
    reg start;
    wire din_valid;
    wire start_count;
    input_unit_tb_fsm m0(
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .din_valid(din_valid),
        .doutre(dinre),
        .doutim(dinim)
    );

    input_unit m1(
        .clk(clk),
        .rst_n(rst_n),
        .din_valid(din_valid),
        .dinre(dinre),
        .dinim(dinim),
        .doutre({doutre7,doutre6,doutre5,doutre4,doutre3,doutre2,doutre1,doutre0}),
        .doutim({doutim7,doutim6,doutim5,doutim4,doutim3,doutim2,doutim1,doutim0}),
        .start_count(start_count)
    );

    initial clk=1'b0;
    always #2 clk=~clk;

    initial begin
        rst_n=1'b1;start=1'b0;
        #2 rst_n=1'b0;
        #6 rst_n=1'b1;
        #2 start=1'b1;
        #4 start=1'b0;
        #300 $finish;
    end

endmodule