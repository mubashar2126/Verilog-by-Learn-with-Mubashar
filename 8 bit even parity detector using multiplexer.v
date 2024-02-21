//8 bit even parity detector using multiplexer
//2x1 Mux
module Mux_2x1(
  input A, B, S,
  output F );
  wire W1, W2;
  and a1(W1, A, S);
  and a2(W2, B, ~S);
  or o1(F, W1, W2);
endmodule

// 4-bit even parity detector
module EPD_4bit (
  input A, B, C, P,
  output E );
  wire W1, W2, W3;
  xor x1(W1, A, B);
  xor x2(W2, C, P);
  xor x3(W3, W1, W2);
  Mux_2x1 M1(.F(E), .A(W1), .B(W2), .S(W3));
endmodule

// 8-bit even parity detector
module EPD_8bit(
  input [7:0] A,
  output E );
  wire W1, W2, W3;
  EPD_4bit E1(.A(A[0]), .B(A[1]), .C(A[2]), .P(A[3]), .E(W1));
  EPD_4bit E2(.A(A[0]), .B(A[4]), .C(A[5]), .P(A[6]), .E(W2));
  xor x3(W3, W1, W2);
  Mux_2x1 M1(.F(E), .A(W1), .B(W2), .S(W3));
endmodule
