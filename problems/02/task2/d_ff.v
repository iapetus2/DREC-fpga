module d_ff(D, clock, Q, N_Q);

input D;
input clock;
output Q;
output N_Q;

wire line;

d_latch latch_1(.D(D),    .E(~clock), .Q(line), .N_Q());
d_latch latch_2(.D(line), .E(clock),  .Q(Q),    .N_Q(N_Q));
    
endmodule
