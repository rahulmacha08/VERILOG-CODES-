module jkff(input j,k,clk,rst,output reg q,output qbar);
always@(posedge clk or posedge rst )begin
if(rst)
q<=0;
  else if(j==0&&k==0)
  q<=q;
  else if(j==0&&k==1)
  q<=1'b0;
  else if(j==1&&k==0)
  q<=1'b1;
  else if(j==1&&k==1)
  q<=~q;
  else 
  $display("invalid input");
end
assign qbar=~q;
endmodule

//testbench 
module jkff_tb;
reg j,k,clk,rst;
wire q,qbar;
jkff uut(j,k,clk,rst,q,qbar);

initial  begin
clk=0;rst=1;j=0;k=0;
#13 rst=0;
end 
always #5 clk = ~clk;
always #7 j = ~j;
always #3 k = ~k;
initial begin 
$monitor("j=%0b,k=%0b,clk=%0b,q=%0b,qbar=%0b,t=%0t",j,k,clk,q,qbar,$time);
/*j=0;k=0;#5;
j=0;k=1;#5;
j=1;k=0;#5;
j=1;k=1;#5;
j=0;k=0;#5;
j=1;k=0;#5;
j=1;k=1;#5;
j=0;k=0;#5;
j=0;k=1;#5;
j=1;k=1;#5;
j=1;k=0;#5; */
#100;$finish;
end
endmodule 

