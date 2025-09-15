module mux8to1 (
    input wire [7:0] in,
    input wire [2:0] sel,
    output wire y
);
    assign y = in[sel];
endmodule

// testbench
module tb_mux8to1;
    reg [7:0] in;
    reg [2:0] sel;
    wire y;

    mux8to1 uut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("mux.vcd");
        $dumpvars(0, tb_mux8to1);
        $display("in       sel | y");

        in = 8'b01101010;

        sel = 3'b000; #1 $display("%b  %b | %b", in, sel, y);
        sel = 3'b001; #1 $display("%b  %b | %b", in, sel, y);
        sel = 3'b010; #1 $display("%b  %b | %b", in, sel, y);
        sel = 3'b011; #1 $display("%b  %b | %b", in, sel, y);
        sel = 3'b100; #1 $display("%b  %b | %b", in, sel, y);
        sel = 3'b101; #1 $display("%b  %b | %b", in, sel, y);
        sel = 3'b110; #1 $display("%b  %b | %b", in, sel, y);
        sel = 3'b111; #1 $display("%b  %b | %b", in, sel, y);

        $finish;
    end
endmodule
