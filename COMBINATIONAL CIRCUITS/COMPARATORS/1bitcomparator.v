// dataflow (two one bit inputs)
module comp(input a,b,output l,g,e);
assign e = ~(a^b); // here a = b 
assign l= (~a&b); // here a<b
assign g = (a&~b); // here a>b
endmodule 

//testbench 
module comp_tb;
reg a,b;
wire l,g,e;

comp uut(a,b,l,g,e);
initial begin
$monitor("a=%0b,b=%0b,l=%0b,g=%0b,e=%0b",a,b,l,g,e);
a=0;b=0;#5;
a=0;b=1;#5;
a=1;b=0;#5;
a=1;b=1;#5;

end 
endmodule
