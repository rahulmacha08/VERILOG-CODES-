module dff(
           input clk,d,rst,
		   output reg q
		   );
		   always @(posedge clk) begin
           if(rst)
		   q<=0;
		   else
		   q<=d;
		   end 
endmodule
// jk using d 

module jk_using_d(
                 input clk,rst,j,k,
				 output  q,
				 output qbar
				 );
				// assign qbar =~q;
       wire d_in;
	   assign d_in = j&qbar |~k&q;  //  equation for d to behave like jk
  dff uut(
          .clk(clk),
		  .rst(rst),
		  .d(d_in),
		  .q(q)
		  );
endmodule

//testbench 
module tb;
reg clk,rst,j,k;
wire q,qbar;

jk_using_d uut(clk,rst,j,k,q,qbar);
initial begin 
clk=0;
rst=1;
#10 rst=0;
end 
always #5 clk=~clk;
initial begin 
j=0;k=0;
$monitor("j=%0b,k=%0b,q=%0b,qbar=%0b,t=%0t",j,k,q,qbar,$time);
#3;j=1;k=0;
#3;j=0;k=1;
#3;j=1;k=1;
#3;j=0;k=1;
#3;j=0;k=0;
#3;j=1;k=0;
 #100 $finish;
end
endmodule 
