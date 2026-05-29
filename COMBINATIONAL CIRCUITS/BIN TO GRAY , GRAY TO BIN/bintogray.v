 module bintogray(input[3:0]b,output[3:0]g);
 assign g[3]=b[3];
 assign g[2]=b[2]^b[3];
 assign g[1]=b[1]^b[2];
 assign g[0]=b[0]^b[1];
 endmodule 

 //testbench 
 module tb;
 reg[3:0]b;
 wire[3:0]g;

 bintogray uut(b,g);
 initial begin 
 $monitor("b[0]=%0b,b[1]=%0b,b[2]=%0b,b[3]=%0b,g[0]=%0b,g[1]=%0b,g[2]=%0b,g[3]=%0b,time=%0t",b[0],b[1],b[2],b[3],g[0],g[1],g[2],g[3],$time);
 b=4'b0000;#5;
 b=4'b0010;#5;
 b=4'b0100;#5;
 b=4'b1000;#5;
 end
 endmodule
