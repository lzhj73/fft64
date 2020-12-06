/*
####--PASS--####
*/
module multi_unit_tb();
    reg [79:0] dinre;
    reg [79:0] dinim;
    reg [5:0]  counter;
    wire [9:0] doutre0;
    wire [9:0] doutre1;
    wire [9:0] doutre2;
    wire [9:0] doutre3;
    wire [9:0] doutre4;
    wire [9:0] doutre5;
    wire [9:0] doutre6;
    wire [9:0] doutre7;
    wire [9:0] doutim0;
    wire [9:0] doutim1;
    wire [9:0] doutim2;
    wire [9:0] doutim3;
    wire [9:0] doutim4;
    wire [9:0] doutim5;
    wire [9:0] doutim6;
    wire [9:0] doutim7;

    multi_core m0(
        .dinre(dinre),
        .dinim(dinim),
        .counter(counter),
        .doutre({doutre7,doutre6,doutre5,doutre4,doutre3,doutre2,doutre1,doutre0}),
        .doutim({doutim7,doutim6,doutim5,doutim4,doutim3,doutim2,doutim1,doutim0})
    );

    initial begin
        dinre = {8{10'd100}};
        dinim = 80'b0;
        counter = 6'd0;
        #4 counter = 6'd1;
        #4 counter = 6'd2;
        #4 counter = 6'd3;
        #4 counter = 6'd4;
        #4 counter = 6'd5;
        #4 counter = 6'd6;
        #4 counter = 6'd7;
        #4 $finish;
    end

    initial begin
        $dumpfile("a.vcd");
        $dumpvars;
    end

endmodule
