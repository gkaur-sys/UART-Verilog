`timescale 1ns/1ps

module uart_rx_tb;

reg clk;
reg resetn;
reg uart_rxd;
reg uart_rx_en;

wire uart_rx_break;
wire uart_rx_valid;
wire [7:0] uart_rx_data;

uart_rx uut
(
    .clk(clk),
    .resetn(resetn),
    .uart_rxd(uart_rxd),
    .uart_rx_en(uart_rx_en),
    .uart_rx_break(uart_rx_break),
    .uart_rx_valid(uart_rx_valid),
    .uart_rx_data(uart_rx_data)
);

always #10 clk = ~clk;

task send_byte;

input [7:0] data;

integer i;

begin

    uart_rxd = 0;
    #104166;

    for(i=0;i<8;i=i+1)
    begin
        uart_rxd = data[i];
        #104166;
    end

    uart_rxd = 1;
    #104166;

end

endtask

initial
begin

clk = 0;
resetn = 0;
uart_rxd = 1;
uart_rx_en = 1;

#100;

resetn = 1;

#100000;

send_byte(8'h41);

#500000;

$finish;

end

always @(posedge clk)
begin

if(uart_rx_valid)

$display("Received = %h",uart_rx_data);

end

endmodule
