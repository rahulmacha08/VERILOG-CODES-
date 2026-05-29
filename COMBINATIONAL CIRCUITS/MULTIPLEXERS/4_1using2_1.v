module mux(input a,b,s1,output y);
assign y=s1?b:a;
endmodule

// 4x1 using 2x1 
// top level module 
module mux_4(input a,b,c,d,s0,s1,output y);
wire w1,w2;
mux mux1(a,b,s0,w1);
mux mux2(c,d,s0,w2);
mux mux3(w1,w2,s1,y);
endmodule 

// testbench 
module tb;
reg a,b,c,d,s0,s1;
wire y;

mux_4 uut(a,b,c,d,s0,s1,y);
initial begin 
$monitor("a=%0b,b=%0b,c=%0b,d=%0b,s0=%0b,s1=%0b,y=%0b",a,b,c,d,s0,s1,y);
s0=0;s1=0;#5;
s0=0;s1=1;#5;
s0=1;s1=0;#5;
s0=1;s1=1;#5;
$stop;
end 
endmodule 


