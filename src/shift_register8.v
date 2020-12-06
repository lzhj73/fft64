/*
####--PASS--####
*/
module shift_register8(
    input [9:0] dinre,
    input [9:0] dinim,
    input clk,
    input rst_n,
    input ren,
    input [2:0] sel,
    output [9:0] doutre,
    output [9:0] doutim
);
    reg [9:0] sregre [0:7];
    reg [9:0] sregim [0:7];
    always@(posedge clk,negedge rst_n)begin
        if(!rst_n)begin
            sregre[0]<=10'b0;
            sregre[1]<=10'b0;
            sregre[2]<=10'b0;
            sregre[3]<=10'b0;
            sregre[4]<=10'b0;
            sregre[5]<=10'b0;
            sregre[6]<=10'b0;
            sregre[7]<=10'b0;
            
            sregim[0]<=10'b0;
            sregim[1]<=10'b0;
            sregim[2]<=10'b0;
            sregim[3]<=10'b0;
            sregim[4]<=10'b0;
            sregim[5]<=10'b0;
            sregim[6]<=10'b0;
            sregim[7]<=10'b0;
        end
        else if(ren)begin
            sregre[7]<=dinre;
            sregre[6]<=sregre[7];
            sregre[5]<=sregre[6];
            sregre[4]<=sregre[5];
            sregre[3]<=sregre[4];
            sregre[2]<=sregre[3];
            sregre[1]<=sregre[2];
            sregre[0]<=sregre[1];
            
            sregim[7]<=dinim;
            sregim[6]<=sregim[7];
            sregim[5]<=sregim[6];
            sregim[4]<=sregim[5];
            sregim[3]<=sregim[4];
            sregim[2]<=sregim[3];
            sregim[1]<=sregim[2];
            sregim[0]<=sregim[1];
        end
    end
    assign doutre = sregre[sel];
    assign doutim = sregim[sel];
endmodule
