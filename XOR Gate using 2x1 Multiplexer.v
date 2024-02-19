//XOR Gate using 2x1 Multiplexer
module XOR_GATE (
input B, S,
output F  );
wire S1, B1, W1, W2;
not n1(S1, S);
not n2(B1, B);
and a1(W1, S1, B);
and a2(W2, S, B1);
or o1(F, W1, W2);
endmodule
