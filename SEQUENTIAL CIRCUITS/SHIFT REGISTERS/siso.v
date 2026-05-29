module siso(
            input clk,rst,si,
			output  so
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
assign so=q[0];
endmodule 
//testbench 
module tb;
reg clk,rst,si;
wire so;
 
siso uut(clk,rst,si,so);
initial begin 
clk=0;
rst=1;
#15 rst=0;
end 
always #5 clk=~clk;
initial begin
$monitor("si=%0b,so=%0b,t=%0t",si,so,$time);
#10 si=0;
#10 si=1;
#10 si=1;
#10 si=0;
#10 si=1;
#10 si=0;
 #100 $finish;
end 
endmodule 
