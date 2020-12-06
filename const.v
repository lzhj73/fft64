/*
####--PASS--####
*/
module const1re(
    input [9:0] in,
    output [9:0] out
);
    assign out = in + (~{{8{in[9]}},in[9:8]}+1);
endmodule

module const1im(
    input [9:0] in,
    output [9:0] out
);
    assign out = ~({{4{in[9]}},in[9:4]} + {{5{in[9]}},in[9:5]} + {{8{in[9]}},in[9:8]}) + 1;
endmodule

module const2re(
    input [9:0] in,
    output [9:0] out
);
    assign out = in + (~{{6{in[9]}},in[9:6]}+1) + (~{{8{in[9]}},in[9:8]}+1);
endmodule

module const2im(
    input [9:0] in,
    output [9:0] out
);
    assign out = ~({{3{in[9]}},in[9:3]} + {{4{in[9]}},in[9:4]} + {{7{in[9]}},in[9:7]}) + 1;
endmodule

module const3re(
    input [9:0] in,
    output [9:0] out
);
    assign out = in + (~{{5{in[9]}},in[9:5]}+1) + (~{{7{in[9]}},in[9:7]}+1) + (~{{8{in[9]}},in[9:8]}+1);
endmodule

module const3im(
    input [9:0] in,
    output [9:0] out
);
    assign out = ~({{2{in[9]}},in[9:2]} + {{5{in[9]}},in[9:5]} + {{7{in[9]}},in[9:7]}) + 1;
endmodule

module const4re(
    input [9:0] in,
    output [9:0] out
);
    assign out = in + (~{{4{in[9]}},in[9:4]}+1) + (~{{7{in[9]}},in[9:7]}+1) + (~{{8{in[9]}},in[9:8]}+1);
endmodule

module const4im(
    input [9:0] in,
    output [9:0] out
);
    assign out = ~({{2{in[9]}},in[9:2]} + {{3{in[9]}},in[9:3]} + {{7{in[9]}},in[9:7]}) + 1;
endmodule

module const5re(
    input [9:0] in,
    output [9:0] out
);
    assign out = in + (~{{3{in[9]}},in[9:3]}+1) + (~{{7{in[9]}},in[9:7]}+1);
endmodule

module const5im(
    input [9:0] in,
    output [9:0] out
);
    assign out = -({in[9],in[9:1]} + (~{{5{in[9]}},in[9:5]}+1) + {{9{in[9]}},in[9]}) + 1;
endmodule

module const6re(
    input [9:0] in,
    output [9:0] out
);
    assign out = in + (~{{3{in[9]}},in[9:3]}+1) + (~{{5{in[9]}},in[9:5]}+1) + (~{{6{in[9]}},in[9:6]}+1) + {{8{in[9]}},in[9:8]};
endmodule

module const6im(
    input [9:0] in,
    output [9:0] out
);
    assign out = ~({in[9],in[9:1]} + {{4{in[9]}},in[9:4]} + (~{{7{in[9]}},in[9:7]}+1)) + 1;
endmodule

module const7re(
    input [9:0] in,
    output [9:0] out
);
    assign out = in + (~{{2{in[9]}},in[9:2]}+1) + {{6{in[9]}},in[9:6]} + {{7{in[9]}},in[9:7]};
endmodule

module const7im(
    input [9:0] in,
    output [9:0] out
);
    assign out =~({in[9],in[9:1]} + {{3{in[9]}},in[9:3]} + {{7{in[9]}},in[9:7]}) + 1;
endmodule

module const8re(
    input [9:0] in,
    output [9:0] out
);
    assign out = {in[9],in[9:1]} + {{3{in[9]}},in[9:3]} + {{4{in[9]}},in[9:4]} + {{6{in[9]}},in[9:6]} + {{8{in[9]}},in[9:8]};
endmodule

module const8im(
    input [9:0] in,
    output [9:0] out
);
    assign out = ~({in[9],in[9:1]} + {{3{in[9]}},in[9:3]} + {{4{in[9]}},in[9:4]} + {{6{in[9]}},in[9:6]} + {{8{in[9]}},in[9:8]})+10'd1;
endmodule

module const0(
    input [9:0] dinre,
    input [9:0] dinim,
    output [9:0] doutre,
    output [9:0] doutim
);
    assign doutre = dinim;
    assign doutim = ~dinre + 10'd1;
endmodule

module const1(
    input [9:0] dinre,
    input [9:0] dinim,
    output [9:0] doutre,
    output [9:0] doutim
);
    wire [9:0] temp0,temp1;
    const1re m0(dinre,temp0);
    const1im m1(dinim,temp1);
    assign doutre = temp0 + (~temp1+1);
    wire [9:0] temp2,temp3;
    const1re m2(dinim,temp2);
    const1im m3(dinre,temp3);
    assign doutim = temp2 + temp3;
endmodule

module const2(
    input [9:0] dinre,
    input [9:0] dinim,
    output [9:0] doutre,
    output [9:0] doutim
);
    wire [9:0] temp0,temp1;
    const2re m0(dinre,temp0);
    const2im m1(dinim,temp1);
    assign doutre = temp0 + (~temp1+1);
    wire [9:0] temp2,temp3;
    const2re m2(dinim,temp2);
    const2im m3(dinre,temp3);
    assign doutim = temp2 + temp3;
endmodule

module const3(
    input [9:0] dinre,
    input [9:0] dinim,
    output [9:0] doutre,
    output [9:0] doutim
);
    wire [9:0] temp0,temp1;
    const3re m0(dinre,temp0);
    const3im m1(dinim,temp1);
    assign doutre = temp0 + (~temp1+1);
    wire [9:0] temp2,temp3;
    const3re m2(dinim,temp2);
    const3im m3(dinre,temp3);
    assign doutim = temp2 + temp3;
endmodule

module const4(
    input [9:0] dinre,
    input [9:0] dinim,
    output [9:0] doutre,
    output [9:0] doutim
);
    wire [9:0] temp0,temp1;
    const4re m0(dinre,temp0);
    const4im m1(dinim,temp1);
    assign doutre = temp0 + (~temp1+1);
    wire [9:0] temp2,temp3;
    const4re m2(dinim,temp2);
    const4im m3(dinre,temp3);
    assign doutim = temp2 + temp3;
endmodule

module const5(
    input [9:0] dinre,
    input [9:0] dinim,
    output [9:0] doutre,
    output [9:0] doutim
);
    wire [9:0] temp0,temp1;
    const5re m0(dinre,temp0);
    const5im m1(dinim,temp1);
    assign doutre = temp0 + (~temp1+1);
    wire [9:0] temp2,temp3;
    const5re m2(dinim,temp2);
    const5im m3(dinre,temp3);
    assign doutim = temp2 + temp3;
endmodule

module const6(
    input [9:0] dinre,
    input [9:0] dinim,
    output [9:0] doutre,
    output [9:0] doutim
);
    wire [9:0] temp0,temp1;
    const6re m0(dinre,temp0);
    const6im m1(dinim,temp1);
    assign doutre = temp0 + (~temp1+1);
    wire [9:0] temp2,temp3;
    const6re m2(dinim,temp2);
    const6im m3(dinre,temp3);
    assign doutim = temp2 + temp3;
endmodule

module const7(
    input [9:0] dinre,
    input [9:0] dinim,
    output [9:0] doutre,
    output [9:0] doutim
);
    wire [9:0] temp0,temp1;
    const7re m0(dinre,temp0);
    const7im m1(dinim,temp1);
    assign doutre = temp0 + (~temp1+1);
    wire [9:0] temp2,temp3;
    const7re m2(dinim,temp2);
    const7im m3(dinre,temp3);
    assign doutim = temp2 + temp3;
endmodule

module const8(
    input [9:0] dinre,
    input [9:0] dinim,
    output [9:0] doutre,
    output [9:0] doutim
);
    wire [9:0] temp0,temp1;
    const8re m0(dinre,temp0);
    const8im m1(dinim,temp1);
    assign doutre = temp0 + (~temp1+1);
    wire [9:0] temp2,temp3;
    const8re m2(dinim,temp2);
    const8im m3(dinre,temp3);
    assign doutim = temp2 + temp3;
endmodule

