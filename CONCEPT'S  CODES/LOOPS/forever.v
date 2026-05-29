module example;
// clk generation 
reg clk;
initial begin 
clk=0;
$display("clock is generated | clk=%0b",clk);
forever begin 
#5 clk = ~clk;
end
end 
initial begin 
#100 $finish;
end 
endmodule 
