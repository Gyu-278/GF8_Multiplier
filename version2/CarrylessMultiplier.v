//carry less
/*VERIFIED*/
module CarrylessMultiplier (mc, mi, product);

input [7:0] mc,mi; 
output [14:0] product; 

assign product[14] = mc[7] & mi[7] ; //c14=a7b7
assign product[13] = (mc[6] & mi[7]) ^ (mc[7]&mi[6]);
assign product[12] = (mc[5]&mi[7]) ^ (mc[6]&mi[6]) ^ (mc[7]&mi[5]) ;
assign product[11] = (mc[4]&mi[7]) ^ (mc[5]&mi[6]) ^ (mc[6]&mi[5]) ^ (mc[7]&mi[4]) ;
assign product[10] = (mc[3]&mi[7]) ^ (mc[4]&mi[6]) ^ (mc[5]&mi[5]) ^ (mc[6]&mi[4]) ^ (mc[7]&mi[3]) ;
assign product[9] = (mc[2]&mi[7]) ^ (mc[3]&mi[6]) ^ (mc[4]&mi[5]) ^ (mc[5]&mi[4]) ^ (mc[6]&mi[3]) ^ (mc[7]&mi[2]);
assign product[8] = (mc[1]&mi[7]) ^ (mc[2]&mi[6]) ^ (mc[3]&mi[5]) ^ (mc[4]&mi[4]) ^ (mc[5]&mi[3]) ^ (mc[6]&mi[2]) ^ (mc[7]&mi[1]); 

assign product[7] =(mc[0]&mi[7]) ^(mc[1]&mi[6]) ^(mc[2]&mi[5]) ^(mc[3]&mi[4]) ^(mc[4]&mi[3]) ^(mc[5]&mi[2]) ^(mc[6]&mi[1]) ^(mc[7]&mi[0]);
assign product[6] =(mc[0]&mi[6]) ^(mc[1]&mi[5]) ^(mc[2]&mi[4]) ^(mc[3]&mi[3]) ^(mc[4]&mi[2]) ^(mc[5]&mi[1]) ^(mc[6]&mi[0]);
assign product[5] =(mc[0]&mi[5]) ^(mc[1]&mi[4]) ^(mc[2]&mi[3]) ^(mc[3]&mi[2]) ^(mc[4]&mi[1]) ^(mc[5]&mi[0]);
assign product[4] =(mc[0]&mi[4]) ^(mc[1]&mi[3]) ^(mc[2]&mi[2]) ^(mc[3]&mi[1]) ^(mc[4]&mi[0]);
assign product[3] =(mc[0]&mi[3]) ^(mc[1]&mi[2]) ^(mc[2]&mi[1]) ^(mc[3]&mi[0]);
assign product[2] =(mc[0]&mi[2]) ^(mc[1]&mi[1]) ^(mc[2]&mi[0]);
assign product[1] =(mc[0]&mi[1]) ^(mc[1]&mi[0]);
assign product[0] =(mc[0]&mi[0]);//c0

endmodule
