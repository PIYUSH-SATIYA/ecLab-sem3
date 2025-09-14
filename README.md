# ⚡ Verilog Crash Course & Workflow Notes

---

## 📁 Directory Workflow

For any `.v` file (with design + testbench in one):

<!-- Command may differ for OS other than Linux or if you are writing testbench and design in separate files -->

```bash
iverilog myFile.v -o myFile.vvp    # Compile
vvp myFile.vvp                     # Run simulation
gtkwave myFile.vcd                 # View waveforms (if dumped correctly)
```

---

## 📐 Verilog Basics

### 🔹 Module Structure

```verilog
module my_module (
    input a,
    input b,
    output y
);
    assign y = a & b;
endmodule
```

### 🔹 Common Data Types

| Keyword  | Purpose                      |
| -------- | ---------------------------- |
| `input`  | Input port                   |
| `output` | Output port                  |
| `wire`   | Default for connecting logic |
| `reg`    | Used in initial/always       |

---

## 🔌 Basic Gates in Verilog

| Gate | Symbol | Verilog Syntax       |
| ---- | ------ | -------------------- |
| AND  | `&`    | `assign y = a & b;`  |
| OR   | `\|`   | `assign y = a \| b;` |
| NOT  | `~`    | `assign y = ~a;`     |
| XOR  | `^`    | `assign y = a ^ b;`  |
| NAND | `nand` | `nand(y, a, b);`     |
| NOR  | `nor`  | `nor(y, a, b);`      |

---

## 🔁 Universal Gates from NAND

### NOT

```verilog
nand(y, a, a);    // ~a
```

### AND

```verilog
nand(n1, a, b);
nand(y, n1, n1);  // ~(~(a & b)) = a & b
```

### OR

```verilog
nand(n1, a, a);   // ~a
nand(n2, b, b);   // ~b
nand(y, n1, n2);  // ~(~a & ~b) = a | b
```

### XOR

```verilog
nand(n1, a, b);
nand(n2, a, n1);
nand(n3, b, n1);
nand(y, n2, n3);  // a ^ b
```

---

## ➗ Half Adder

### Truth Table

| A   | B   | Sum | Carry |
| --- | --- | --- | ----- |
| 0   | 0   | 0   | 0     |
| 0   | 1   | 1   | 0     |
| 1   | 0   | 1   | 0     |
| 1   | 1   | 0   | 1     |

### Verilog Implementation

```verilog
assign sum = a ^ b;
assign carry = a & b;
```

---

## ➕ Full Adder

**Adds:** `a + b + cin`

### Truth Table

| A   | B   | Cin | Sum | Cout |
| --- | --- | --- | --- | ---- |
| 0   | 0   | 0   | 0   | 0    |
| 0   | 1   | 0   | 1   | 0    |
| 1   | 1   | 1   | 1   | 1    |
| .   | .   | .   | .   | .    |

### Verilog Implementation

```verilog
assign sum = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (a & cin);
```

---

## 🧪 Testbench Essentials

```verilog
module tb;
    reg A, B;
    wire Y;

    your_module uut (.a(A), .b(B), .y(Y));

    initial begin
        $dumpfile("myFile.vcd");      // VCD file
        $dumpvars(0, tb);             // Dump all from tb
        $display("A B | Y");

        A=0; B=0; #1 $display("%b %b | %b", A, B, Y);
        // ... more test cases
        $finish;
    end
endmodule
```

---

## 🧰 Pro Alias for One-Line Compile-Run-View

```bash
alias vsim='f() { iverilog "$1.v" -o "$1.vvp" && vvp "$1.vvp" && gtkwave "$1.vcd"; }; f'
```

**Usage:**

```bash
vsim myFile
```

---

## 🔁 Automate All .v Files in Lab Folder

**Save as `run_all.sh`:**

```bash
#!/bin/bash

for lab in Lab1 Lab2 Lab3; do
    echo "Entering $lab/"
    for file in "$lab"/*.v; do
        [ -f "$file" ] || continue
        base=$(basename "$file" .v)

        echo "Compiling $file..."
        iverilog "$file" -o "$lab/$base.vvp"

        echo "Running simulation for $base..."
        vvp "$lab/$base.vvp"
    done
    echo "Done with $lab/"
    echo
done
```

**Run with:**

```bash
chmod +x run_all.sh
./run_all.sh
```

---

## ✅ Final Checklist

-   ✅ Add `$dumpfile("yourFile.vcd");`
-   ✅ Add `$dumpvars(0, tb_module);`
-   ✅ Always end with `$finish;`
-   ✅ Match `.vcd` filename for gtkwave

---
