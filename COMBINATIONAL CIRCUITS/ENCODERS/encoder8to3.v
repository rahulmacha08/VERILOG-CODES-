module encoder8to3(input[7:0]i,output[2:0]y);
or gate1(y[0],i[4],i[5],i[6],i[7]);           // using dataflow modeling 
or gate2(y[1],i[2],i[3],i[6],i[7]);           // assign y[0]=i[4]|i[5]|i[6]|i[7];
or gate3(y[2],i[1],i[3],i[5],i[7]);          //  assign y[1]=i[2]|i[3]|i[5]|i[7];
endmodule                                    //  assign y[2]=i[1]|i[3]|i[5]|i[7]; 
// testbench
module tb;
reg[7:0]i;
wire[2:0]y;

encoder8to3 uut(i,y);
initial begin
repeat(10) begin 
$monitor("i=%0d,y=%0d,time=%0t",i,y,$time);
{i} = $random; #5;

end 
end 
endmodule 

