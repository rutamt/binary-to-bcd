# 8-Bit Binary to BCD Converter

This Verilog module converts an 8-bit binary number into a 12-bit Binary-Coded Decimal (BCD) format using the standard "Double Dabble" (Shift-and-Add-3) algorithm.

## What is BCD?

**Binary-Coded Decimal (BCD)** is a way of representing decimal numbers where each individual digit is represented by its own 4-bit binary sequence.

In standard binary, the number `255` is represented as a single block of 8 bits: `11111111`.
In BCD, the number `255` is broken down into its three decimal digits (2, 5, and 5), and each digit gets its own 4-bit code:

* **2** = `0010`
* **5** = `0101`
* **5** = `0101`

So, `255` in BCD is `0010 0101 0101`. This makes it much easier to display numbers on digital screens like 7-segment displays.

## Module Ports

* **`binary` (Input):** An 8-bit wire accepting values from `0` to `255` (`8'b00000000` to `8'b11111111`).
* **`bcd` (Output):** A 12-bit register outputting the BCD equivalent. The 12 bits are divided into three 4-bit sections representing the Hundreds, Tens, and Ones columns.

## How It Works

The converter uses the **Double Dabble** algorithm. It works by shifting the binary input left one bit at a time into the BCD register. After each shift, it checks the 4-bit columns (Ones, Tens, Hundreds). If any column has a value of `5` or greater, it adds `3` to that specific column before the next shift. This automatically handles the conversion from base-2 to base-10 representations.
