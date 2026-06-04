module fulladd(
              input a,b,cin,
			  output sum,
			  output cout
			  );
assign {cout,sum} =  a+b+cin;
endmodule      

// random tb 
module ftb;

reg a,b,cin;
wire sum,cout;

// design instantiation
fulladd uut(a,b,cin,sum,cout);
initial begin 
repeat(10) begin 
$monitor("a=%0d,b=%0d,cin=%0d,sum=%0d,cout=%0d",a,b,cin,sum,cout);
{a,b,cin} = $random;
#5;

end 
end
endmodule 
