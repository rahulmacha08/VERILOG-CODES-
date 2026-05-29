module xnorgate(input a,b,output c);
assign c= ~(a^b);
endmodule

module xnorgate_tb;
reg a,b;
wire c;
xnorgate uut(a,b,c);
initial begin 
#5 a=0;b=0;
#5 a=1;b=0;
#5 a=0;b=1;
#5 a=1;b=1;
$stop;
end 
initial begin 
$monitor("a=0%b,b=0%b,c=0%b",a,b,c);
end 
endmodule 
