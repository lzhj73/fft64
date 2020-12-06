//  CHECKED
module multi_core_tb();
    reg [9:0] re1,re2,re3,re4,re5,re6,re7;
    reg [9:0] im1,im2,im3,im4,im5,im6,im7;
    wire [9:0] outre1,outre2,outre3,outre4,outre5,outre6,outre7;
    wire [9:0] outim1,outim2,outim3,outim4,outim5,outim6,outim7;
    multi7 m0({re1,re2,re3,re4,re5,re6,re7},{im1,im2,im3,im4,im5,im6,im7},{outre7,outre6,outre5,outre4,outre3,outre2,outre1},{outim7,outim6,outim5,outim4,outim3,outim2,outim1});

    initial begin
        re1=10'd100;
        re2=10'd100;
        re3=10'd100;
        re4=10'd100;
        re5=10'd100;
        re6=10'd100;
        re7=10'd100;
        im1=10'd0;
        im2=10'd0;
        im3=10'd0;
        im4=10'd0;
        im5=10'd0;
        im6=10'd0;
        im7=10'd0;
        #4 $finish;
    end
    initial begin
        $dumpfile("a.vcd");
        $dumpvars;
    end
endmodule