//Homework1

module GaloisMultiplier (rst, clk, mc, mi, gm_product);
input rst, clk;
input [7:0] mc, mi;
output [7:0] gm_product; 
wire [14:0] out1, out2, out3, out4;
reg [14:0] tmp1,tmp2,tmp3,tmp4;
reg [2:0] cnt;
wire [14:0] cl_product;

/*reducing poly
x8->x4+x3+x1+x0
x9->x5+x4+x2+x1
x10->x6+x5+x3+x2
x11->x7+x6+x4+x3
x12->x7+x5+x3+x1+x0
x13->x6+x3+x2+x0
x14->x7+x4+x3+x1
*/

/*Carry-less Multiplier for each 8-bit mc and mi*/
CarrylessMultiplier clm (mc, mi, cl_product);

/*reducing polynomial*/
assign out1 = tmp1[7:0] ^ ({8{tmp1[14]}} & 8'b1001_1010 ) ^ ({8{tmp1[13]}} & 8'b0100_1101 ) ^ ({8{tmp1[12]}} & 8'b1010_1011 ) ^ ( {8{tmp1[11]}}& 8'b1101_1000 ) ^ ( {8{tmp1[10]}}& 8'b0110_1100 ) ^ ( {8{tmp1[9]}}& 8'b0011_0110 ) ^ ( {8{tmp1[8]}}& 8'b0001_1011 );
assign out2 = tmp2[7:0] ^ ({8{tmp2[14]}} & 8'b1001_1010 ) ^ ({8{tmp2[13]}} & 8'b0100_1101 ) ^ ({8{tmp2[12]}} & 8'b1010_1011 ) ^ ( {8{tmp2[11]}}& 8'b1101_1000 ) ^ ( {8{tmp2[10]}}& 8'b0110_1100 ) ^ ( {8{tmp2[9]}}& 8'b0011_0110 ) ^ ( {8{tmp2[8]}}& 8'b0001_1011 );
assign out3 = tmp3[7:0] ^ ({8{tmp3[14]}} & 8'b1001_1010 ) ^ ({8{tmp3[13]}} & 8'b0100_1101 ) ^ ({8{tmp3[12]}} & 8'b1010_1011 ) ^ ( {8{tmp3[11]}}& 8'b1101_1000 ) ^ ( {8{tmp3[10]}}& 8'b0110_1100 ) ^ ( {8{tmp3[9]}}& 8'b0011_0110 ) ^ ( {8{tmp3[8]}}& 8'b0001_1011 );
assign out4 = tmp4[7:0] ^ ({8{tmp4[14]}} & 8'b1001_1010 ) ^ ({8{tmp4[13]}} & 8'b0100_1101 ) ^ ({8{tmp4[12]}} & 8'b1010_1011 ) ^ ( {8{tmp4[11]}}& 8'b1101_1000 ) ^ ( {8{tmp4[10]}}& 8'b0110_1100 ) ^ ( {8{tmp4[9]}}& 8'b0011_0110 ) ^ ( {8{tmp4[8]}}& 8'b0001_1011 );

assign gm_product = (cnt==3'd0) ? (out1[7:0] ^ out2[7:0] ^ out3[7:0] ^ out4[7:0]) : 8'd0;

always@ (posedge clk or negedge rst) begin	
	if(!rst) begin 
		cnt<=0;
	end
	
	else begin	
		case(cnt)
			3'd0: begin cnt<=3'd1; tmp1<=cl_product; end
			3'd1: begin cnt<=3'd2; tmp2<=cl_product; end
			3'd2: begin cnt<=3'd3; tmp3<=cl_product; end
			3'd3: begin cnt<=3'd0; tmp4<=cl_product; end
			default: cnt<=3'd0;
		endcase	
	end
	
end

endmodule