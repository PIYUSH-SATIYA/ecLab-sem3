module full_subtractor (
    input a,
    input b,
    input bin,
    output diff,
    output borrow
);
    assign diff = a ^ b ^ bin;
    assign borrow = (~a & b) | ((~(a ^ b)) & bin);
endmodule

// testbench

module tb_full_subtractor;
    reg A, B, Bin;
    wire Diff, Borrow;

    full_subtractor uut (
        .a(A),
        .b(B),
        .bin(Bin),
        .diff(Diff),
        .borrow(Borrow)
    );

    initial begin
        $dumpfile("FullSubtractor.vcd");
        $dumpvars(0, tb_full_subtractor);
        $display("A B Bin | Diff Borrow");

        A=0; B=0; Bin=0; #1 $display("%b %b  %b  |   %b     %b", A, B, Bin, Diff, Borrow);
        A=0; B=1; Bin=0; #1 $display("%b %b  %b  |   %b     %b", A, B, Bin, Diff, Borrow);
        A=1; B=0; Bin=0; #1 $display("%b %b  %b  |   %b     %b", A, B, Bin, Diff, Borrow);
        A=1; B=1; Bin=0; #1 $display("%b %b  %b  |   %b     %b", A, B, Bin, Diff, Borrow);

        A=0; B=0; Bin=1; #1 $display("%b %b  %b  |   %b     %b", A, B, Bin, Diff, Borrow);
        A=0; B=1; Bin=1; #1 $display("%b %b  %b  |   %b     %b", A, B, Bin, Diff, Borrow);
        A=1; B=0; Bin=1; #1 $display("%b %b  %b  |   %b     %b", A, B, Bin, Diff, Borrow);
        A=1; B=1; Bin=1; #1 $display("%b %b  %b  |   %b     %b", A, B, Bin, Diff, Borrow);

        $finish;
    end
endmodule

