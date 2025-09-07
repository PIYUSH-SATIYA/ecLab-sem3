module xorGate (
    input a,
    input b,
    output y
);

    assign y = a ^ b;

endmodule

module tb_xorGate;

    reg A, B;
    wire Y;

    xorGate uut (
        .a(A),
        .b(B),
        .y(Y)
    );

    initial begin
        $dumpfile("Xor.vcd"); // name of the dump file
        $dumpvars(0, tb_xorGate); // dump all vars from this module
    end

    initial begin
        $display("A B | Y");

        A = 0; B = 0; #1 $display("%b %b | %b", A, B, Y);
        A = 0; B = 1; #1 $display("%b %b | %b", A, B, Y);
        A = 1; B = 0; #1 $display("%b %b | %b", A, B, Y);
        A = 1; B = 1; #1 $display("%b %b | %b", A, B, Y);

        $finish;
    end

endmodule
