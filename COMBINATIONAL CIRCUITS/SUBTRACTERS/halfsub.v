module halfsub(input a,b,output diff,borrow);
assign diff = a^b;
assign borrow = ~a & b;
endmodule

// testbench 
module tb;
reg a,b;
wire diff,borrow;

halfsub uut(a,b,diff,borrow);

initial  begin 
$monitor("a=%0b,b=%0b,diff=%0b,borrow=%0b,time=%0t",a,b,diff,borrow,$time);
a=0;b=0;#5;
a=0;b=1;#5;
a=1;b=0;#5;
a=1;b=1;#5;
$stop;
end 
endmodule
