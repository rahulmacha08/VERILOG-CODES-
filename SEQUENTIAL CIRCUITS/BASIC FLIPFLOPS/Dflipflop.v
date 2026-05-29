module dff(input d,clk,rst,output reg q,q1);
// this is synchronus                             // this is Asynchronus 
always@(posedge clk)begin                          // always@(posedge clk or posedge rst)begin 
  if(rst)                                          // if(rst)  
    q<=1'b0;                                           //    d<=0;
  else                                           //  else 
    q<=d;                                             //    d<=1;
end 
assign q1=~q;
endmodule  

//testbench 

module tb;
reg d,clk,rst;
wire q,q1;

dff uut(d,clk,rst,q,q1);
initial begin 
clk =0;
rst=1;
end 
always #5 clk =~clk;
always #5 rst=~rst;
initial begin
$monitor("d=%0b,clk=%0b,rst=%0b,q=%0b,q1=%0b",d,clk,rst,q,q1);
d=0;#5;
d=1;#5;
d=0;#5;
#50 $finish;
end 
endmodule

