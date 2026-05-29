module tff(
          input clk,rst,t,
		  output reg q,
		  output qbar
		  );
		  always @(posedge clk or posedge rst) begin 
		  if(rst)
		  q<=0;
		  else if(t)
		  q<=~q;
		  else 
		  q<=q;
		  end 
		  assign qbar=~q;
endmodule 

// jk using tff
module jk_using_t(
                  input clk,rst,j,k,
				  output q,qbar);
wire d_in;
assign qbar=~q;
assign d_in = j&qbar|k&q;
 tff uut(
        .clk(clk),
		.rst(rst),
		.t(d_in),
		.q(q),
		.qbar(qbar)
		);
endmodule 
//testbench 
module tb;
reg clk,rst,j,k;
wire q,qbar;

jk_using_t uut( clk,rst,j,k,q,qbar);
initial begin 
clk=0;
rst=1;
#3 rst=0;
end 
always #5 clk=~clk;
initial begin 
j=0;k=0;
$monitor("j=%0b,k=%0b,q=%0b,qbar=%0b,time=%0t",j,k,q,qbar,$time);
#3;j=0;k=1;
#3;j=1;k=0;
#3;j=1;k=1;
#3;j=0;k=1;
#3;j=1;k=0;
$finish;
end
endmodule 
