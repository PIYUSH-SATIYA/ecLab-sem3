module notFromNand(
    input a,
    output y
);

   nand(y,a,a);

endmodule

module tb;

   reg A;
   wire Y;

   notFromNand uut (.a(A),.y(Y));

   initial begin
    $dumpfile("not from nand.vcd"); // name of the dump file
    $dumpvars(0, tb); // dump all vars from this module
   end

   initial begin

    $display("A | Y");
    A = 0; #1 $display("%b | %b", A, Y);
    A = 1; #1 $display("%b | %b", A, Y);

    $finish;
   end

endmodule