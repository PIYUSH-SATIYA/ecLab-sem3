module xnorGate (
    input a,
    input b,
    output y
);

    assign y = ~(a ^ b);

endmodule

module tb_xnorGate;

    reg A, B;
    wire Y;

    xnorGate uut (
        .a(A),
        .b(B),
        .y(Y)
    );

    initial begin
        $dumpfile("Xnor.vcd"); // name of the dump file
        $dumpvars(0, tb_xnorGate); // dump all vars from this module
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
