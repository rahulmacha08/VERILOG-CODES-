module parityencoder(input[3:0]a,output p_even,p_odd);

assign p_even = ^a;
assign p_odd  = ~p_even;
endmodule 
//testbench 

module tb;
reg[3:0]a;
wire p_even,p_odd;

parityencoder uut(a,p_even,p_odd);

initial begin 
$monitor("a=%0b,p_even=%0b,p_odd=%0b,time=%0t",a,p_even,p_odd,$time);
a=4'b0011;#5;
a=4'b0010;#5;
a=4'b1111;#5;
a=4'b1010;#5;
$stop;
end 
endmodule
