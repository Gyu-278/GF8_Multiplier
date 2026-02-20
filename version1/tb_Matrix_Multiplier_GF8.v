`timescale 1ns/100ps

module tb_Matrix_Multiplier_GF8();
    reg clk, reset;
    reg [7:0] A;
    reg [7:0] B;
    wire [7:0] result;

    Matrix_Multiplier_GF8 uut(
        .clk(clk), .reset(reset),
        .A(A),
        .B(B),
        .result(result)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        #10 reset = 1'b0;
        #10 reset = 1'b1;

        A = 8'h01; B = 8'h05;
        #10 A = 8'h02; B = 8'h06;
        #10 A = 8'h03; B = 8'h07; 
        #10 A = 8'h04; B = 8'h08;
        
        #10 A = 8'h02; B = 8'h87;
        #10 A = 8'h03; B = 8'h6E;
        #10 A = 8'h01; B = 8'h46; 
        #10 A = 8'h01; B = 8'hA6; 

        #10 A = 8'h0E; B = 8'h47;
        #10 A = 8'h0B; B = 8'h37;
        #10 A = 8'h0D; B = 8'h94; 
        #10 A = 8'h09; B = 8'hED; 

        #10 A = 8'h00; B = 8'hFF;
        #10 A = 8'h00; B = 8'hFF;
        #10 A = 8'h00; B = 8'hFF; 
        #10 A = 8'h00; B = 8'hFF; 

        #10 A = 8'h01; B = 8'hA3;
        #10 A = 8'h01; B = 8'h5C;
        #10 A = 8'h01; B = 8'h7F; 
        #10 A = 8'h01; B = 8'hC8; 

        #10 A = 8'h10; B = 8'h01;
        #10 A = 8'h20; B = 8'h02;
        #10 A = 8'h40; B = 8'h04; 
        #10 A = 8'h80; B = 8'h08; 
        
        #10 reset = 1'b0;
        #10 A = 8'h10; B = 8'h01;
        #10 A = 8'h20; B = 8'h02;
        #10 A = 8'h40; B = 8'h04; 
        #10 A = 8'h80; B = 8'h08; 
        $stop;
    end
endmodule

