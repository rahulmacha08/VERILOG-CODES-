module jkff(input clk,rst,j,k,output reg q);

  always @(posedge clk or posedge rst) begin
      if(rst)
	    q<=1'b0;
		else
		  begin
          case({j,k})
            2'b00:q<=q;
			2'b01:q<=0;
			2'b10:q<=1;
			2'b11:q<=~q;    // here in the below module we are giving same input to j and k 
			default : $display("invalid input");
          endcase 
		  end
  end
endmodule

//t using jk ff
module t_using_jk(
       input clk,t,rst,
	   output q1
	   );

// instantiation 
jkff uut(
         .clk(clk),
		 .rst(rst),
		 .j(t),
		 .k(t),
		 .q(q1)
		 );
endmodule

//testbench 
module tb;
reg clk,t,rst;
wire q1;

t_using_jk dut(clk,t,rst,q1);

initial  begin 
clk=0; 
rst=1;
#10 rst=0;
end 
always #5 clk=~clk; 

initial begin
$monitor("clk=%0b,t=%0b,q1=%0b,time=%0t",clk,t,q1,$time);
t=0;

#3;t=1;
#3;t=0;
#3;t=0;
#3;t=1;
#3;t=0;
#30;
$finish;
end

endmodule
