module pipo(
            input clk,rst,
			input [3:0] p_in,
			output reg[3:0] p_out
            );
   always @(posedge clk or posedge rst) begin 
    if(rst) 
	 p_out<=4'b0000;
	 else 
	 p_out<=p_in;
   end 
endmodule 

//testbench 
module tb;
reg clk,rst;
reg[3:0] p_in;
wire[3:0] p_out;

//instantiation 
pipo uut(clk,rst,p_in,p_out);
initial begin 
clk=0;
rst=1;
#50 rst=0;
p_in = 4'b0000;
end 
always #5 clk=~clk;
initial begin
$monitor("p_in=%0b,p_out=%0b,time=%0t",p_in,p_out,$time);
fork
#10 @(negedge clk) p_in=4'b1101;
#10 @(negedge clk) p_in=4'b1001;
#10 @(negedge clk) p_in=4'b1010;
#10 @(negedge clk) p_in=4'b1111; 
begin
#100; 
end 
join 
$finish;
end 
endmodule 
