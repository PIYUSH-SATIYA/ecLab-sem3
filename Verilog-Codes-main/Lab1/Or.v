module orGate(
    input a,
    input b,
    output y
);
    or (y ,a , b);

endmodule

module tbOrGate;
   reg A, B;
   wire Y;

   orGate uut ( .a(A), .b(B), .y(Y));

   initial begin
    $dumpfile("Or.vcd"); // name of the dump file
    $dumpvars(0, tbOrGate); // dump all vars from this module
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