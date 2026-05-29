module srff(input s,r,clk,output reg q,output qbar);
always@(posedge clk) begin 
       case({s,r})
                   2'b00:q<=q;
				   2'b01:q<=1'b0;
				   2'b10:q<=1'b1;
				   2'b11:q<=1'bx;
				   default:$display("invalid input");
	   endcase
end 
endmodule

//testbench 
module srff_tb;
reg s,r,clk;
wire q,qbar;

srff uut(s,r,clk,q,qbar);
initial clk =0;
 always #5 clk = ~clk; 
initial begin 
$monitor("s=%0b,r=%0b,clk=%0b,q=%0b,qbar=%0b,t=%0t",s,r,clk,q,qbar,$time);
s=0;r=0;#5;
s=0;r=1;#5;
s=1;r=0;#5;
s=1;r=1;#5;
s=0;r=0;#5;
#50;$finish;
end
endmodule 

