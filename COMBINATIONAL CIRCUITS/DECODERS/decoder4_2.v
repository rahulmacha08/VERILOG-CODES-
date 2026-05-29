// using dataflow modeling 
 /* module decode(input i0,i1,output [3:0]y);
assign y[0] = (~i0|~i1);
assign y[1] = (~i0|i1);
assign y[2] = (i0|~i1);
assign y[3] = (i0|i1);
endmodule */

// using gate level
 module decode(input i0,i1,output[3:0]y);
wire w1,w2;
not gatea(w1,i0);
not gateb(w2,i1);
or gate0(y[0],w1,w2);
or gate1(y[1],w1,i1);
or gate2(y[2],i0,w2);
or gate3(y[3],i0,i1);
endmodule  

//testbench 
 module tb;
reg i0,i1;
wire[3:0]y;

decode uut(i0,i1,y);

initial begin 
$monitor("i0=%0b,i1=%0b,y=%0b",i0,i1,y);
i0=0;i1=0;
i0=0;i1=1; #5;
i0=1;i1=0; #5;
i0=1;i1=1; #5;
end 
 endmodule
