module sync_counter(
                   input clk,
				   input rst,
				   output reg[3:0] count);
initial count=0;
          always @(posedge clk or negedge rst) 
          begin
		        if(rst)
				count<=1'b0;
				else if(count==14)
				count<=1'b0;
				else 
				count<=count+1;
		  end 
endmodule 

//testbench 
module tb;
reg clk,rst;
wire [3:0]count;
// instantiation 
sync_counter uut(clk,rst,count);
initial begin 
clk=0;
rst=1;
#10 rst=0;
end 
always #2 clk=~clk;
initial begin 
$monitor("clk=%0b,rst=%0b,count=%0d,time=%0t",clk,rst,count,$time);
#100 $finish;
end 
endmodule 
