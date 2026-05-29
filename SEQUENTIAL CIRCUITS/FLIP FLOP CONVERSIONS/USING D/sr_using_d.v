module dff(
           input clk,d,
		   output reg q
		   );
		   always @(posedge clk )begin
		    q<=d;
		   end 
endmodule 

// sr using d module 
module sr_using_d(
                  input clk,rst,s,r,
				  output q,qbar
				  );
				  wire d_in;
				  assign d_in = s|(~r&q);
				  assign qbar=~q;
	dff uut(
	       .clk(clk),
		   .d(d_in),
		   .q(q)
		   );

endmodule 

//testbench 
module tb;
reg clk,rst,s,r;
wire q,qbar;

sr_using_d uut(clk,rst,s,r,q,qbar);
initial begin 
clk=0;
rst=1;
#3 rst=0;
end 
always #5 clk=~clk;
initial begin 
s=0;r=0;
$monitor("s=%0b,r=%0b,q=%0b,qbar=%0b,t=%0t",s,r,q,qbar,$time);
#4;s=0;r=1;
#4;s=1;r=0;
#4;s=1;r=1;
#4;s=0;r=0;
#4;s=1;r=0;
#4;s=0;r=1;
#4;s=1;r=1;
$finish;
end 
endmodule
