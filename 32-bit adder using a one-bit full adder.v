//Half Adder
module HA(
output sum, 
output carry, 
input A, 
input B);
xor x1(sum, A, B);
and a1(carry, A, B);
endmodule

//Full Adder
module FA(
output sum,
output Cout,
input A,
input B,
input Cin);
wire W1, W2, W3;
HA HA1(W1, W2, A, B);
HA HA2(sum, W3, W1, Cin);
or O1(Cout, W2, W3);
endmodule

//8-Bit Full Adder
module FA_8(
output [7:0] sum,
output Cout,
input [7:0] A,
input [7:0] B,
input Cin);
wire W1, W2, W3, W4, W5, W6, W7;
FA FA1(.sum(sum[0]), .Cout(W1), .A(A[0]), .B(B[0]), .Cin(Cin) );
FA FA2(.sum(sum[1]), .Cout(W2), .A(A[1]), .B(B[1]), .Cin(W1) );
FA FA3(.sum(sum[2]), .Cout(W3), .A(A[2]), .B(B[2]), .Cin(W2) );
FA FA4(.sum(sum[3]), .Cout(W4), .A(A[3]), .B(B[3]), .Cin(W3) );
FA FA5(.sum(sum[4]), .Cout(W5), .A(A[4]), .B(B[4]), .Cin(W4) );
FA FA6(.sum(sum[5]), .Cout(W6), .A(A[5]), .B(B[5]), .Cin(W5) );
FA FA7(.sum(sum[6]), .Cout(W7), .A(A[6]), .B(B[6]), .Cin(W6) );
FA FA8(.sum(sum[7]), .Cout(Cout), .A(A[7]), .B(B[7]), .Cin(W7) );
endmodule

//32-Bit Adder
module FA_32(
output [31:0] sum,
output Cout,
input [31:0] A,
input [31:0] B,
input Cin);
wire W1, W2, W3;
FA_8 FA_8_1(sum[7:0], W1, A[7:0], B[7:0], Cin );
FA_8 FA_8_2(sum[15:8], W2, A[15:8], B[15:8], W1 );
FA_8 FA_8_3(sum[23:16], W3, A[23:16], B[23:16], W2 );
FA_8 FA_8_4(sum[31:24], Cout, A[31:24], B[31:24], W3 );
endmodule
