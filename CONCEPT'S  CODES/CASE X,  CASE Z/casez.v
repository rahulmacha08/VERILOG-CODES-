module casee(
             input [3:0] din ,
			 output reg [1:0] dout,
			 output reg valid
			 );
	
	always @(*) begin 
	valid =1'b1;
	casez(din)
	4'b1???:dout=2'b11;
	4'b01??:dout=2'b01;
	4'b001?:dout=2'b10;
	4'b0001:dout=2'b00;
	default : begin 
	dout=2'b??;
	valid=1'b0;
	end
	endcase
	end 
endmodule 

//testbench 
module tb;
reg [3:0] din;
wire [1:0] dout;
wire valid;

casee uut(din,dout,valid);
initial begin  
$monitor("din=%0b,dout=%0b,valid=%0b,t=%0t",din,dout,valid,$time);
din=4'b0000;#3;
din=4'b0101;#3;
din=4'b1100;#3;
din=4'b1110;#3;
din=4'b0010;#3;
din=4'b1001;#3;
din=4'b1111;#3;
#100 $finish;
end 
endmodule 
