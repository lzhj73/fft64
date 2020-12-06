/*
========PASS========
*/
module shift_register8_tb();
    reg clk;
    reg rst_n;
    reg ren;
    reg [9:0] dinre;
    reg [9:0] dinim;
    wire [9:0] doutre;
    wire [9:0] doutim;
    reg [2:0] sel;
    shift_register8 m0(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren),
        .dinre(dinre),
        .dinim(dinim),
        .doutre(doutre),
        .sel(sel),
        .doutim(doutim)
    );

    initial clk=1'b0;
    always #2 clk=~clk;

    initial begin
        rst_n=1'b1;ren=1'b0;
        dinim=10'd0;
        sel=3'b0;
        #2 rst_n=1'b0;
        #6 rst_n=1'b1;
        #6 ren=1'b1;dinre=10'd0;
        #4 dinre=10'd1;
        #4 dinre=10'd2;
        #4 dinre=10'd3;
        #4 dinre=10'd4;
        #4 dinre=10'd5;
        #4 dinre=10'd6;
        #4 dinre=10'd7;
        #4 ren=1'b0;
        #4 sel=3'b001;
        #4 sel=3'b010;
        #4 sel=3'b011;
        #4 sel=3'b100;
        #4 sel=3'b101;
        #4 sel=3'b110;
        #4 sel=3'b111;
        #4 $finish;
    end
    initial begin
        $dumpfile("a.vcd");
        $dumpvars;
    end
endmodule
