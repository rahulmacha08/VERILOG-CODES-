module half(input a,b,clk,output reg sum,carry);
always@(posedge clk)begin 
sum=a^b;
carry=a&b;
end 
endmodule

//testbench  
module tb;
reg[3:0] a,b;
reg clk;
wire sum,carry;


half uut(a,b,clk,sum,carry);
initial clk=0;
always #5 clk=~clk;
initial begin 
$monitor("a=%0b,b=%0b,sum=%0b,carry=%0b,time=0%t",a,b,sum,carry,$time);
a=0;b=0;#5;
a=1;b=0;#5;
a=0;b=1;#5;
a=1;b=1;#5;
#100 $finish;
end
endmodule
