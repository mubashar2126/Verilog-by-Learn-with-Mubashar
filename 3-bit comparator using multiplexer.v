//2x1 Mux
module Mux_2x1(
    input A, B, S,
    output F
);
    assign F = (S == 1'b0) ? A : B;
endmodule

// 3-Bit Comparator using Multiplexers
module comparator_3bit (
    input [2:0] A, B,
    output E, L, G
);
    wire W1, W2, W3, W4, W5, W6;
    wire X = 1'b0;
    
 Mux_2x1 M1(.F(W1), .A(A[0]), .B(B[0]), .S(A[0] ^ B[0]));
 Mux_2x1 M2(.F(W2), .A(A[1]), .B(B[1]), .S((A[1] ^ B[1]) & ~W1));
 Mux_2x1 M3(.F(W3), .A(A[2]), .B(B[2]), .S((A[2] ^ B[2]) & ~W1 & ~W2));
//Less Value
 Mux_2x1 M4(.F(W4), .A(W3), .B(X), .S(W3));
 Mux_2x1 M5(.F(W5), .A(W2), .B(W4), .S(W2));
 Mux_2x1 M6(.F(L), .A(W1), .B(W5), .S(W1));
//Equal Value
 Mux_2x1 M7(.F(W6), .A(X), .B(W1), .S(W2));
 Mux_2x1 M8(.F(E), .A(X), .B(W6), .S(W3));
//Greater Value
assign G = ~(L | E);
endmodule
