//negative-edge-triggered flip-flop
module negative_edge_ff(
input S, //SET
input R, //RESET
input CLK,
output reg Q,
output Q_BAR );
always @(negedge CLK)
begin
  if (R) // Asynchronous reset
   Q <= 1'b0; 
  else if (S) // Asynchronous set
   Q <= 1'b1;
   else
    Q <= Q_BAR;
end
assign Q_BAR = ~Q;
endmodule
