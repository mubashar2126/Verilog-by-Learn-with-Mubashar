//4-bit Subtractor
module subtractor(
    input [3:0] A,
    input [3:0] B,
    output [3:0] D
);

assign D = A - B;
endmodule
