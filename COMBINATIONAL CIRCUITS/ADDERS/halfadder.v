module halfadder(input a,b, output sum, cout);

assign sum = a^b; // we can also write as 
assign cout = a&b; // assign {cout,sum}= a+b;
endmodule

module tb;
reg a,b;
wire sum,cout;
halfadder uut(a,b,sum,cout);
initial begin 
$monitor("a=%0d,b=%0d,sum=%0d,cout=%0d",a,b,sum,cout);
   a=0;b=0;
#5 a=0;b=1;
#5 a=1;b=0;
#5 a=1;b=1;

end 
endmodule
