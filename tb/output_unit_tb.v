/*
####--PASS--####
*/
`timescale 1ns / 1ps

module output_unit_tb();
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

    wire [9:0] cbre7,cbre6,cbre5,cbre4,cbre3,cbre2,cbre1,cbre0;
    wire [9:0] cbim7,cbim6,cbim5,cbim4,cbim3,cbim2,cbim1,cbim0;
    wire [2:0] cb_counter;
    wire start_send;
    cb m2(
        .clk(clk),
        .rst_n(rst_n),
        .start_count(start_count),
        .dinre({doutre7,doutre6,doutre5,doutre4,doutre3,doutre2,doutre1,doutre0}),
        .dinim({doutim7,doutim6,doutim5,doutim4,doutim3,doutim2,doutim1,doutim0}),
        .doutre({cbre7,cbre6,cbre5,cbre4,cbre3,cbre2,cbre1,cbre0}),
        .doutim({cbim7,cbim6,cbim5,cbim4,cbim3,cbim2,cbim1,cbim0}),
        .counter(cb_counter),
        .start_send(start_send)
    );
    
    wire [9:0] doutre;
    wire [9:0] doutim;
    output_unit m3(
        .clk(clk),
        .rst_n(rst_n),
        .start_send(start_send),
        .dinre({cbre7,cbre6,cbre5,cbre4,cbre3,cbre2,cbre1,cbre0}),
        .dinim({cbim7,cbim6,cbim5,cbim4,cbim3,cbim2,cbim1,cbim0}),
        .dincounter(cb_counter),
        .doutre(doutre),
        .doutim(doutim)
    );

    initial clk=1'b0;
    always #2 clk=~clk;

    initial begin
        rst_n=1'b1;start=1'b0;
        #2 rst_n=1'b0;
        #6 rst_n=1'b1;
        #2 start=1'b1;
        #4 start=1'b0;
        #700 $finish;
    end

endmodule
