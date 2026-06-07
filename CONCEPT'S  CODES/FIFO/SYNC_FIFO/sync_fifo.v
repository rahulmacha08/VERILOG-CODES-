module fifo(
           input clk,rst,w_en,r_en,
		   input[7:0] din,
		   output reg [7:0] dout,
		   output full ,empty 
		   );

reg[2:0] wr_p,re_p; // here we are assigning read and write pointer  just to point where to write and where to read 
reg[7:0] fifo[7:0]; // here it is memory with 8 bit width , 8bit depth

//assigning the  full and empty flags , so we can know when to write and when to not 
assign full = ((wr_p ==3'b111)&&(re_p==3'b000)? 1:0); //here when write pointer reached the highest bit location and the read pointer is yet not started then , the full flag goes high 
assign empty = (wr_p == re_p ? 1:0); // here is the same logic for empty one




// here is the writing and reading logic 
always @(posedge clk) begin 
   if(rst) begin 
           //fifo<=0
		   wr_p <=0;re_p<=0;
		   dout<=0;
		   end 
		   else if(!full && w_en)
		                      begin 
							  fifo[wr_p]<=din;
							  wr_p <= wr_p+1; // here we are incrementing the write pointer to go to next location 
							  end 
		 else if(!empty && r_en)
		                       begin 
							   dout<=fifo[re_p];
							   re_p <= re_p+1;
							   end 
end 
endmodule 

//testbench 
module fifo_tb;
reg clk,rst,w_en,r_en;
reg [7:0] din;
wire [7:0] dout;
wire full, empty;

// instantiation 
fifo uut(clk,rst,w_en,r_en,din,dout,full,empty);

initial begin 
clk=0;
rst=1;
#13 rst = 0;
end 
always #5 clk = ~clk;
initial begin 
repeat (10) begin
w_en = 1; r_en = 0;
$monitor("din=%0b | dout = %0b, time=%0t",din,dout,$time);
{din} = $random;
#5;
end
w_en =0; r_en = 1;
#100 $finish;
end 
endmodule 
