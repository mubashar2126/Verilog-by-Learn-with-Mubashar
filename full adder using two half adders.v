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
