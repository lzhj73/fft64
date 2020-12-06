/*
####--PASS--####
*/
`timescale 1ns / 1ps

module output_unit(
    input clk,
    input rst_n,
    input start_send,
    input [79:0] dinre,
    input [79:0] dinim,
    input [2:0] dincounter,
    output [9:0] doutre,
    output [9:0] doutim,
    output reg men
    );
    
    localparam idle = 2'b00,
               read = 2'b01,
               send = 2'b10;
    reg [1:0] state,nextstate;
    always@(posedge clk,negedge rst_n)
        if(!rst_n)
            state <= idle;
        else
            state <= nextstate;
    
    reg [5:0] counter;
    always@(posedge clk, negedge rst_n)
        if(!rst_n)
            counter <= 6'd0;
        else if(state==send)
            counter <= counter + 1;
    
    always@(*)begin
        case(state)
            idle: if(start_send)
                      nextstate = read;
                  else
                      nextstate = idle;
            read: if(dincounter==3'd7)
                      nextstate = send;
                  else
                      nextstate = read;
            send: if(counter==6'd63)
                      nextstate = idle;
                  else
                      nextstate = send;
            default:  nextstate = idle;
        endcase
    end
    
//    reg start_send;
//    always@(*)begin
//        if(nextstate==read)
//            start_send = 1'b1;
//        else
//            start_send = 1'b0;
//    end
    
//    reg men;
    always@(*)
        if(state==send)
            men = 1'b1;
        else
            men = 1'b0;
    
    wire [9:0] linkre76,linkim76;
    shift_register8_op m7(
        .clk(clk),
        .rst_n(rst_n),
        .ren(start_send),
        .men(men),
        .dinre0(dinre[79:70]),
        .dinre1(10'd0),
        .dinim0(dinim[79:70]),
        .dinim1(10'd0),
        .doutre(linkre76),
        .doutim(linkim76)
    );
    
    wire [9:0] linkre65,linkim65;
    shift_register8_op m6(
        .clk(clk),
        .rst_n(rst_n),
        .ren(start_send),
        .men(men),
        .dinre0(dinre[69:60]),
        .dinre1(linkre76),
        .dinim0(dinim[69:60]),
        .dinim1(linkim76),
        .doutre(linkre65),
        .doutim(linkim65)
    );
    
    wire [9:0] linkre54,linkim54;
    shift_register8_op m5(
        .clk(clk),
        .rst_n(rst_n),
        .ren(start_send),
        .men(men),
        .dinre0(dinre[59:50]),
        .dinre1(linkre65),
        .dinim0(dinim[59:50]),
        .dinim1(linkim65),
        .doutre(linkre54),
        .doutim(linkim54)
    );
    
    wire [9:0] linkre43,linkim43;
    shift_register8_op m4(
        .clk(clk),
        .rst_n(rst_n),
        .ren(start_send),
        .men(men),
        .dinre0(dinre[49:40]),
        .dinre1(linkre54),
        .dinim0(dinim[49:40]),
        .dinim1(linkim54),
        .doutre(linkre43),
        .doutim(linkim43)
    );
    
    wire [9:0] linkre32,linkim32;
    shift_register8_op m3(
        .clk(clk),
        .rst_n(rst_n),
        .ren(start_send),
        .men(men),
        .dinre0(dinre[39:30]),
        .dinre1(linkre43),
        .dinim0(dinim[39:30]),
        .dinim1(linkim43),
        .doutre(linkre32),
        .doutim(linkim32)
    );
    
    wire [9:0] linkre21,linkim21;
    shift_register8_op m2(
        .clk(clk),
        .rst_n(rst_n),
        .ren(start_send),
        .men(men),
        .dinre0(dinre[29:20]),
        .dinre1(linkre32),
        .dinim0(dinim[29:20]),
        .dinim1(linkim32),
        .doutre(linkre21),
        .doutim(linkim21)
    );
    
    wire [9:0] linkre10,linkim10;
    shift_register8_op m1(
        .clk(clk),
        .rst_n(rst_n),
        .ren(start_send),
        .men(men),
        .dinre0(dinre[19:10]),
        .dinre1(linkre21),
        .dinim0(dinim[19:10]),
        .dinim1(linkim21),
        .doutre(linkre10),
        .doutim(linkim10)
    );
    
    shift_register8_op m0(
        .clk(clk),
        .rst_n(rst_n),
        .ren(start_send),
        .men(men),
        .dinre0(dinre[9:0]),
        .dinre1(linkre10),
        .dinim0(dinim[9:0]),
        .dinim1(linkim10),
        .doutre(doutre),
        .doutim(doutim)
    );
            
   
endmodule
