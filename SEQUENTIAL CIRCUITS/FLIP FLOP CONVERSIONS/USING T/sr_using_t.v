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
// sr using t 
module sr_using_t(
                  input clk,rst,s,r,
				  output q,qbar);
wire d_in;
assign qbar=~q;
assign d_in = s&qbar|r&q; // equation for converstion 
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
reg clk,rst,s,r;
wire q,qbar;

sr_using_t uut( clk,rst,s,r,q,qbar);

initial begin 
clk=0;
rst=1;
#3 rst =0;
end 

always #5 clk=~clk;
initial begin 
s=0;r=0;
$monitor("s=%0b,r=%0b,q=%0b,qbar=%0b,t=%0t",s,r,q,qbar,$time);
#3;s=0;r=1;
#3;s=1;r=0;
#3;s=1;r=1;
#3;s=1;r=0;
#3;s=0;r=1;
$finish;
end 
endmodule 
