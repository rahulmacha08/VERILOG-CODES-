

module piso_4bit (
    input clk,
    input rst,
    input load_shift,          // 0 = Load , 1 = Shift
    input [3:0] parallel_in,
    output reg serial_out
);

reg [3:0] temp;


always @(posedge clk or posedge rst) begin

    if(rst) begin
        temp       <= 4'b0000;
        serial_out <= 1'b0;
    end

    else if(load_shift == 1'b0) begin
        temp <= parallel_in;
    end

    else begin

        // Send MSB serially
        serial_out <= temp[3];

        // Right Shift
        temp <= {temp[2:0],1'b0};

    end

end

endmodule
//testbench 

module piso_4bit_tb;

reg clk;
reg rst;
reg load_shift;
reg [3:0] parallel_in;

wire serial_out;

piso_4bit dut (
    .clk(clk),
    .rst(rst),
    .load_shift(load_shift),
    .parallel_in(parallel_in),
    .serial_out(serial_out)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin

    // Initialize
    rst         = 1;
    load_shift  = 0;
    parallel_in = 4'b0000;

    // Apply Reset
    #12;
    rst = 0;

    @(negedge clk);
    load_shift  = 0;
    parallel_in = 4'b1101;


    //=====================================================
    // Shift Operation
    //=====================================================

    @(negedge clk);
    load_shift = 1;

    // Shift for 4 clock cycles
    repeat(4)
        @(negedge clk);

    @(negedge clk);
    load_shift  = 0;
    parallel_in = 4'b1010;

    @(negedge clk);
    load_shift = 1;

    repeat(4)
        @(negedge clk);


    // Finish Simulation
    #10;
    $finish;
end

initial begin

    $monitor("TIME = %0t | rst = %b | load_shift = %b | parallel_in = %b | serial_out = %b",
              $time, rst, load_shift, parallel_in, serial_out);

end

endmodule
