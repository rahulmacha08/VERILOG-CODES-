module interdelay;
reg a,b,c;
initial begin 
a=0;b=0;c=0;
end 
initial begin 
$display("a=%0b,b=%0b,c=%0b,time=%0t",a,b,c,$time);
#0 a=1;
#0 b=1;
#5 c=0;
$display("a=%0b,b=%0b,c=%0b,time=%0t",a,b,c,$time);

#5 a=0;
#5 b=0;
#5 c=0;
$display("a=%0b,b=%0b,c=%0b,time=%0t",a,b,c,$time);

end 
endmodule 
