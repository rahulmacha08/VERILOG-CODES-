module mux4_1(input a,b,c,d,s1,s2,output y);
assign y = ((~s1&~s2&a)|(~s1&s2&b)|(s1&~s2&c)|(s1&s2&d));
endmodule

module muxtb;
reg a,b,c,d,s1,s2;
wire y;
mux4_1 uut(a,b,c,d,s1,s2,y);
initial begin
s1 = 0;s2 = 0;#10;
s1 = 0;s2 = 1;#10;
s1 = 1;s2 = 0;#10;
s1 = 1;s2 = 1;#10;
end
$monitor("s1=%0b,s2=%0b"s1,s2);
endmodule
