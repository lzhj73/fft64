// checked
module multi1(
    input  [69:0] dinre,
    input  [69:0] dinim,
    output [69:0] doutre,
    output [69:0] doutim
    );
    
    const1 m0(dinre[9:0],dinim[9:0],doutre[9:0],doutim[9:0]);
    const2 m1(dinre[19:10],dinim[19:10],doutre[19:10],doutim[19:10]);
    const3 m2(dinre[29:20],dinim[29:20],doutre[29:20],doutim[29:20]);
    const4 m3(dinre[39:30],dinim[39:30],doutre[39:30],doutim[39:30]);
    const5 m4(dinre[49:40],dinim[49:40],doutre[49:40],doutim[49:40]);
    const6 m5(dinre[59:50],dinim[59:50],doutre[59:50],doutim[59:50]);
    const7 m6(dinre[69:60],dinim[69:60],doutre[69:60],doutim[69:60]);
endmodule

module multi2(
    input  [69:0] dinre,
    input  [69:0] dinim,
    output [69:0] doutre,
    output [69:0] doutim
);
    
    wire [9:0] temp0,temp1,temp2;
    const2 m0(dinre[9:0],dinim[9:0],doutre[9:0],doutim[9:0]);
    const4 m1(dinre[19:10],dinim[19:10],doutre[19:10],doutim[19:10]);
    const6 m2(dinre[29:20],dinim[29:20],doutre[29:20],doutim[29:20]);
    const8 m3(dinre[39:30],dinim[39:30],doutre[39:30],doutim[39:30]);
    const6 m4(dinim[49:40],dinre[49:40],doutre[49:40],temp0);
    const4 m5(dinim[59:50],dinre[59:50],doutre[59:50],temp1);
    const2 m6(dinim[69:60],dinre[69:60],doutre[69:60],temp2);
    assign doutim[49:40] = ~temp0 + 1;
    assign doutim[59:50] = ~temp1 + 1;
    assign doutim[69:60] = ~temp2 + 1;
endmodule

module multi3(
    input  [69:0] dinre,
    input  [69:0] dinim,
    output [69:0] doutre,
    output [69:0] doutim
);
    
    const3 m0(dinre[9:0],dinim[9:0],doutre[9:0],doutim[9:0]);
    const6 m1(dinre[19:10],dinim[19:10],doutre[19:10],doutim[19:10]);

    wire [9:0] temp0,temp1,temp2;
    const7 m2(dinim[29:20],dinre[29:20],doutre[29:20],temp0);
    const4 m3(dinim[39:30],dinre[39:30],doutre[39:30],temp1);
    const1 m4(dinim[49:40],dinre[49:40],doutre[49:40],temp2);
    assign doutim[29:20] = ~temp0 + 1;
    assign doutim[39:30] = ~temp1 + 1;
    assign doutim[49:40] = ~temp2 + 1;

    wire [9:0] temp3,temp4,temp5,temp6;
    const2 m5(~dinim[59:50]+10'd1,dinre[59:50],temp3,temp4);
    const5 m6(~dinim[69:60]+10'd1,dinre[69:60],temp5,temp6);
    assign doutre[59:50] = ~temp3+1;
    assign doutim[59:50] = ~temp4+1;
    assign doutre[69:60] = ~temp5+1;
    assign doutim[69:60] = ~temp6+1;
endmodule

module multi4(
    input  [69:0] dinre,
    input  [69:0] dinim,
    output [69:0] doutre,
    output [69:0] doutim
    );
    
    const4 m0(dinre[9:0],dinim[9:0],doutre[9:0],doutim[9:0]);
    const8 m1(dinre[19:10],dinim[19:10],doutre[19:10],doutim[19:10]);

    wire [9:0] temp0;
    const4 m2(dinim[29:20],dinre[29:20],doutre[29:20],temp0);
    assign doutim[29:20] = ~temp0+10'd1;

    const0 m3(dinre[39:30],dinim[39:30],doutre[39:30],doutim[39:30]);

    wire [9:0] temp1,temp2,temp3,temp4;
    const4 m4(~dinim[49:40]+10'd1,dinre[49:40],temp1,temp2);
    const8 m5(~dinim[59:50]+10'd1,dinre[59:50],temp3,temp4);
    assign doutre[49:40]=~temp1+10'd1;
    assign doutim[49:40]=~temp2+10'd1;
    assign doutre[59:50]=~temp3+10'd1;
    assign doutim[59:50]=~temp4+10'd1;

    wire [9:0] temp5;
    const4 m6(~dinre[69:60]+10'd1,dinim[69:60],doutre[69:60],temp5);
    assign doutim[69:60]=~temp5+10'd1;

endmodule

module multi5(
    input  [69:0] dinre,
    input  [69:0] dinim,
    output [69:0] doutre,
    output [69:0] doutim
    );
   // 5  10  15  20  25  30  35 
   // 5  16- 16- -16 32- 32- -32
   // 5  6   1   4   7   2   3
    const5 m0(dinre[9:0],dinim[9:0],doutre[9:0],doutim[9:0]);

    wire [9:0] temp0,temp1;
    const6 m1(dinim[19:10],dinre[19:10],doutre[19:10],temp0);
    const1 m2(dinim[29:20],dinre[29:20],doutre[29:20],temp1);
    assign doutim[19:10] = ~temp0+10'd1;
    assign doutim[29:20] = ~temp1+10'd1;

    wire [9:0] temp2,temp3;
    const4 m3(~dinim[39:30]+10'd1,dinre[39:30],temp2,temp3);
    assign doutre[39:30] = ~temp2+10'd1;
    assign doutim[39:30] = ~temp3+10'd1;

    wire [9:0] temp4,temp5;
    const7 m4(~dinre[49:40]+10'd1,dinim[49:40],doutre[49:40],temp4);
    const2 m5(~dinre[59:50]+10'd1,dinim[59:50],doutre[59:50],temp5);
    assign doutim[49:40] = ~temp4+10'd1;
    assign doutim[59:50] = ~temp5+10'd1;

    wire [9:0] temp6,temp7;
    const3 m6(dinre[69:60],dinim[69:60],temp6,temp7);
    assign doutre[69:60]=~temp6+10'd1;
    assign doutim[69:60]=~temp7+10'd1;
endmodule

module multi6(
    input  [69:0] dinre,
    input  [69:0] dinim,
    output [69:0] doutre,
    output [69:0] doutim
    );
    // 0   6   12   18   24   30   36   42 
   //  x   x   16-  -16  -16  32-  -32  48-
   //  0   6   4    2    8    2    4    6
    const6 m0(dinre[9:0],dinim[9:0],doutre[9:0],doutim[9:0]);

    wire [9:0] temp0;
    const4 m1(dinim[19:10],dinre[19:10],doutre[19:10],temp0);
    assign doutim[19:10] = ~temp0+10'd1;

    wire [9:0] temp1,temp2,temp3,temp4;
    const2 m2(~dinim[29:20]+10'd1,dinre[29:20],temp1,temp2);
    const8 m3(~dinim[39:30]+10'd1,dinre[39:30],temp3,temp4);
    assign doutre[29:20] = ~temp1+10'd1;
    assign doutim[29:20] = ~temp2+10'd1;
    assign doutre[39:30] = ~temp3+10'd1;
    assign doutim[39:30] = ~temp4+10'd1;

    wire [9:0] temp5;
    const2 m4(~dinre[49:40]+10'd1,dinim[49:40],doutre[49:40],temp5);
    assign doutim[49:40] = ~temp5+10'd1;

    wire [9:0] temp6,temp7;
    const4 m5(dinre[59:50],dinim[59:50],temp6,temp7);
    assign doutre[59:50] = ~temp6+10'd1;
    assign doutim[59:50] = ~temp7+10'd1;

    wire [9:0] temp8;
    const6 m6(dinim[69:60],dinre[69:60],temp8,doutim[69:60]);
    assign doutre[69:60] = ~temp8+10'd1;
endmodule

module multi7(
    input  [69:0] dinre,
    input  [69:0] dinim,
    output [69:0] doutre,
    output [69:0] doutim
    );
    // 0 7 14    21  28    35  42    49
    // x 7 16-  -16  32-  -32  48-  -48
    // 0 7 2     5   4     3   6     1
    const7 m0(dinre[9:0],dinim[9:0],doutre[9:0],doutim[9:0]);

    wire [9:0] temp0;
    const2 m1(dinim[19:10],dinre[19:10],doutre[19:10],temp0);
    assign doutim[19:10] = ~temp0+10'd1;

    wire [9:0] temp1,temp2;
    const5 m2(~dinim[29:20]+10'd1,dinre[29:20],temp1,temp2);
    assign doutre[29:20] = ~temp1+10'd1;
    assign doutim[29:20] = ~temp2+10'd1;

    wire [9:0] temp3;
    const4 m3(~dinre[39:30]+10'd1,dinim[39:30],doutre[39:30],temp3);
    assign doutim[39:30] = ~temp3+10'd1;

    wire [9:0] temp4,temp5;
    const3 m4(dinre[49:40],dinim[49:40],temp4,temp5);
    assign doutre[49:40] = ~temp4+10'd1;
    assign doutim[49:40] = ~temp5+10'd1;

    wire [9:0] temp6;
    const6 m5(dinim[59:50],dinre[59:50],temp6,doutim[59:50]);
    assign doutre[59:50] = ~temp6+10'd1;

    wire [9:0] temp7,temp8;
    const1 m6(dinim[69:60],~dinre[69:60]+10'd1,temp7,temp8);
    assign doutre[69:60] = ~temp7+10'd1;
    assign doutim[69:60] = ~temp8+10'd1;
endmodule
