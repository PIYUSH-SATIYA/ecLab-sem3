module mux4to1 (
    input wire [3:0] in,
    input wire [1:0] sel,
    output wire y
);
    assign y = in[sel];
endmodule

// testbench
module tb_mux4to1;
    reg [3:0] in;
    reg [1:0] sel;
    wire y;

    mux4to1 uut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("mux.vcd");
        $dumpvars(0, tb_mux4to1);
        $display("in    sel | y");
        
        in = 4'b0110;

        sel = 2'b00; #1 $display("%b  %b | %b", in, sel, y);
        sel = 2'b01; #1 $display("%b  %b | %b", in, sel, y);
        sel = 2'b10; #1 $display("%b  %b | %b", in, sel, y);
        sel = 2'b11; #1 $display("%b  %b | %b", in, sel, y);

        $finish;
    end
endmodule
