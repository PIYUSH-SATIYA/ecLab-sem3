module xorFromNor(
    input a,
    input b,
    output y
);

    wire nA, nB, t1, t2, t3;

    nor(nA, a, a);     // NOT A
    nor(nB, b, b);     // NOT B
    nor(t1, a, nB);    // A NOR (NOT B)
    nor(t2, nA, b);    // (NOT A) NOR B
    nor(t3, t1, t2);   // (A NOR NOT B) NOR (NOT A NOR B)
    nor(y, t3, t3);    // final inversion to get XOR

endmodule


module tb_xorFromNor;

    reg A, B;
    wire Y;

    xorFromNor uut (.a(A), .b(B), .y(Y));

    initial begin
        $dumpfile("xor from nor.vcd"); // name of the dump file
        $dumpvars(0, tb_xorFromNor); // dump all vars from this module
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
