`timescale 1ns / 1ps


module shift_register8_op(
    input clk,
    input rst_n,
    input ren,
    input men,
    input [9:0] dinre0,//from outside
    input [9:0] dinre1,//from previous register
    input [9:0] dinim0,
    input [9:0] dinim1,
    output [9:0] doutre,
    output [9:0] doutim
    );
    
    reg [9:0] sregre [0:7];
    reg [9:0] sregim [0:7];
    
    always@(posedge clk, negedge rst_n)begin
        if(!rst_n)begin
            sregre[0] <= 10'd0;
            sregre[1] <= 10'd0;
            sregre[2] <= 10'd0;
            sregre[3] <= 10'd0;
            sregre[4] <= 10'd0;
            sregre[5] <= 10'd0;
            sregre[6] <= 10'd0;
//            sregre[7] <= 10'd0;
            sregim[0] <= 10'd0;
            sregim[1] <= 10'd0;
            sregim[2] <= 10'd0;
            sregim[3] <= 10'd0;
            sregim[4] <= 10'd0;
            sregim[5] <= 10'd0;
            sregim[6] <= 10'd0;
//            sregim[7] <= 10'd0;
        end
        else if(ren||men)begin
            sregre[6] <= sregre[7];
            sregre[5] <= sregre[6];
            sregre[4] <= sregre[5];
            sregre[3] <= sregre[4];
            sregre[2] <= sregre[3];
            sregre[1] <= sregre[2];
            sregre[0] <= sregre[1];
            sregim[6] <= sregim[7];
            sregim[5] <= sregim[6];
            sregim[4] <= sregim[5];
            sregim[3] <= sregim[4];
            sregim[2] <= sregim[3];
            sregim[1] <= sregim[2];
            sregim[0] <= sregim[1];
        end
    end
    always@(posedge clk,negedge rst_n)begin
        if(!rst_n)begin
            sregre[7] <= 10'd0;
            sregim[7] <= 10'd0;
        end
        else if(ren)begin
            sregre[7] <= dinre0;
            sregim[7] <= dinim0;
        end
        else if(men)begin
            sregre[7] <= dinre1;
            sregim[7] <= dinim1;
        end
    end
    assign doutre = sregre[0];
    assign doutim = sregim[0];
            
    
endmodule
