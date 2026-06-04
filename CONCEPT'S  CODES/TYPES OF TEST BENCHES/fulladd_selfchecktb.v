module fulladd(
              input a,b,cin,
			  output sum,
			  output cout
			  );
assign {cout,sum} =  a+b+cin;
endmodule      

// self checkingtb 
module ftb;

reg a,b,cin;
wire sum,cout;

// design instantiation
fulladd uut(a,b,cin,sum,cout);

reg exp_sum, exp_cout;
integer i;
initial begin 
for(i=0; i<8;i=i+1)  begin 
{a,b,cin} = i;
{exp_sum, exp_cout} = a+b+cin; // here is the checking logic 
#3; 
end 
if({sum,cout}!=={exp_sum, exp_cout})
$display("expected is not got");
else 
$display("output is verified ");
end 
endmodule 
