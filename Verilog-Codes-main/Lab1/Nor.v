module norGate(
    input a,
    input b,
    output y
);
    assign y = !(a|b);

endmodule

module tbNorGate;
   reg A, B;
   wire Y;

   norGate uut (.a(A), .b(B), .y(Y));

   initial begin
    $dumpfile("Nor.vcd"); // 
    $dumpvars(0, tbNorGate); 
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