module srff(
            input clk,rst,s,r,
			output reg q,
			output qbar
			);
	always @(posedge clk or posedge rst) begin
      if(rst)
	  q<=1'b0;
	  else begin 
	   case({s,r})
	        2'b00:q<=q;
			2'b01:q<=0;
			2'b10:q<=1;
			2'b11:q<=1'bx;
			default :$display("invalid input");
	   endcase
	  end 
	end 
	assign qbar = ~q;
endmodule

//d using sr 

module d_using_sr(
                  input clk,rst,d,
				  output q,qbar
		          );
    srff uut(
	         .clk(clk),
			 .rst(rst),
			 .s(d),
			 .r(~d),
			 .q(q),
             .qbar(qbar)
			 );
assign qbar = ~q;
endmodule

//testbench 

module tb;
reg clk,rst,d;
wire q,qbar;

d_using_sr uut(clk,rst,d,q,qbar);

initial begin
clk=0;
rst=1;
#10 rst=0;
end 
always #5 clk=~clk;
initial begin 
$monitor("d=%0b,clk=%0b,q=%0b,qbar=%0b,t=%0t",d,clk,q,qbar,$time);
#4;
#4;d=0;
#4;d=1;
#4;d=1;
#4;d=0;
#4;d=1;
#4;d=0;
#30;
$finish;
end 
endmodule
