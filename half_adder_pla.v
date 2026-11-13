`timescale 1ns/1ps

module half_adder_pla(
    input A, B,
    output Sum, Carry
);

assign Sum = (~A & B) | (A & ~B);
assign Carry = A & B;

endmodule
