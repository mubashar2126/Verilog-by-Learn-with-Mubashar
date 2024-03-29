//Inverter using 2x1 Multiplexer
module inverter(
    input A, S,
    output F );
    wire S1, A1, W1, W2;
    not n1(S1, S);
    not n2(A1, A);
    and a1(W1, S1, A);//SET A = 1
    and a2(W2, S, A1);
    or o1(F, W1, W2);
endmodule
