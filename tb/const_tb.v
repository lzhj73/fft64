/*
####--PASS--####
*/
module const_tb();
    reg signed [9:0] re,im;
    wire [9:0] resultre1,resultim1;
    wire [9:0] resultre2,resultim2;
    wire [9:0] resultre3,resultim3;
    wire [9:0] resultre4,resultim4;
    wire [9:0] resultre5,resultim5;
    wire [9:0] resultre6,resultim6;
    wire [9:0] resultre7,resultim7;
    wire [9:0] resultre8,resultim8;
    const1 m0(re,im,resultre1,resultim1);
    const2 m1(re,im,resultre2,resultim2);
    const3 m2(re,im,resultre3,resultim3);
    const4 m3(re,im,resultre4,resultim4);
    const5 m4(re,im,resultre5,resultim5);
    const6 m5(re,im,resultre6,resultim6);
    const7 m6(re,im,resultre7,resultim7);
    const8 m7(re,im,resultre8,resultim8);
    initial begin
        re = 10'd100;
        im = 10'd0;
        #4 $finish;
    end
endmodule