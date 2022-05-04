# First HDL

This repository contains first attempts to learn hardware design and Verilog HDL. It follows from the exercises as described in ["The Elements of Computing Systems" by Nisan and Schocken](https://www.nand2tetris.org). In some places I've gone ahead and done my own thing when I thought it was interesting.

I'm using Verilog (instead of using the HDL in the book) in order to learn on real tools and get practice writing test benches.

## Running

Install Icarus Verilog. Run the following from the command line from this directory:

```
> mkdir build && cd build
> iverilog -o first_hdl.out -c ../files.txt && vvp first_hdl.out
```