/*
####--PASS--####
*/
// order input
module fft8(
    input [79:0] dinre,
    input [79:0] dinim,
    output [79:0] doutre,
    output [79:0] doutim
);

    wire [9:0] s0re,s0im;
    wire [9:0] s1re,s1im;
    wire [9:0] s2re,s2im;
    wire [9:0] s3re,s3im;
    wire [9:0] s4re,s4im;
    wire [9:0] s5re,s5im;
    wire [9:0] s6re,s6im;
    wire [9:0] s7re,s7im;

    assign s0re = dinre[9:0] + dinre[49:40];
    assign s0im = dinim[9:0] + dinim[49:40];

    assign s1re = dinre[9:0] + (~dinre[49:40]+1);
    assign s1im = dinim[9:0] + (~dinim[49:40]+1);

    assign s2re = dinre[29:20] + dinre[69:60];
    assign s2im = dinim[29:20] + dinim[69:60];

    assign s3re = dinim[29:20] + (~dinim[69:60]+1);
    assign s3im = dinre[69:60] + (~dinre[29:20]+1);

    assign s4re = dinre[19:10] + dinre[59:50];
    assign s4im = dinim[19:10] + dinim[59:50];
    
    assign s5re = dinre[19:10] + (~dinre[59:50]+1);
    assign s5im = dinim[19:10] + (~dinim[59:50]+1);

    assign s6re = dinre[39:30] + dinre[79:70];
    assign s6im = dinim[39:30] + dinim[79:70];

    assign s7re = dinim[39:30] + (~dinim[79:70]+1);
    assign s7im = dinre[79:70] + (~dinre[39:30]+1);

    
    wire [9:0] t0re,t0im;
    wire [9:0] t1re,t1im;
    wire [9:0] t2re,t2im;
    wire [9:0] t3re,t3im;
    wire [9:0] t4re,t4im;
    wire [9:0] t5re,t5im;
    wire [9:0] t6re,t6im;
    wire [9:0] t7re,t7im;

    assign t0re = s0re + s2re;
    assign t0im = s0im + s2im;

    assign t1re = s1re + s3re;
    assign t1im = s1im + s3im;

    assign t2re = s0re + (~s2re+1);
    assign t2im = s0im + (~s2im+1);

    assign t3re = s1re + (~s3re+1);
    assign t3im = s1im + (~s3im+1);

    assign t4re = s4re + s6re;
    assign t4im = s4im + s6im;

    wire [9:0] tempt5re;
    wire [9:0] tempt5im;
    assign tempt5re = s5re + s7re + s5im +s7im;
    assign tempt5im = s5im + s7im + (~s5re+1) + (~s7re+1);
    divsqrt2 mt5re(tempt5re,t5re);
    divsqrt2 mt5im(tempt5im,t5im);

    assign t6re = s4im + (~s6im+1);
    assign t6im = s6re + (~s4re+1);

    wire [9:0] tempt7re;
    wire [9:0] tempt7im;
    assign tempt7re = s7re + s5im + (~s5re+1) + (~s7im+1);
    assign tempt7im = s7im + s7re + (~s5im+1) + (~s5re+1);
    divsqrt2 mt7re(tempt7re,t7re);
    divsqrt2 mt7im(tempt7im,t7im);

    assign doutre[9:0] = t0re + t4re;
    assign doutim[9:0] = t0im + t4im;

    assign doutre[19:10] = t1re + t5re;
    assign doutim[19:10] = t1im + t5im;

    assign doutre[29:20] = t2re + t6re;
    assign doutim[29:20] = t2im + t6im;

    assign doutre[39:30] = t3re + t7re;
    assign doutim[39:30] = t3im + t7im;

    assign doutre[49:40] = t0re + (~t4re+1);
    assign doutim[49:40] = t0im + (~t4im+1);
    
    assign doutre[59:50] = t1re + (~t5re+1);
    assign doutim[59:50] = t1im + (~t5im+1);

    assign doutre[69:60] = t2re + (~t6re+1);
    assign doutim[69:60] = t2im + (~t6im+1);

    assign doutre[79:70] = t3re + (~t7re+1);
    assign doutim[79:70] = t3im + (~t7im+1);

endmodule

module divsqrt2(
    input  [9:0] datain,
    output [9:0] dataout
);
    assign dataout = {datain[9],datain[9:1]} + {{3{datain[9]}},datain[9:2]} + {{4{datain[9]}},datain[9:4]} + {{6{datain[9]}},datain[9:6]} + {{8{datain[9]}},datain[9:8]};
endmodule
