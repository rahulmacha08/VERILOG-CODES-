module srff(
            input clk,rst,s1,r1,
			output reg q,
			output qbar
			);
			initial q=1'b0;
			always @(posedge clk or posedge rst) begin 
			    if(rst)
				 q<=1'b0;
				 else begin 
				       case({s1,r1})
					        2'b00:q<=q;
					        2'b01:q<=0;
					        2'b10:q<=1;
					        2'b11:q<=1'bx;
					   endcase
				 end 
			end 
			assign qbar=~q;
endmodule

//now jk module using sr 
module jk_using_sr(
                  input clk,rst,j,k,
				  output q,
				  output qbar
				  );

     wire s,r;
     assign s=j&qbar;
	 assign r=k&q;

srff uut(
        .clk(clk),
		.rst(rst),
		.s1(s),
		.r1(r),
		.q(q),
		.qbar(qbar)
		);

endmodule

//testbench 
module tb;
reg clk,rst,j,k;
wire q,qbar;

jk_using_sr uut(clk,rst,j,k,q,qbar);

initial begin 
clk=0;
rst=1;
#10 rst =0;
end 
always #5 clk=~clk;
initial begin
$monitor("j=%0b,k=%0b,clk=%0b,q=%0b,qbar=%0b,time=%0t",j,k,clk,q,qbar,$time);
j=0;k=0;
#10;j=1;k=0;
#10;j=0;k=1;
#10;j=1;k=1;
#10;j=1;k=0;
#10;j=0;k=1;
#10;j=0;k=0;
#70;
$finish;
end 
endmodule
