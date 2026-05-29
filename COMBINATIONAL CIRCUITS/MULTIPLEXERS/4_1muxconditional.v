module muxcon(input a,b,c,d,s0,s1,output y);
assign y = s0?(s1?d:c):(s1?b:a);
endmodule 

//testbench 

module tb;
reg a,b,c,d,s0,s1;
wire y;

muxcon uut(a,b,c,d,s0,s1,y);
initial begin
$monitor("a=%0d,b=%0d,c=%0d,d=%0d,s0=%0b,s1=%0b,y=%0d",a,b,c,d,s0,s1,y);
a=0;b=1;c=2;d=3;
s0=0;s1=0;#5;
s0=0;s1=1;#5;
s0=1;s1=0;#5;
s0=1;s1=1;#5;

end 
endmodule 

