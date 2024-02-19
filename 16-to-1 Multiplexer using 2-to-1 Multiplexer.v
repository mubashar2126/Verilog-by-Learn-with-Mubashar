// 2x1 Mux
module Mux_2x1 (
    input A, B, S,
    output F
);
    assign F = (S & B) | (~S & A);
endmodule

// 16x1 Mux
module Mux_16x1 (
    input A, B, C, D, E, I, G, H, A1, B1, C1, D1, E1, I1, G1, H1, //Input = 0111010011101111
    input [3:0] Select, //Select = (11) = 1011
    output F
);
    wire [1:0] W1, W2, W3, W4, W5, W6, W7, W8, W09, W10, W11, W12, W13, W14;
    wire [3:0] S1, S2, S3, S4;
    
    assign S1 = Select[1:0];
    assign S2 = Select[2:1];
    assign S3 = Select[3:2];
    assign S4 = Select[4:3];
    
    // 16x8 Lines
    Mux_2x1 m1(A, B, S1[0], W1[0]);
    Mux_2x1 m2(C, D, S1[0], W2[0]);
    Mux_2x1 m3(E, I, S1[0], W3[0]);
    Mux_2x1 m4(G, H, S1[0], W4[0]);
    Mux_2x1 m5(A1, B1, S1[1], W5[0]);
    Mux_2x1 m6(C1, D1, S1[1], W6[0]);
    Mux_2x1 m7(E1, I1, S1[1], W7[0]);
    Mux_2x1 m8(G1, H1, S1[1], W8[0]);
    
    // 8x4 Lines
    Mux_2x1 m09(W1[0], W2[0], S2[0], W09[0]);
    Mux_2x1 m10(W3[0], W4[0], S2[0], W10[0]);
    Mux_2x1 m11(W5[0], W6[0], S2[1], W11[0]);
    Mux_2x1 m12(W7[0], W8[0], S2[1], W12[0]);
    
    // 4x2 Lines
    Mux_2x1 m13(W09[0], W10[0], S3[0], W13[0]);
    Mux_2x1 m14(W11[0], W12[0], S3[1], W14[0]);
    
    // 2x1 Lines
    Mux_2x1 m15(W13[0], W14[0], S4[0], F);
    
endmodule
