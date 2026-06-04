module fulladd(
              input a,b,cin,
			  output sum,
			  output cout
			  );
assign {cout,sum} =  a+b+cin;
endmodule      

// taskbased tb 
module ftb;

reg a,b,cin;
wire sum,cout;

// design instantiation
fulladd uut(a,b,cin,sum,cout);
task apply_stim(input [2:0] inputs);
    begin
        {a, b, cin} = inputs;
        #10;
        $display("Inputs: %b | Outputs: Sum=%b, Cout=%b", inputs, sum, cout);
    end
endtask

initial begin 
$monitor("a=%0d,b=%0d,cin=%0d,sum=%0d,cout=%0d",a,b,cin,sum,cout);

// Use the task
    apply_stim(3'b000);
    apply_stim(3'b111);
    apply_stim(3'b010);
    $finish;

end
endmodule 
