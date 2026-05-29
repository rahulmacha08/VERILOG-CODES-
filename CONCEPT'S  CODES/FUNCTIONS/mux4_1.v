module mux4_1(
              input a,b,c,d,
			  input  [1:0] sel,
			  output  y
			  );
`include"muxfn.v"
/* function mux;
input i0,i1,sel;
reg y;
begin 
y= sel?i1:i0;
mux=y;
end 
endfunction  */ 


 wire out1,out2;
 assign out1 = mux(a,b,sel[0]),
        out2 = mux(c,d,sel[0]),
		 y  = mux(out1,out2,sel[1]) ;
endmodule 

// testbench
module tb;
reg a,b,c,d;
reg[1:0] sel;
wire y ;

mux4_1 uut( a,b,c,d,sel,y);
initial begin 
a=0;b=0;c=0;d=0;
$monitor("sel[0]=%0b,sel[1]=%0b,y=%0b,time=%0t",sel[0],sel[1],y,$time);
sel= 2'b00; #5;
sel= 2'b01; #5;
sel =2'b10; #5;
sel =2'b11; #5;
#50 $finish;
end 
endmodule
