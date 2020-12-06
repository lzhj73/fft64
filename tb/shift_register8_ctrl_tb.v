`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/05 08:53:55
// Design Name: 
// Module Name: shift_register8_ctrl_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shift_register8_ctrl_tb();
    reg clk;
    reg rst_n;
    reg ren;
    reg men;
    reg [9:0] dinre7,dinre6,dinre5,dinre4,dinre3,dinre2,dinre1,dinre0;
    reg [9:0] dinim7,dinim6,dinim5,dinim4,dinim3,dinim2,dinim1,dinim0;
    wire [9:0] doutre;
    wire [9:0] doutim;

    shift_register8_ctrl m0(
            .clk(clk),
            .rst_n(rst_n),
            .ren(ren),
            .men(men),
            .dinre({dinre7,dinre6,dinre5,dinre4,dinre3,dinre2,dinre1,dinre0}),
            .dinim({dinim7,dinim6,dinim5,dinim4,dinim3,dinim2,dinim1,dinim0}),
            .doutre(doutre),
            .doutim(doutim)
    );
    initial clk = 1'b0;
    always #2 clk = ~clk;
    initial begin
            rst_n=1'b1;ren=1'b0;men=1'b0;
            dinre7=10'd0;
            dinre6=10'd0;
            dinre5=10'd0;
            dinre4=10'd0;
            dinre3=10'd0;
            dinre2=10'd0;
            dinre1=10'd0;
            dinre0=10'd0;
            dinim7=10'd0;
            dinim6=10'd0;
            dinim5=10'd0;
            dinim4=10'd0;
            dinim3=10'd0;
            dinim2=10'd0;
            dinim1=10'd0;
            dinim0=10'd0;
            #2 rst_n=1'b0;
            #6 rst_n=1'b1;
            #2 ren=1'b1;
            dinre7=10'd9;
            dinre6=10'd8;
            dinre5=10'd7;
            dinre4=10'd6;
            dinre3=10'd5;
            dinre2=10'd4;
            dinre1=10'd3;
            dinre0=10'd2;
            dinim7=10'd8;
            dinim6=10'd7;
            dinim5=10'd6;
            dinim4=10'd5;
            dinim3=10'd4;
            dinim2=10'd3;
            dinim1=10'd2;
            dinim0=10'd1;
            #4 ren=1'b0;
            #8 men=1'b1;
            #32 men=1'b0;
            #8 $finish;
    end
 

endmodule
