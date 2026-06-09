module fsm(
           input clk,rst,x,
		   output reg  y 
		   );

// in moore we have n+1 states that is 5 states they are s0,s1,s2,s3,s4
parameter s0=0,s1=1,s2=2,s3= 3,s4=4;

// internal state logic 
reg[3:0] cs,ns; // cs  = current state , ns = next state
always @(posedge clk ) 
begin 
     if(rst)
	 cs<= s0;
	 else 
	 cs<=ns;
end 
     // here  is the sequence detection logic
	   always@(*) begin
	           case(cs)
			   s0: begin 
			        if(x==1)
					ns<= s1;
					else
					ns<= s0;
				    end
			   s1: begin 
			       if(x==1)
				   ns<= s1;
                   else
				   ns<= s2;
				   end 
			   s2: begin 
			       if(x==1)
				   ns<= s3;
				   else
				   ns<= s0;
				   end 
			  s3: begin 
			      if(x==1) begin 
                  ns<=s4;
				  y=1; end 
				  else
				  ns<=s2;
				  end 
			  s4: begin 
			      if(x==1)
				  ns<=s1;
				  else
				  ns<=s0;
				  end 
			   endcase
	 end 
	 //assign y = ((cs==s4)? 1:0); 
	/* always @(*) begin // Changed from (cs, x) to (*) for reliability 
        case(cs)
            s0: ns = (x == 1) ? s1 : s0;
            s1: ns = (x == 1) ? s1 : s2;
            s2: ns = (x == 1) ? s3 : s0;
            s3: ns = (x == 1) ? s4 : s2;
            s4: ns = s0; // Non-overlapping: Always return to start after detection 
            default: ns = s0;
        endcase
    end  */

    //assign y = (cs == s4) ? 1 : 0;
endmodule
//testbench 

module fsm_tb;
reg clk,rst,x;
wire y;

fsm uut(clk,rst,x,y);
always #5 clk = ~clk;
initial begin 
clk = 0; x=0;
rst = 1;
#10;
rst = 0;
$monitor("x=%0b,y=%0b,time=%0t",x,y,$time);
#20;x=1;
#10;x=0;
#10;x=1;
#10;x=1;
#10;
$strobe("x=%0b,y=%0b,time=%0t",x,y,$time);
#300 $finish;
end
endmodule 


