module intradelay;
reg a,b,c;

initial begin 
a=0;b=0;c=0;
end
initial begin 
$display("display,a=%0b,b=%0b,c=%0b,time=%0t",a,b,c,$time);
 a<=#3 1;
 b<=#3 0;
 c<=#3 0;
#10;
a<=#5 0;
b<=#5 1;
c<=#5 1;
#10;
$display("display,a=%0b,b=%0b,c=%0b,time=%0t",a,b,c,$time);
end
endmodule
