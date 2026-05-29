module example;
integer i ;
always  begin
$monitor("i=%0b ,time=%0t",i,$time);
for( i=0;i<10;i=i+1)begin
#5;
end 
#40 $finish;
end 
endmodule 
