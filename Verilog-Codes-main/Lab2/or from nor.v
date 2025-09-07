module orFromNor(
    input a,
    input b,
    output y
);

    wire nA, nB;

    nor(nA, a, a);
    nor(nB, b, b);
    nor(y, nA, nB);

endmodule


module tb_orFromNor;

    reg A, B;
    wire Y;

    orFromNor uut (.a(A), .b(B), .y(Y));

    initial begin
        $dumpfile("or from nor.vcd"); // name of the dump file
        $dumpvars(0, tb_orFromNor); // dump all vars from this module
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
