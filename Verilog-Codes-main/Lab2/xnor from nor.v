module xnorFromNor(
    input a,
    input b,
    output y
);

    wire nA, nB, t1, t2, t3, t4;

    nor(nA, a, a);      // NOT A
    nor(nB, b, b);      // NOT B
    nor(t1, a, b);      // A NOR B
    nor(t2, nA, nB);    // NOT A NOR NOT B
    nor(t3, t1, t2);
    nor(y, t3, t3);     // final inversion to get XNOR

endmodule


module tb_xnorFromNor;

    reg A, B;
    wire Y;

    xnorFromNor uut (.a(A), .b(B), .y(Y));

    initial begin
        $dumpfile("xnor from nor.vcd"); // name of the dump file
        $dumpvars(0, tb_xnorFromNor); // dump all vars from this module
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
