module sr_latch(R, S, Q, N_Q);
               
input R;
input S;
output Q;
output N_Q;

assign Q = ~(N_Q | R);
assign N_Q = ~(Q | S);
    
endmodule
