module xorFromNand(
    input a,
    input b,
    output y
);

   wire n1,n2,n3;

   nand(n1,a,b);
   nand(n2,n1,a);
   nand(n3,n1,b);
   nand(y,n2,n3);

endmodule

module tb;

   reg A,B;
   wire Y;

   xorFromNand uut (.a(A),.b(B),.y(Y));

   initial begin
    $dumpfile("xor from nand.vcd"); // name of the dump file
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