// File: alu_tb.v
// Description: Testbench for the 4-bit ALU
`timescale 1ns / 1ps

module alu_tb;
    // Inputs are declared as 'reg'
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] ALU_Sel;

    // Outputs are declared as 'wire'
    wire [3:0] ALU_Out;
    wire CarryOut;

    // Instantiate the ALU module
    alu uut (
        .A(A), 
        .B(B), 
        .ALU_Sel(ALU_Sel), 
        .ALU_Out(ALU_Out), 
        .CarryOut(CarryOut)
    );

    initial begin
        // These two lines generate a file for GTKWave to show graphs
        $dumpfile("dump.vcd");
        $dumpvars(0, alu_tb);

        // Print outputs to the terminal
        $monitor("Time=%0t | A=%b, B=%b, Sel=%b | Out=%b, Carry=%b", $time, A, B, ALU_Sel, ALU_Out, CarryOut);

        // TEST CASE 1: Addition (5 + 3 = 8)
        A = 4'b0101; B = 4'b0011; ALU_Sel = 3'b000;
        #10; // Wait 10 time units

        // TEST CASE 2: Addition with Carry (15 + 1 = 16 -> Output:0000, Carry:1)
        A = 4'b1111; B = 4'b0001; ALU_Sel = 3'b000;
        #10;

        // TEST CASE 3: Subtraction (10 - 4 = 6)
        A = 4'b1010; B = 4'b0100; ALU_Sel = 3'b001;
        #10;

        // TEST CASE 4: Logical AND
        A = 4'b1100; B = 4'b1010; ALU_Sel = 3'b010;
        #10;

        // TEST CASE 5: Logical OR
        A = 4'b1100; B = 4'b1010; ALU_Sel = 3'b011;
        #10;

        $finish; // End simulation
    end
endmodule