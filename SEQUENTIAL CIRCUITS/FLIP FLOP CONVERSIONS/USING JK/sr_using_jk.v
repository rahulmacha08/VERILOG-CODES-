module jkff(input clk,rst,j,k,output reg q,output qbar);
always @(posedge clk or posedge rst) begin 
     if(rst)
	 q<=1'b0;
	 else begin 
	      case({j,k})
		  2'b00:q<=q;
		  2'b01:q<=0;
		  2'b10:q<=1;
		  2'b11:q<=~q;
		  default :$display("invalid input ");
		  endcase
	 end 
  end
  assign qbar = ~q;
endmodule

// sr using t flipflop
module sr_using_jk(input clk,rst,s,r,output q1,qbar);
jkff dut(
         .clk(clk),
		 .rst(rst),
		 .j(s),
		 .k(r),
		 .q(q1),
		 .qbar(qbar)
		 );
endmodule 
//testbench 
module tb;
reg clk,rst,s,r;
wire q1,qbar;

sr_using_jk uut(clk,rst,s,r,q1,qbar);

initial begin 
clk =0;
rst =1;
#10 rst=0;
end 
always #5 clk = ~clk;
initial begin
$monitor("s=%0b,r=%0b,q1=%0b,qbar=%0b,t=%0t",s,r,q1,qbar,$time);
s=0;r=0;#3;
s=0;r=1;#3;
s=1;r=0;#3;
s=1;r=1;#3;
s=0;r=0;#3;
s=1;r=0;#3;
#30;
$finish;
end 
endmodule 
