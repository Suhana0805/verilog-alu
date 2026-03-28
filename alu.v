// File: alu.v
// Description: 4-bit Arithmetic Logic Unit
module alu(
    input [3:0] A,          // 4-bit input A
    input [3:0] B,          // 4-bit input B
    input [2:0] ALU_Sel,    // 3-bit selector to choose the operation
    output [3:0] ALU_Out,   // 4-bit result output
    output CarryOut         // 1-bit carry output
);

    reg [4:0] ALU_Result;   // 5-bit register to catch overflow (carry)

    // Assign the lower 4 bits to the output, and the 5th bit to the carry
    assign ALU_Out = ALU_Result[3:0];
    assign CarryOut = ALU_Result[4];

    // This block runs every time A, B, or ALU_Sel changes
    always @(*) begin
        case(ALU_Sel)
            3'b000: ALU_Result = A + B;       // Addition
            3'b001: ALU_Result = A - B;       // Subtraction
            3'b010: ALU_Result = A & B;       // Logical AND
            3'b011: ALU_Result = A | B;       // Logical OR
            3'b100: ALU_Result = A ^ B;       // Logical XOR
            default: ALU_Result = A + B;      // Default case
        endcase
    end
endmodule