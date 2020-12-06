/*
####--PASS--####
*/
module multi_core(
    input [79:0] dinre,
    input [79:0] dinim,
    input [5:0] counter,
    output reg [79:0] doutre,
    output reg [79:0] doutim
);
    wire [69:0] tempdoutre1,tempdoutim1;
    multi1 m1(.dinre(dinre[79:10]),.dinim(dinim[79:10]),.doutre(tempdoutre1),.doutim(tempdoutim1));

    wire [69:0] tempdoutre2,tempdoutim2;
    multi2 m2(.dinre(dinre[79:10]),.dinim(dinim[79:10]),.doutre(tempdoutre2),.doutim(tempdoutim2));

    wire [69:0] tempdoutre3,tempdoutim3;
    multi3 m3(.dinre(dinre[79:10]),.dinim(dinim[79:10]),.doutre(tempdoutre3),.doutim(tempdoutim3));

    wire [69:0] tempdoutre4,tempdoutim4;
    multi4 m4(.dinre(dinre[79:10]),.dinim(dinim[79:10]),.doutre(tempdoutre4),.doutim(tempdoutim4));

    wire [69:0] tempdoutre5,tempdoutim5;
    multi5 m5(.dinre(dinre[79:10]),.dinim(dinim[79:10]),.doutre(tempdoutre5),.doutim(tempdoutim5));

    wire [69:0] tempdoutre6,tempdoutim6;
    multi6 m6(.dinre(dinre[79:10]),.dinim(dinim[79:10]),.doutre(tempdoutre6),.doutim(tempdoutim6));

    wire [69:0] tempdoutre7,tempdoutim7;
    multi7 m7(.dinre(dinre[79:10]),.dinim(dinim[79:10]),.doutre(tempdoutre7),.doutim(tempdoutim7));

    always@(*)begin
        case(counter)
            6'd1: begin
                    doutre[79:10] = tempdoutre1;
                    doutim[79:10] = tempdoutim1;
            end
            6'd2: begin
                    doutre[79:10] = tempdoutre2;
                    doutim[79:10] = tempdoutim2;
            end
            6'd3: begin
                    doutre[79:10] = tempdoutre3;
                    doutim[79:10] = tempdoutim3;
            end
            6'd4: begin
                    doutre[79:10] = tempdoutre4;
                    doutim[79:10] = tempdoutim4;
            end
            6'd5: begin
                    doutre[79:10] = tempdoutre5;
                    doutim[79:10] = tempdoutim5;
            end
            6'd6: begin
                    doutre[79:10] = tempdoutre6;
                    doutim[79:10] = tempdoutim6;
            end
            6'd7: begin
                    doutre[79:10] = tempdoutre7;
                    doutim[79:10] = tempdoutim7;
            end
            default: begin
                         doutre[79:10] = dinre[79:10];
                         doutim[79:10] = dinim[79:10];
            end
        endcase
    end

    always @(*) begin
        doutre[9:0] = dinre[9:0];
        doutim[9:0] = dinim[9:0];
    end

endmodule