  /* module demux(input i,s0,s1,output[3:0]y);
 assign y[0]= (~s0&~s1);
 assign y[1]= (~s0&s1);
 assign y[2] = (s0&~s1);
 assign y[3]= (s0&s1);
endmodule */

// using gate level 
 module demux(input i,s0,s1,output[3:0]y);
wire w1,w2;
not gatea(w1,s0);
not gateb(w2,s1);
and gate1(y[0],w1,w2);
and gate2(y[1],w1,s1);
and gate3(y[2],s0,w2);
and gate4(y[3],s0,s1);
endmodule 

//testbench 
module tb;
reg i,s0,s1;
wire[3:0]y;

demux uut(i,s0,s1,y);
initial begin 
$monitor("i=%0b,s0=%0b,s1=%0b,y=%0b",i,s0,s1,y);
s0=0;s1=0;#5;
s0=0;s1=1;#5;
s0=1;s1=0;#5;
s0=1;s1=1;#5;
end 
endmodule 
