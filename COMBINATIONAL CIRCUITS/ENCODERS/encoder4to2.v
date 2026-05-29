module encoder4to2(input [3:0]i,output y0,y1);
assign y0= i[2] | i[3];
assign y1= i[1] |i[3];
// or gate1(y0,i[2],i[3]);
// or gate2(y1,i[1],i[3]);
endmodule 

// testbench 
module testb;

reg [3:0]i;
wire y0,y1;

encoder4to2 uut(i,y0,y1);

initial begin 
repeat(6) begin 
{i} = $random; #5;
$monitor("i=%0d,y0=%0d,y1=%0d",i,y0,y1);
end 
end 
endmodule
