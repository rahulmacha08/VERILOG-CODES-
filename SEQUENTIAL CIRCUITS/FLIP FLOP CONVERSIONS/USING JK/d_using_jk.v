// jk module
module jkff(input j,k,clk,rst,output reg q);
    always @(posedge clk or posedge rst)
	  begin
         if(rst)
		  q<=1'b0;
		  else 
		      begin 
		  case({j,k})
                 2'b00:q<=q;
				 2'b01:q<=1'b0;
				 2'b10:q<=1'b1;
				 2'b11:q<=~q;
                 default : $display("invalid state");
		  endcase 
		  end
	 end
endmodule

// d using jk module 
module d_using_jk(input d,clk,rst,output reg q);

jkff uut(
         .j(d),
		 .k(~d),
		 .clk(clk),
		 .rst(rst),
		 .q(q)
         );

endmodule

//testbench 
module tb;
reg d,clk,rst;
wire q;

d_using_jk uut(d,clk,rst,q);
always #5 clk=~clk;

initial begin 
clk=0;rst=1;d=0;
#10 rst=0;
$monitor("d=%0b,q=%0b",d,q);
#5;
d=1;#3;
d=0;#3;
d=0;#3;
d=1;#3;
d=1;#3;
d=0;#3;
#30  $finish;
end 
endmodule 
