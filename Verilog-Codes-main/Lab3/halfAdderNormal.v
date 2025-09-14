module half_adder (
    input a,
    input b,
    output sum,
    output carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

module tb_half_adder;
    reg A, B;
    wire Sum, Carry;

    half_adder uut (
        .a(A),
        .b(B),
        .sum(Sum),
        .carry(Carry)
    );

    initial begin
        $dumpfile("HalfAdderNormal.vcd");
        $dumpvars(0, tb_half_adder);
        $display("A B | Sum Carry");

        A=0; B=0; #1 $display("%b %b |  %b    %b", A, B, Sum, Carry);
        A=0; B=1; #1 $display("%b %b |  %b    %b", A, B, Sum, Carry);
        A=1; B=0; #1 $display("%b %b |  %b    %b", A, B, Sum, Carry);
        A=1; B=1; #1 $display("%b %b |  %b    %b", A, B, Sum, Carry);

        $finish;
    end
endmodule
