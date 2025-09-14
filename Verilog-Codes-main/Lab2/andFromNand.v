module andFromNand(
    input a,
    input b,
    output y
);

    wire t;

    nand(t, a, b);       // first NAND
    nand(y, t, t);       // NAND with itself -> AND

endmodule


//AND from NAND

module tbAndFromNand;
    reg A, B;
    wire Y;

    andFromNand uut(
        .a(A),
        .b(B),
        .y(Y)
    );
    
    initial begin
        $dumpfile("andFromNand.vcd"); // name of the dump file
        $dumpvars(0, tbAndFromNand); // dump all vars from this module
    end

    initial begin
        $display("A B | Y");
        A=0; B=0; #1 $display("%b %b | %b", A, B, Y);
        A=0; B=1; #1 $display("%b %b | %b", A, B, Y);
        A=1; B=0; #1 $display("%b %b | %b", A, B, Y);
        A=1; B=1; #1 $display("%b %b | %b", A, B, Y);
        $finish;
    end
endmodule
