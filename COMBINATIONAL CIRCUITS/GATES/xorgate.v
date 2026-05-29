module xorgate(input a,b,output c);
assign c = a ^b;
endmodule

module xorgate_tb;
reg a,b;
wire c;
xorgate uut(a,b,c);
initial begin 
#5 a=0;b=0;
#5 a=0;b=1;
#5 a=1;b=0;
#5 a=1;b=1;
end
initial begin 
$monitor("a=%0b,b=%0b,c=%0b",a,b,c);
end
endmodule
