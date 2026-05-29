module ringcounter(
                   input clk,rst, 
				   output reg [3:0] count
				   );

always @(posedge clk or posedge rst ) begin 
    if(rst)
	   count<=4'b0001;
	else 
	count<=({count[2:0],count[3]});
end
endmodule
 //testbench 
 module tb;
reg clk,rst;
wire [3:0] count;

ringcounter uut(clk,rst,count);
initial begin 
clk=0;
rst=1;
#13 rst= 0;
end 
always #5 clk=~clk;
initial begin 
$monitor("count=%0b,clk=%0b,rst=%0b,time=%0t",count,clk,rst,$time);
 #100 $finish;
end 
endmodule 
