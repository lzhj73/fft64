/*
####--PASS--####
*/
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/06 00:35:07
// Design Name: 
// Module Name: data_check
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


module data_check(

    );
    reg [9:0] inre [0:63];
    reg [9:0] inim [0:63];
    reg [9:0] outre [0:63];
    reg [9:0] outim [0:63];
    initial begin
        $readmemb("inre.mem",inre);
        $readmemb("inim.mem",inim);
        $readmemb("outre.mem",outre);
        $readmemb("outim.mem",outim);
    end
    initial begin
        #3 $stop;
    end
endmodule
