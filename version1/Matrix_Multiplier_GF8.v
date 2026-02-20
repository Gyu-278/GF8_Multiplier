module Matrix_Multiplier_GF8(
    reset,clk,A,B,result
);
    input reset, clk;
    input [7:0] A, B;
    output [7:0] result;
    wire [15:0] product;
    reg [15:0] temp1, temp2, temp3, temp4;
    reg [2:0] cnt;


    GF8_Multiplier mul(.A(A), .B(B), .product(product));


    always @(posedge clk, negedge reset) begin
        if (!reset) begin
            cnt <= 0;
            temp1 <= 0;
            temp2 <= 0;
            temp3 <= 0;
            temp4 <= 0;
        end

        else begin
            case (cnt)
                2'd0 : begin cnt <= 2'd1 ; temp1 <= product; end
                2'd1 : begin cnt <= 2'd2 ; temp2 <= product; end
                2'd2 : begin cnt <= 2'd3 ; temp3 <= product; end
                2'd3 : begin cnt <= 2'd0 ; temp4 <= product; end
                default: cnt <=0;
            endcase
        end    
    end


    assign result = {cnt == 2'd0} ? {temp1 ^ temp2 ^ temp3 ^ temp4} : 16'd0;

endmodule



