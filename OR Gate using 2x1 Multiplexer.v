//OR Gate using 2x1 Multiplexer
module OR_GATE (
input A, B, S,
output F  );
wire S1, W1, W2;
not n1(S1, S);
and a1(W1, S1, A);
and a2(W2, S, B);//SET B = 1
or o1(F, W1, W2);
endmodule
