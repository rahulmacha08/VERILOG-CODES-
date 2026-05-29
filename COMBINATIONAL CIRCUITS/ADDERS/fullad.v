module fulladder(input a,b,cin,output sum,cout);
assign sum=a^b^cin;   // using operators also we cab do 
assign cout=((a&b)|(b&cin)|(a&cin));  // assign {cout,sum}=a+b+cin;
endmodule 


module ftb;

reg a,b,cin;
wire sum,cout;

// design instantiation
fulladder uut(a,b,cin,sum,cout);
initial begin 
$monitor("a=%0d,b=%0d,cin=%0d,sum=%0d,cout=%0d",a,b,cin,sum,cout);
a=0;b=0;cin=0;
#5 a=0;b=0;cin=1;
#5 a=0;b=1;cin=0;
#5 a=0;b=1;cin=1;
#5 a=1;b=0;cin=0;
#5 a=1;b=0;cin=1;

end

endmodule
