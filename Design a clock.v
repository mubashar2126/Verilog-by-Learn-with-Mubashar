module ClockGenerator (
    input wire clk_in,
    output reg clk_out
);
reg [1:0] count;
// Initialize count & output to 0
initial begin
    count = 2'b00;
    clk_out = 1'b0;
end
always @(posedge clk_in) begin
    count <= count + 1;
    if (count == 2'b10) begin // Toggle every 4 cycles for 25% duty cycle
        count <= 2'b00;
        clk_out <= ~clk_out; // Toggle clock output
    end
end
endmodule