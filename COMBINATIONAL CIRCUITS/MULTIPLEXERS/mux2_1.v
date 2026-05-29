module mux2_1(input a,b,s1,output c);
assign c= s1?b:a;
endmodule

module mux2_1_tb;
reg a,b,s1;
wire c;
mux2_1 uut(a,b,s1,c);
initial begin 
   a=0;b=0;s1=0;
#5 a=0;b=1;s1=0;
#5 a=1;b=0;s1=1;
#5 a=1;b=1;s1=1;
$stop;
$monitor("a=%0d,b=%0d,s1=%0d,c=%0d",a,b,s1,c);
 
end 
endmodule
