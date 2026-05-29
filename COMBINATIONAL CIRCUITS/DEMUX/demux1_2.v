module demux1to2(input i,s,output y0,y1);
assign y0 = (~s&i);
assign y1 = (s&i);
endmodule 

// testbench
 module tb;
 reg i,s;
 wire y0,y1;

 demux1to2 uut(i,s,y0,y1);
 initial begin 
 $monitor("i=%0b,s=%0b,y0=%0b,y1=%0b",i,s,y0,y1);
 s=0;#5;
 s=1;#5;
 end 
 endmodule 
