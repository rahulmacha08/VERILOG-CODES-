module andgate(input a,b,output c);
assign  c = a & b;
endmodule



module andgate_tb;
reg a, b;
wire c ;
andgate uut(a,b,c);
initial begin
$monitor("a=%0b,b=%0b,c=%0b",a,b,c);
#2 a = 0 ; b = 0;
#2 a = 1 ; b = 0;
#2 a = 0 ; b = 1;
#2 a = 1 ; b = 1;
$stop; 
end 
endmodule  
