module fsm1101(
              input clk,rst,x,output   y);

parameter s0=3'b000,s1=3'b001,s2=3'b011,s3=3'b110;
reg[2:0] cs,ns;

always@(posedge clk) begin 
                     if(rst)
					 cs<=0;
					 else 
					 cs<= ns;
					 end 

always@(*) begin 
           case(cs)
		   s0: ns = (x==1) ? s1 : s0;
		   s1: ns = (x==1) ? s2 : s0;
		   s2: ns = (x==1) ? s1 : s3;
		   s3: ns = (x==1) ? s1 : s0;
		   default: ns<= s0;
		   endcase
		   end 
		   assign y = (cs==s3 && x==1) ? 1 : 0;
		    /*always @(posedge y) begin 
		    if(y)
			count<= y+1;
			else 
			count<= 0;
		   end  */  
endmodule 
// testbench 
module fsm_tb;
reg clk,rst,x;
wire y;
fsm1101 uut(clk,rst,x,y);

initial begin 
clk = 0;
rst = 1;
#13 rst = 0;
end 
always #5 clk = ~ clk;

initial begin 
x= 0;
$monitor("x= %0b,y=%0b,time=%0t",x,y,$time);
#10 x=1;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=0;
#10 x=1;
#10 x=1;
#10 x=0;
#10 x=1;
#100 $finish;
end 
endmodule 
