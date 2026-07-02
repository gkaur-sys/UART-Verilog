`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2026 23:36:44
// Design Name: 
// Module Name: baud_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module baud_generator #(

    parameter clk_frq = 100_000_000, //100 Mhz 
    parameter baud_rate = 9600

    )(
    input wire clk, 
    input wire rst,
    input wire enable,
    output reg baud_tick);
    
    localparam integer  baud_count = clk_frq/baud_rate;
    integer counter; 
    
    always @(posedge clk or posedge rst) 
    begin 
        if(rst) 
        begin 
            counter <=0; 
            baud_tick = 1'b0; 
         end
       else if(!enable) // intead of relying on internal state , using a enable input
       begin 
        counter <=0; 
        baud_tick <= 1'b0;
       end
       else // when Tx not in high state , i.e baud_tick enabled 
       begin 
        if(counter == baud_count - 1) 
        begin 
            counter <=0; 
            baud_tick <= 1'b1; //trigger generated
        end
        else 
        begin 
            counter <= counter + 1; 
            baud_tick <= 1'b0;
         end 
     end 
  end 
endmodule
