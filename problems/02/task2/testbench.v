`timescale 1 ns / 100 ps

module testbench(); 

reg clock = 1'b0; 

always
begin
    #1 clock = ~clock; 
end

reg initial_state = 1;

d_ff d_ff(.D(tmp & (~initial_state)), .clock(clock), .Q(out), .N_Q(tmp));

initial
begin
    $dumpfile("d_ff_tb.vcd");
    $dumpvars;     
    $display("Started testbench");

    #2 initial_state = 0;
     
    #8 $finish;   
end

endmodule
