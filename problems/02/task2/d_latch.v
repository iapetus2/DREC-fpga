module d_latch (D, E, Q, N_Q);

input D;
input E;
output Q;
output N_Q;

wire reset = ~D & E;
wire set = D & E;

sr_latch sr_latch(.R(reset), .S(set), .Q(Q), .N_Q(N_Q));
    
endmodule
