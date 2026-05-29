module fulladd #(
                 parameter WIDTH =1
				 )
				 (
				  input [WIDTH-1:0] a,b,
				  input cin,
				  output [WIDTH-1:0]sum,
				  output cout
				  );

assign {cout,sum} = a+b+cin;
endmodule 

// now instantiating it into an 4bit  full adder 
module inst_adder(
                 input [3:0] a,b,
				 input cin,
				 output [3:0] sum,
				 output cout
				 );
	
	//instantiation of fulladd in this one

	 fulladd#( .WIDTH(4)
	         )
			 fulladder_instance(
			             a,b,cin,sum,cout);
endmodule 

//testbench 
module tb;
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout; 

inst_adder uut(
               a,b,cin,sum,cout);
initial begin 
a=0;b=0;cin=0;
end 
initial begin  
repeat(10) begin 
$monitor("a=%0b,b=%0b,cin=%0b,sum=%0b,cout=%0b,time=%0t",a,b,cin,sum,cout,$time);
{a,b,cin} = $random; #3;
end 
end 
endmodule 

