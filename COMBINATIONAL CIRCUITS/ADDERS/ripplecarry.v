//top level module
module rca(input[2:0]a,b,input cin,output[2:0]sum,output cout);
wire w1,w2;

fulladd f1(a[0],b[0],cin,sum[0],w1);
fulladd f2(a[1],b[1],w1,sum[1],w2);
fulladd f3(a[2],b[2],w2,sum[2],cout);
endmodule

//lower level module which is full adder
module fulladd(input a,b,cin,output sum,cout);
assign {cout,sum}= a+b+cin;
endmodule

//testbench
module rca_tb;
reg[2:0]a,b;
reg cin;
wire[2:0]sum;
wire cout;

rca uut(a,b,cin,sum,cout);
initial begin 
repeat(10)begin
$monitor("a[0]=%0b,a[1]=%0b,b[0]=%0b,b[1]=%0b,cin=%0b,sum=%0b,cout=%0b",a[0],a[1],b[0],b[0],cin,sum,cout);
{a,b,cin} = $random;#5;
end 
end 
endmodule

