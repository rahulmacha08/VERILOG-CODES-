module cla(input[3:0]a,b,input cin,output[3:0]sum,output cout);
wire[3:0]p,g;
assign p=a^b;
assign g=a&b;
wire c1,c2,c3;
// assigning signals for internal carries generated 
assign c1=g[0]|p[0]&cin;
assign c2=g[1]|p[1]&c1;
assign c3=g[2]|p[2]&c2;
assign c4=g[3]|p[3]&c3;
assign cout=c4;
// assigning signals for internal sums
assign sum[0]=a[0]^b[0]^cin;
assign sum[1]=a[1]^b[1]^c1;
assign sum[2]=a[2]^b[2]^c2;
assign sum[3]=a[3]^b[3]^c3;
endmodule

//testbench 
module tb;
reg[3:0]a,b;
reg cin;
wire[3:0]sum;
wire cout;

cla uut(a,b,cin,sum,cout);
initial begin 
repeat(10)begin 
$monitor("a=%0b,b=%0b,cin=%0b,sum=%0b,cout=%0b",a,b,cin,sum,cout);
{a,b,cin}=$random;#5;
end 
end
endmodule

