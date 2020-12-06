/*
####--PASS--####
*/
module input_unit(
    input clk,
    input rst_n,
    input din_valid,
    input [9:0] dinre,
    input [9:0] dinim,
    output [79:0] doutre,
    output [79:0] doutim,
    output reg start_count,
    output reg [5:0] counter
);
    reg [1:0] state;
    reg [1:0] nextstate;
    localparam idle=2'b00,
               read=2'b01,
               send=2'b10;
            
    always@(posedge clk,negedge rst_n)begin
        if(!rst_n)
            state<=idle;
        else
            state<=nextstate;
    end

//    reg [5:0] counter;
    always@(posedge clk,negedge rst_n)
        if(!rst_n)
            counter<=6'b0;
        else if(state==read||state==send)
            counter<=counter+1;
    always@(*)begin
        case(state)
            idle: if(din_valid)
                      nextstate=read;
                  else
                      nextstate=idle;
            read: if(counter==6'd63)
                      nextstate=send;
                  else
                      nextstate=read;
            send: if(counter==6'd7)
                      nextstate=idle;
                  else
                      nextstate=send;
            default:  nextstate=idle;
        endcase
    end
    
    reg ren;
    always@(*)
        if(state==read)
            ren=1'b1;
        else
            ren=1'b0;
            
    always@(*)begin
        if(state==send)
            start_count=1'b1;
        else
            start_count=1'b0;
    end
    reg [2:0] sel;
    always@(posedge clk,negedge rst_n)
        if(!rst_n)
            sel<=3'b0;
        else if(state==send)
            sel<=sel+1;

    shift_register8 m7(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren),
        .sel(sel),
        .dinre(dinre),
        .dinim(dinim),
        .doutre(doutre[79:70]),
        .doutim(doutim[79:70])
    );

    shift_register8 m6(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren),
        .sel(sel),
        .dinre(doutre[79:70]),
        .dinim(doutim[79:70]),
        .doutre(doutre[69:60]),
        .doutim(doutim[69:60])        
    );

    shift_register8 m5(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren),
        .sel(sel),
        .dinre(doutre[69:60]),
        .dinim(doutim[69:60]),
        .doutre(doutre[59:50]),
        .doutim(doutim[59:50])        
    );

    shift_register8 m4(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren),
        .sel(sel),
        .dinre(doutre[59:50]),
        .dinim(doutim[59:50]),
        .doutre(doutre[49:40]),
        .doutim(doutim[49:40])
    );

    shift_register8 m3(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren),
        .sel(sel),
        .dinre(doutre[49:40]),
        .dinim(doutim[49:40]),
        .doutre(doutre[39:30]),
        .doutim(doutim[39:30])        
    );

    shift_register8 m2(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren),
        .sel(sel),
        .dinre(doutre[39:30]),
        .dinim(doutim[39:30]),
        .doutre(doutre[29:20]),
        .doutim(doutim[29:20])        
    );

    shift_register8 m1(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren),
        .sel(sel),
        .dinre(doutre[29:20]),
        .dinim(doutim[29:20]),
        .doutre(doutre[19:10]),
        .doutim(doutim[19:10])        
    );
    
    shift_register8 m0(
        .clk(clk),
        .rst_n(rst_n),
        .ren(ren),
        .sel(sel),
        .dinre(doutre[19:10]),
        .dinim(doutim[19:10]),
        .doutre(doutre[9:0]),
        .doutim(doutim[9:0])        
    );
endmodule