module demux1to8 (
    input wire in,
    input wire [2:0] sel,
    output reg [7:0] out
);
    always @(*) begin
        out = 8'b00000000;
        out[sel] = in;
    end
endmodule

// testbench
module tb_demux1to8;
    reg in;
    reg [2:0] sel;
    wire [7:0] out;

    demux1to8 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("demux.vcd");
        $dumpvars(0, tb_demux1to8);
        $display("in sel | out");
        
        in = 1'b1;

        sel = 3'b000; #1 $display("%b  %b | %b", in, sel, out);
        sel = 3'b001; #1 $display("%b  %b | %b", in, sel, out);
        sel = 3'b010; #1 $display("%b  %b | %b", in, sel, out);
        sel = 3'b011; #1 $display("%b  %b | %b", in, sel, out);
        sel = 3'b100; #1 $display("%b  %b | %b", in, sel, out);
        sel = 3'b101; #1 $display("%b  %b | %b", in, sel, out);
        sel = 3'b110; #1 $display("%b  %b | %b", in, sel, out);
        sel = 3'b111; #1 $display("%b  %b | %b", in, sel, out);

        in = 1'b0;
        $display("\nTesting with in=0:");
        sel = 3'b010; #1 $display("%b  %b | %b", in, sel, out);z
        sel = 3'b101; #1 $display("%b  %b | %b", in, sel, out);

        $finish;
    end
endmodule
