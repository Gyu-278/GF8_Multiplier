module GF8_Multiplier(
    input  [7:0] A,
    input  [7:0] B,
    output reg [7:0] product
);
    integer i;
    reg [7:0] temp_A;
    reg [7:0] temp_B;
    reg [7:0] p;

    always @(*) begin
        temp_A = A;
        temp_B = B;
        p = 8'h00;

        for (i = 0; i < 8; i = i + 1) begin
            
            if (temp_B[0] == 1'b1) begin
                p = p ^ temp_A;
            end

            
            if (temp_A[7] == 1'b1) begin
            
                temp_A = (temp_A << 1) ^ 8'h1B;
            end else begin
            
                temp_A = temp_A << 1;
            end
            
            
            temp_B = temp_B >> 1;
        end
        product = p;
    end
endmodule



