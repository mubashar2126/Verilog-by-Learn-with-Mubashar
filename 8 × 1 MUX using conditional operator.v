//8x1 Multiplexer using conditional operator in data-flow modeling
module MUX_8x1(
    input [7:0] A,
    input S1, S2, S3,
    output F
);

assign F = S1 ? (S2 ? (S3 ? A[0] : A[1]) : (S3 ? A[2] : A[3])) : (S2 ? (S3 ? A[4] : A[5]) : (S3 ? A[6] : A[7]));
endmodule
