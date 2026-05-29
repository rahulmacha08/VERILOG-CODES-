module mux8to1(input i0,i1,i2,i3,i4,i5,i6,i7,s1,s2,s3,output y);
 assign y = ((~s1&~s2&~s3&i0)|(~s1&~s2&s3&i1)|(~s1&s2&~s3&i2)|(~s1&s2&s3&i3)|(s1&~s2&~s3&i4)|(s1&~s2&s3&i5)|(s1&s2&~s3&i6)|(s1&s2&s3&i7));
 endmodule

//testbench 
module test;
reg i0,i1,i2,i3,i4,i5,i6,i7,s1,s2,s3;
wire y;

mux8to1 uut(i0,i1,i2,i3,i4,i5,i6,i7,s1,s2,s3,y);

initial begin 
repeat(8) begin 
$monitor("i0=%0d,i1=%0d,i2=%0d,i3=%0d,i4=%0d,i5=%0d,i6=%0d,i7=%0d,s1=%0d,s2=%0d,s3=%0d,y=%0d",i0,i1,i2,i3,i4,i5,i6,i7,s1,s2,s3,y);
  {s1,s2,s3} = $random; #5;
end 
end 
endmodule
