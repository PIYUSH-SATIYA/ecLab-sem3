module orFromNand(
    input a,
    input b,
    output y
);

   wire nA, nB;

   nand(nA,a,a);
   nand(nB,b,b);
   nand(y,nA,nB);

endmodule


module tb;

   reg A,B;
   wire Y;

   orFromNand uut (.a(A),.b(B),.y(Y));

   initial begin
    $dumpfile("or from nand.vcd"); // name of the dump file
    $dumpvars(0, tb); // dump all vars from this module
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