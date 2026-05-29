// two , twobit inputs
// dataflow
module comp_2(input[1:0]a,b,output e,l,g);

assign e =(~(~(a[1]^b[1]))^(~(a[0]^b[0])));
assign l = (~a[1]&b[1])|(~ (~(a[1]^b[1])) ^(~a[0]&b[0]));
assign g = a[1]&b[1] | (~(~(a[1]^b[1]))^(a[0]&~b[0]));
endmodule

//testbench 
module comp_tb;

reg[1:0]a,b;
wire e,l,g;

comp_2 uut(a,b,e,l,g);
initial begin
repeat(10) begin

$monitor("a[0]=%0b,a[1]=%0b,b[0]=%0b,b[1]=%0b,e=%0b,l=%0b,g=%0b",a[0],a[1],b[0],b[1],e,l,g);
{a,b}=$random; #5;
end
end 
endmodule
