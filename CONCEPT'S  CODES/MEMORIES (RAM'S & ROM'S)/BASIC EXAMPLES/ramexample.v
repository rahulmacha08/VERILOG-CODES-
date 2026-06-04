module ram(
           input clk,
		   input write_en,  // this signal decides to write the data or not     
           input[1:0] addr,  // address of the data stored
		   input[7:0] din,
		   output reg [7:0] dout
		   );

// writing the memory
reg[7:0]ram[3:0]; // here it has 8 bit width (8 bits per location ) , 4 bit depth (4 locations ) , total 8x4 = 32 bit memory 

// write and read operation 
always@(posedge clk) begin 
  
   if(write_en)
      begin
        ram[addr] <=din;
        // dout<=ram[addr];      
   end 
   else 
     dout<=ram[addr];
	 //$display("no data is written , justt data read only happens");
end 
endmodule
//testbench

module ram_tb;
reg clk, write_en;
reg[1:0] addr;
reg[7:0] din;
wire [7:0] dout;

// instantiation of DUt
 ram uut(clk,write_en,addr,din,dout);
 initial begin 
 clk=0;
 write_en = 0;
 addr = 0;
 din = 0;
 end 
 always #5 clk = ~clk;
 initial begin 
 #5;
 write_en = 1;
 $monitor("din = %0b | addr= %0b, dout= %0b,time=%0t",din,addr,dout,$time);
 #10 din=8'h11;addr=2'd1;
 #10 din=8'hc;addr=2'd2;    // if we didnt give addr location it always takes the valeus at 0
 #10 write_en =0;
  #10 din = 8'hd;
  #10 din = 8'hf;
  #10;
  $finish;
 end 

endmodule 

