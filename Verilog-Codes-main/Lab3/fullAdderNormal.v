module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module tb_full_adder;
    reg A, B, Cin;
    wire Sum, Cout;

    full_adder uut (
        .a(A),
        .b(B),
        .cin(Cin),
        .sum(Sum),
        .cout(Cout)
    );

    initial begin
        $dumpfile("fullAdderNormal.vcd");
        $dumpvars(0, tb_full_adder);
        $display("A B Cin | Sum Cout");
        
        A=0; B=0; Cin=0; #1 $display("%b %b  %b  |  %b    %b", A, B, Cin, Sum, Cout);
        A=0; B=0; Cin=1; #1 $display("%b %b  %b  |  %b    %b", A, B, Cin, Sum, Cout);
        A=0; B=1; Cin=0; #1 $display("%b %b  %b  |  %b    %b", A, B, Cin, Sum, Cout);
        A=0; B=1; Cin=1; #1 $display("%b %b  %b  |  %b    %b", A, B, Cin, Sum, Cout);
        A=1; B=0; Cin=0; #1 $display("%b %b  %b  |  %b    %b", A, B, Cin, Sum, Cout);
        A=1; B=0; Cin=1; #1 $display("%b %b  %b  |  %b    %b", A, B, Cin, Sum, Cout);
        A=1; B=1; Cin=0; #1 $display("%b %b  %b  |  %b    %b", A, B, Cin, Sum, Cout);
        A=1; B=1; Cin=1; #1 $display("%b %b  %b  |  %b    %b", A, B, Cin, Sum, Cout);

        $finish;
    end
endmodule
