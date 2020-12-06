`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: lzhj
// 
// Create Date: 2020/12/04 22:23:49
// Design Name: 
// Module Name: shift_register8_ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
//////////////////////////////////////////////////////////////////////////////////


module shift_register8_ctrl(
    input clk,
    input rst_n,
    input ren,//start read data
    input men,// read finish, start move
    input [79:0] dinre,
    input [79:0] dinim,
    output [9:0] doutre,
    output [9:0] doutim
    );
        reg [9:0] sregre [0:7];
        reg [9:0] sregim [0:7];

        always@(posedge clk,negedge rst_n)begin
                if(!rst_n)begin
                        sregre[0]<=10'd0;
                        sregre[1]<=10'd0;
                        sregre[2]<=10'd0;
                        sregre[3]<=10'd0;
                        sregre[4]<=10'd0;
                        sregre[5]<=10'd0;
                        sregre[6]<=10'd0;
                        sregre[7]<=10'd0;
                        sregim[0]<=10'd0;
                        sregim[1]<=10'd0;
                        sregim[2]<=10'd0;
                        sregim[3]<=10'd0;
                        sregim[4]<=10'd0;
                        sregim[5]<=10'd0;
                        sregim[6]<=10'd0;
                        sregim[7]<=10'd0;
                end
                else if(ren)begin
                        sregre[0]<=dinre[9:0];
                        sregre[1]<=dinre[19:10];
                        sregre[2]<=dinre[29:20];
                        sregre[3]<=dinre[39:30];
                        sregre[4]<=dinre[49:40];
                        sregre[5]<=dinre[59:50];
                        sregre[6]<=dinre[69:60];
                        sregre[7]<=dinre[79:70];
                        sregim[0]<=dinim[9:0];
                        sregim[1]<=dinim[19:10];
                        sregim[2]<=dinim[29:20];
                        sregim[3]<=dinim[39:30];
                        sregim[4]<=dinim[49:40];
                        sregim[5]<=dinim[59:50];
                        sregim[6]<=dinim[69:60];
                        sregim[7]<=dinim[79:70];
                end
                else if(men)begin
                        sregre[0]<=sregre[1];
                        sregre[1]<=sregre[2];
                        sregre[2]<=sregre[3];
                        sregre[3]<=sregre[4];
                        sregre[4]<=sregre[5];
                        sregre[5]<=sregre[6];
                        sregre[6]<=sregre[7];
                        sregre[7]<=10'd0;
                        sregim[0]<=sregim[1];
                        sregim[1]<=sregim[2];
                        sregim[2]<=sregim[3];
                        sregim[3]<=sregim[4];
                        sregim[4]<=sregim[5];
                        sregim[5]<=sregim[6];
                        sregim[6]<=sregim[7];
                        sregim[7]<=10'd0;
                end
        end
        assign doutre = sregre[0];
        assign doutim = sregim[0];

endmodule
