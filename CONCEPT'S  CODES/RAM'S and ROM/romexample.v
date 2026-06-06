module rom(
           input[3:0]addr,
		   output reg [7:0]data
		   );

// here we are creating the memory with 4 bits of data per loaction with overall 16 locations 
reg[7:0]rom[15:0];  // memory created

initial begin
$monitor("rom=%0d",rom);
rom[0] = 8'hc;
rom[1] = 8'h22;
rom[3] = 8'hd;
end 
always@(*)begin 
data = rom[addr];
end 
endmodule
//here we are giving the predefined values to the memory , 
// there is no write logic as we want  we are only reading the memory 
// so the tool considers it as ROM 

