`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/05 18:40:59
// Design Name: 
// Module Name: fft64
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


module fft64(
    input clk,
    input rst_n,
    input [9:0] din_re,
    input [9:0] din_im,
    input din_valid,
    output [9:0] dout_re,
    output [9:0] dout_im,
    output dout_valid
    );
    
    wire [79:0] input_unit_dout_re;
    wire [79:0] input_unit_dout_im;
    wire input_unit_start_count;
    wire [5:0] input_unit_counter;
    input_unit input_unit(
        .clk(clk),
        .rst_n(rst_n),
        .din_valid(din_valid),
        .dinre(din_re),
        .dinim(din_im),
        .doutre(input_unit_dout_re),
        .doutim(input_unit_dout_im),
        .start_count(input_unit_start_count),
        .counter(input_unit_counter)
    );
    
    wire [79:0] fft8_1_dout_re;
    wire [79:0] fft8_1_dout_im;
    fft8 fft8_1(
        .dinre(input_unit_dout_re),
        .dinim(input_unit_dout_im),
        .doutre(fft8_1_dout_re),
        .doutim(fft8_1_dout_im)
    );
    
    wire [79:0] multi_unit_dout_re;
    wire [79:0] multi_unit_dout_im;
    multi_core multi_core(
        .dinre(fft8_1_dout_re),
        .dinim(fft8_1_dout_im),
        .counter(input_unit_counter),
        .doutre(multi_unit_dout_re),
        .doutim(multi_unit_dout_im)
    );
    
    wire [79:0] cb_dout_re;
    wire [79:0] cb_dout_im;
    wire cb_start_send;
    wire [2:0] cb_counter;
    cb cb(
        .clk(clk),
        .rst_n(rst_n),
        .start_count(input_unit_start_count),
        .dinre(multi_unit_dout_re),
        .dinim(multi_unit_dout_im),
        .doutre(cb_dout_re),
        .doutim(cb_dout_im),
        .start_send(cb_start_send),
        .counter(cb_counter)
    );
    
    wire [79:0] fft8_2_dout_re;
    wire [79:0] fft8_2_dout_im;
    fft8 fft8_2(
        .dinre(cb_dout_re),
        .dinim(cb_dout_im),
        .doutre(fft8_2_dout_re),
        .doutim(fft8_2_dout_im)
    );
    
    output_unit output_unit(
        .clk(clk),
        .rst_n(rst_n),
        .start_send(cb_start_send),
        .dinre(fft8_2_dout_re),
        .dinim(fft8_2_dout_im),
        .dincounter(cb_counter),
        .doutre(dout_re),
        .doutim(dout_im),
        .men(dout_valid)
    );
        
        
    
endmodule
