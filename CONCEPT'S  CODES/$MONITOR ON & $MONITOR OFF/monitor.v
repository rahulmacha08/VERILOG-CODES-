module monitor;
reg clk;
reg [7:0] data;

initial begin
$monitor("time=%0t | data = %0d",$time,data);
end 
// giving delays 
initial begin 
data =0;
#10 data=10;
#10 data = 15;

#5 $monitoroff; // here after the code which is written is shown in the simulation.
#10 data=40;
#10 data=50;
#10;

#5 $monitoron; // here the data  updation shows in the simulation 

#10 data = 60;
#10 data = 70;
#5 $finish;
end 

endmodule 
