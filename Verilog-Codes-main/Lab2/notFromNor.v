module notFromNor(
    input a,
    output y
);

    nor(y, a, a);

endmodule


module tb_notFromNor;

    reg A;
    wire Y;

    notFromNor uut (.a(A), .y(Y));

    initial begin
        $dumpfile("not from nor.vcd"); // name of the dump file
        $dumpvars(0, tb_notFromNor); // dump all vars from this module
    end

    initial begin
        $display("A | Y");
        A = 0; #1 $display("%b | %b", A, Y);
        A = 1; #1 $display("%b | %b", A, Y);
        $finish;
    end

endmodule
