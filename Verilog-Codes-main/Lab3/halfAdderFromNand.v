module half_adder_nand (
    input a,
    input b,
    output sum,
    output carry
);
    wire nand1, nand2, nand3, nand4, nand5;

    nand(nand1, a, b);
    nand(nand2, a, nand1);
    nand(nand3, b, nand1);
    nand(sum, nand2, nand3);     // XOR using NANDs
    nand(carry, nand1, nand1);   // AND using NANDs

endmodule

module tb_half_adder_nand;
    reg A, B;
    wire Sum, Carry;

    half_adder_nand uut (
        .a(A),
        .b(B),
        .sum(Sum),
        .carry(Carry)
    );

    initial begin
        $dumpfile("halfAdderFromNand.vcd");
        $dumpvars(0, tb_half_adder_nand);
        $display("A B | Sum Carry");

        A=0; B=0; #1 $display("%b %b |  %b    %b", A, B, Sum, Carry);
        A=0; B=1; #1 $display("%b %b |  %b    %b", A, B, Sum, Carry);
        A=1; B=0; #1 $display("%b %b |  %b    %b", A, B, Sum, Carry);
        A=1; B=1; #1 $display("%b %b |  %b    %b", A, B, Sum, Carry);

        $finish;
    end
endmodule
