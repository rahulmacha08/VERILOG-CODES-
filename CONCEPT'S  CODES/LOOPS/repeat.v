module example;
reg [3:0] count;
initial begin 
repeat(10) begin 
count = 4'b0101;
$display("it will repeat 10 times");
end 
end 
endmodule 
