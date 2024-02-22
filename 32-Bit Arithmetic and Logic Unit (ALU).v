// 32-Bit Arithmetic and Logic Unit (ALU)
module ALU_32bit(
    input [31:0] A,
    input [31:0] B,
    input Cin,
    input [1:0] OP,
    output reg [31:0] F
);

always @ (*)
begin
    case (OP)
        2'b00: F = A + B + Cin; // Addition
        2'b01: F = A - B;       // Subtraction
        2'b10: F = A * B;       // Multiplication
        2'b11: F = A / B;       // Division
        default: F = 32'hXXXX_XXXX; // Handle invalid OP
    endcase
end
endmodule
