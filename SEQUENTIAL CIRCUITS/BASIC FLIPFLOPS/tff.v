module tff(
           input clk,rst,t,output reg q,output q1);
// asynchronus code 
always@(posedge clk or negedge rst) begin
    if(rst)
	q<=1'b0;
	else if(t)
	  q<=~q;
	  else 
	  q<=q;
end  
/*		   // synchronus code 
always@(posedge clk) begin 
     if(rst)
	 q<=1'b0;
	else if(t)
	  q<=~t;
	 else 
	  q<=t;
  
end */ 
assign q1=~q;
endmodule

//testbench 
module tb;
reg clk,rst,t;
wire q,q1;

tff uut( clk,rst,t,q,q1);

initial begin
	clk=0;
	rst=1;
	#3;
	rst=0;
	uut.q=0;
end
always #5 clk=~clk;
initial begin 
$monitor("t=%0b,q=%0b,q1=%0b,rst=%0b,time=%0t",t,q,q1,rst,$time);
t=0;#5;
t=1;#5;
t=1;#5;
t=0;#5;
t=1;#5;
t=0;#5;
t=1;#5;
#10; $finish;
end 
endmodule
