module dff(
          input clk,rst,d,
		  output reg q,
		  output qbar
		  );
       always @(posedge clk or posedge rst) begin 
	   if(rst)
	      q<=1'b0;  // resets to zero 
		  else
		  q<=d;   // takes the input 
	   end 
	   assign qbar =~q;
endmodule 

// t using d flipflop 
module t_using_d(
                input clk,rst,t,
				output q,
				output qbar
				);
        dff uut(
		        .clk(clk),
				.rst(rst),
				.d(~t),
				.q(q),
				.qbar(qbar)
				);
endmodule
//testbench 
module tb;

reg clk,rst,t;
wire q,qbar;
t_using_d uut(clk,rst,t,q,qbar);
initial begin 
clk=0;
rst=1;
#3 rst=0;
end 
always #5 clk=~clk;
initial begin
t=0;
$monitor("t=%0b,q=%0b,qbar=%0b,time=%0t",t,q,qbar,$time);
#4;t=1;
#4;t=0;
#4;t=1;
#4;t=0;
#4;t=0;
#4;t=1;
$finish;
end 
endmodule
