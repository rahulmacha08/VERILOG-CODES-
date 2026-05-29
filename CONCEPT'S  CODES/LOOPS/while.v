module example;
reg [7:0]cnt;
always #5 cnt=~cnt;
initial  begin 
// while loop
cnt = 0;
while(cnt<8'd100)begin 
$monitor("current count :%0d",cnt);
cnt = cnt +1;
#3;
end 
$display("loop finished ");
#100 $finish;
end 
endmodule 
