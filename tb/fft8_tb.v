/*
####--PASS--####
*/
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/04 20:34:40
// Design Name: 
// Module Name: fft8_tb
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


module fft8_tb();
    reg signed [9:0] re7,re6,re5,re4,re3,re2,re1,re0;
    reg signed [9:0] im7,im6,im5,im4,im3,im2,im1,im0;
    wire [9:0] doutre7,doutre6,doutre5,doutre4,doutre3,doutre2,doutre1,doutre0;
    wire [9:0] doutim7,doutim6,doutim5,doutim4,doutim3,doutim2,doutim1,doutim0;
    fft8 m0(
        .dinre({re7,re6,re5,re4,re3,re2,re1,re0}),
        .dinim({im7,im6,im5,im4,im3,im2,im1,im0}),
        .doutre({doutre7,doutre6,doutre5,doutre4,doutre3,doutre2,doutre1,doutre0}),
        .doutim({doutim7,doutim6,doutim5,doutim4,doutim3,doutim2,doutim1,doutim0})
    );
    initial begin
        re0=10'd3;re1=-10'd13;re2=-10'd4;re3=10'd3; re4=10'd36;re5=10'd28;re6=-10'd13;re7=10'd30;
        im0=10'd7;im1=-10'd12;im2=10'd7; im3=10'd16;im4=10'd5; im5=10'd10;im6=10'd7;  im7=-10'd3;
        //re 70 -45 41 -25 -26 -20  71 -40
        //im 37  12 16  88  15 -26 -20 -66
        #3 $finish;
    end
endmodule
