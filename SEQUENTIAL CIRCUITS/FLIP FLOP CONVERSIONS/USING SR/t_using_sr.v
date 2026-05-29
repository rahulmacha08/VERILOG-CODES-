module srff(
           input clk,rst,s,r,
		   output reg q,
		   output qbar
		   );
         always @(posedge clk or posedge rst) begin 
		    if(rst)
			q<=0;
			else begin
			    case({s,r})
				2'b00:q<=q;
				2'b01:q<=0;
				2'b10:q<=1;
				2'b11:q<=1'bx;
				endcase
			end
		 end 
		 assign qbar=~q;
endmodule

//t_using_srff

module t_using_srff(
                   input clk,rst,t,
				   output q,qbar
				   );
				  wire s,r;
				  assign s= t &qbar;
				  assign r = t &q;
   	srff uut(
	        .clk(clk),
			.rst(rst),
			.s(s),
			.r(r),
			.q(q),
			.qbar(qbar)
			);
endmodule
//testbench 
module tb;
reg clk,rst,t;
wire q,qbar;

t_using_srff uut(clk,rst,t,q,qbar);

initial begin 
clk=0;
rst=1;
#5 rst=0;
end 
always #5 clk=~clk;
initial begin 
$monitor("t=%0b,clk=%0b,q=%0b,qbar=%0b,t=%0t",t,clk,q,qbar,$time);
t=0;
#5;t=1;
#5;t=0;
#5;t=1;
#5;t=0;
#5;t=0;
#5;t=1;
#30;
$finish;
end 
endmodule 
