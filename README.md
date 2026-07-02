# UART-Verilog

A Verilog implementation of the UART (Universal Asynchronous Receiver/Transmitter) protocol featuring configurable baud rate generation, UART transmitter, receiver, testbenches, and simulation results using Vivado.

---

## Features

- UART Transmitter (TX)
- UART Receiver (RX)
- Baud Rate Generator
- Configurable Baud Rate
- Top-Level UART Module
- Verilog Testbenches
- Simulation Waveforms
- FPGA Ready (Vivado)

---

## Project Structure

```
UART-Verilog/
│
├── src/
│   ├── baud_generator.v
│   ├── uart_tx.v
│   ├── uart_rx.v
│   └── uart_top.v
│
├── testbench/
│   ├── uart_tx_tb.v
│   ├── uart_rx_tb.v
│   └── uart_top_tb.v
│
├── waveforms/
│
├── docs/
│
├── constraints/
│   └── top.xdc
│
└── README.md
```

---

## UART Frame Format

```
| Start | Data (8 bits) | Stop |
```

- 1 Start Bit
- 8 Data Bits
- No Parity
- 1 Stop Bit

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
- XSim Simulator

---

## Future Improvements

- Parity Bit Support
- FIFO Buffer
- Configurable Data Length
- Interrupt Support
- Hardware Implementation on FPGA

---

## Author

**Gunpreet Kaur**
