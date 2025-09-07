module xnorFromNand(
    input a,
    input b,
    output y
);

    wire t1, t2, t3;

    nand(t1, a, b);
    nand(t2, a, t1);
    nand(t3, b, t1);
    nand(y, t2, t3);

endmodule


module tb_xnorFromNand;

    reg A, B;
    wire Y;

    xnorFromNand uut (.a(A), .b(B), .y(Y));

    initial begin
        $dumpfile("xnor from nand.vcd"); // name of the dump file
        $dumpvars(0, tb_xnorFromNand); // dump all vars from this module
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
