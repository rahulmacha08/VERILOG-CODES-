module updown(
             input clk,rst,m,
			 output reg[3:0] count
			 );
  always @(posedge clk)
         begin 
		 if(rst)
		 count<=0;
		 else 
		 begin 
		    case(m)
			1'b0:count<=count+1;
			1'b1:count<=count-1;
			default:$display("invalid input");
			endcase
		 end 
		 end 
endmodule 

//testbench 
module tb;
reg clk,rst,m;
wire [3:0]count;
 //inst
 updown uut( clk,rst,m,count);
initial begin 
clk=0;
rst=1;
#3 rst=0;
end 
always #2 clk=~clk;
initial begin 
$monitor("clk=%0b,m=%0d,count=%0d,time=%0t",clk,m,count,$time);
m=1;
#20; m=0;
#20;m=1;
#100 $finish;
end 
endmodule 
