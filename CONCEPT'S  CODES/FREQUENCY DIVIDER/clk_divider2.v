module clkdiv(
              input clk_in, 
			  input rst,
			  output  reg clk_out
			  );
       always@(posedge clk_in or posedge  rst) begin 
	    if(rst)
		clk_out <=0;
		else 
		clk_out <= ~clk_out;
	   end 
endmodule 
//testbench 
module tb;
reg clk_in ,rst;
wire clk_out;

clkdiv uut(clk_in , rst , clk_out);
initial  begin 
clk_in =0;
rst = 1;
#20 rst = 0;
end 
always #5 clk_in = ~clk_in;
initial begin 
$monitor("clk_in = %0b , | clk_out = %0b,time=%0t ",clk_in,clk_out,$time);
#50 $finish;
end 
endmodule 
