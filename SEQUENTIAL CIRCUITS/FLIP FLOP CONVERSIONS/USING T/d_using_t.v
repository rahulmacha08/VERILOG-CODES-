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
endmodule 
// d using tff
module d_using_t(
                 input clk,rst,d,
				 output q,qbar
				 );
assign qbar=~q;
wire d_in;
assign d_in = d&qbar|~d&q;

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
reg clk,rst,d;
wire q,qbar;
d_using_t uut(clk,rst,d,q,qbar);
initial begin 
clk=0;
rst=1;
#3 rst=0;
end 
always #5 clk=~clk;
initial begin 
d=0;
$monitor("d=%0b,q=%0b,qbar=%0b,t=%0t",d,q,qbar,$time);
#3;d=1;
#3;d=1;
#3;d=0;
#3;d=1;
#3;d=1;
#3;d=0;
$finish;
end
endmodule 
