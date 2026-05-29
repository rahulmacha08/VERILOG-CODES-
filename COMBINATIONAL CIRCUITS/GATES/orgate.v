module orgate(input a,b,output c );
assign c = a |b;
endmodule

module orgate_tb;
reg a, b;
wire c ;
 orgate uut(a,b,c);
initial begin
#5 a=0 ; b=0;  
#5 a=0 ; b=1;  
#5 a=1 ; b=0;  
#5 a=1 ; b=1;  
end 
initial begin 
$display( "a=%0b , b=%0b,c=%0b",a,b,c);
end 
endmodule
