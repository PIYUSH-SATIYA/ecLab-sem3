// Design
module andGate (
    input  a,
    input  b,
    output y
);

    assign y = a&b;

endmodule

// Testbench
module tb_andGate;

    reg A, B;   // test inputs
    wire Y;     // test output

    // Instantiate the AND gate (Unit Under Test)
    andGate uut (
        .a(A),
        .b(B),
        .y(Y)
    );

    initial begin
    $dumpfile("And.vcd"); // name of the dump file
    $dumpvars(0, tb_andGate); // dump all vars from this module
    end

    initial begin
        $display("A B | Y");  // header

        A = 0; B = 0; #1 $display("%b %b | %b", A, B, Y);
        A = 0; B = 1; #1 $display("%b %b | %b", A, B, Y);
        A = 1; B = 0; #1 $display("%b %b | %b", A, B, Y);
        A = 1; B = 1; #1 $display("%b %b | %b", A, B, Y);

        $finish;
    end

endmodule
