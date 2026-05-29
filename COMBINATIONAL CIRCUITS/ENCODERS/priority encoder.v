 module priority4_2(input d0,d1,d2,d3,output x,y,v);
 assign v = d3 |d2|d1|d0;
 assign x = d2|d3;
 assign y = d3 | d1&~d2;
 endmodule

 //testbench 
 module tb;
 reg d0,d1,d2,d3;
 wire x,y,v;

 priority4_2 uut(d0,d1,d2,d3,x,y,v);
 initial begin 
 repeat(32) begin
 $monitor("d0=%0d,d1=%0d,d2=%0d,d3=%0d,x=%0d,y=%0d,v=%0d",d0,d1,d2,d3,x,y,v);
 {d0,d1,d2,d3}=$random;#5;



 end 
 end 
 endmodule
