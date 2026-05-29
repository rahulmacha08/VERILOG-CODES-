module sipo(
            input clk,rst,si,
			output  [3:0] po
			);
            reg[3:0]q;
			always @(posedge clk ) begin 
			if(rst)
			q<=4'b0000;
			else begin 
            q[3]<=si;
            q[2]<=q[3];
            q[1]<=q[2];
            q[0]<=q[1];
			end 
			end 
assign po = {q[0],q[1],q[2],q[3]};
endmodule 
//testbench 
module tb;
reg clk,rst,si;
wire [3:0]po;
 
sipo uut(clk,rst,si,po);
initial begin 
clk=0;
rst=1;
#15 rst=0;
end 
always #5 clk=~clk;
initial begin
$monitor("si=%0b,po=%0b,t=%0t",si,po,$time);
#10 si=0;
#10 si=1;
#10 si=1;
#10 si=0;
#10 si=1;
#10 si=0;
 #100 $finish;
end 
endmodule 
