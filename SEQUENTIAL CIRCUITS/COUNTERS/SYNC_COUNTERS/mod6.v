module mod6(
           input clk,rst,
		   output reg[2:0] count
		   );
    always @(posedge clk ) 
	begin 
	      if(rst)
		  count<=0;
		  else if(count==6)
		  count<=0;
		  else 
		  count<=count+1;
	end 
endmodule

//tetbench 
module tb;
reg clk,rst;
wire [2:0]count;
 mod6 uut( clk,rst,count);
 initial begin 
 clk=0;
 rst=1;
 #3 rst=0;
 end 
 always #2 clk=~clk;
 initial begin 
 $monitor("clk=%0b,count=%0d,time=%0t",clk,count,$time);
 #100 $finish;
 end 
endmodule 
