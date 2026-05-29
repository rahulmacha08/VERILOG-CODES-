module fulladd(input a,b,cin,clk,output reg sum,cout);
always@(posedge clk)begin 
 sum<=a ^ b ^ cin; 
 cout <= (a & b) | cin & (a ^ b);
 end
endmodule

//testbench 
module tb;
reg a,b,cin,clk;
wire sum,cout;

fulladd uut(a,b,cin,clk,sum,cout);
initial clk=0;

always #5 clk=~clk;
initial begin
$monitor("a=%0b,b=%0b,cin=%0b,sum=%0b,cout=%0b,time=%0t",a,b,cin,sum,cout,$time);
a=1;b=0;cin=0;#5;
a=1;b=0;cin=1;#5;
a=1;b=1;cin=0;#5;
a=1;b=1;cin=1;#5;
a=0;b=0;cin=1;#5;
#100 $finish;
end 
endmodule
