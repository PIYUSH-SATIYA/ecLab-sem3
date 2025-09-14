module half_subtractor (
    input a,
    input b,
    output diff,
    output borrow
);
    assign diff = a ^ b;
    assign borrow = (~a) & b;
endmodule


// Test bench
module tb_half_subtractor;
    reg A, B;
    wire Diff, Borrow;

    half_subtractor uut (
        .a(A),
        .b(B),
        .diff(Diff),
        .borrow(Borrow)
    );

    initial begin
        $dumpfile("HalfSubtractorNormal.vcd");
        $dumpvars(0, tb_half_subtractor);
        $display("A B | Diff Borrow");

        A=0; B=0; #1 $display("%b %b |   %b     %b", A, B, Diff, Borrow);
        A=0; B=1; #1 $display("%b %b |   %b     %b", A, B, Diff, Borrow);
        A=1; B=0; #1 $display("%b %b |   %b     %b", A, B, Diff, Borrow);
        A=1; B=1; #1 $display("%b %b |   %b     %b", A, B, Diff, Borrow);

        $finish;
    end
endmodule
