module full(input a,b,cin,output sum, cout );
wire sum1,cout1,cout2;
// instantiation of half adder module in this module.
half add1(a,b,sum1,cout1);
half add2(sum1,cin,sum,cout2);
assign cout = cout1 | cout2;
endmodule 

//halfadder module 
module half(input a,b,output sum,cout);
assign {cout,sum} = a+b;
endmodule 

//testbench 
module tb;
reg a,b,cin;
wire sum,cout;

full uut(a,b,cin,sum,cout);
initial begin
repeat(64) begin 
$monitor("a=%0d,b=%0d,cin=%0d,sum=%0d,cout=%0d",a,b,cin,sum,cout);
 
   {a,b,cin}=$random;#5;


   end 
   
 
 end

endmodule
