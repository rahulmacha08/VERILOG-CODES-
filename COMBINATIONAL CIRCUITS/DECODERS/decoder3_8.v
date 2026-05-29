//using dataflow modeling 
module decode(input [2:0]i,output[7:0]y);
assign y[0] =(~i[0]|~i[1]|~i[2]);
assign y[1] =(~i[0]|~i[1]|i[2]);
assign y[2] =(~i[0]|i[1]|~i[2]);
assign y[3] =(~i[0]|i[1]|i[2]);
assign y[4] =(i[0]|~i[1]|~i[2]);
assign y[5] =(i[0]|~i[1]|i[2]);
assign y[6] =(i[0]|i[1]|~i[2]);
assign y[7] =(i[0]|i[1]|i[2]);
endmodule

//testbench 
module tb;
reg[2:0]i;
wire[7:0]y;

decode uut(i,y);
initial begin
repeat(10) begin
$monitor("i[0]=%0b,i[1]=%0b,i[2]=%0b,y=%0b",i[0],i[1],i[2],y);

{i[0],i[1],i[2]} = $random; #5;
end
end 
endmodule
