// 3-Bit Comparator using Multiplexers
//2x1 Mux
module Mux_2x1(
  input A, B, S,
  output F );
wire S1, W1, W2;
and a1(W1, A, S1);
and a2(W2, B, S);
or o1(F, W1, W2);
endmodule

//3-Bit Comparator
module comparator_3bit (
  input [2:0] A, B,
  output E, L, G );
wire W1, W2, W3, W4, W5, W6;
wire X = 1'b0;
//Initial Mux
Mux_2x1 M1(.F(W1), .A(A[0]), .B(B[0]), .S(A[0] ^ B[0]));
Mux_2x1 M2(.F(W2), .A(A[1]), .B(B[1]), .S((A[1] ^ B[1]) & ~W1));
Mux_2x1 M3(.F(W3), .A(A[2]), .B(B[2]), .S((A[2] ^ B[2]) & ~W1 & ~W2));
//Less Values
Mux_2x1 M4(.F(W4), .A(W3), .B(X), .S(W3));
Mux_2x1 M5(.F(W5), .A(W2), .B(W4), .S(W2));
Mux_2x1 M6(.F(L), .A(W1), .B(W5), .S(W1));
//Equal Values
Mux_2x1 M7(.F(W6), .A(X), .B(W1), .S(W2));
Mux_2x1 M8(.F(E), .A(X), .B(W6), .S(W3));
//Greater Values
nor nn1(G, L, E);
endmodule