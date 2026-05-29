 module mux(input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,output y);
 assign y = s0?(s1?(s2?i7:i6):(s2?i5:i4)):s1?(s2?i3:i2):(s2?i1:i0);
 endmodule

 //testbench 
 module tb;
 reg [2:0] i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2;
 wire y;

 mux uut(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);
 initial begin
 repeat(8)begin
 $monitor("i0=%0b,i1=%0b,i2=%0b,i3=%0b,i4=%0b,i5=%0b,i6=%0b,i7=%0b,s0=%0b,s1=%0b,s2=%0b,y=%0b",i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);
 i0=0;i1=1;i2=2;i3=3;i4=4;i5=5;i6=6;i7=7;
 /*s0=0;s1=0;s2=0;#5;
 s0=0;s1=0;s2=1;#5;
 s0=0;s1=1;s2=0;#5;
 s0=0;s1=1;s2=1;#5;
 s0=1;s1=0;s2=0;#5;
 s0=1;s1=0;s2=1;#5;
 s0=1;s1=1;s2=0;#5;
 s0=1;s1=1;s2=1;#5; */
 {s0,s1,s2} = $random;#5;
 end
 end 
 endmodule
