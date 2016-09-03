`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/02 15:48:17
// Design Name: 
// Module Name: Bottle_sum
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


module Bottle_sum(
    input reset,
    input change,
    output reg [3:0] num3,
    output reg [3:0] num2,
    output reg pre_over
    );
    initial
    begin
        num3 = 0;
        num2 = 1;
        pre_over = 0;
    end
    always @ (posedge change or posedge reset)
    begin
        if(reset)
        begin
            num3 = 0;
            num2 = 1;
            pre_over = 0;
        end
        else if(change)
        begin
            num2 = num2 + 1;
            if(num3 == 1 && num2 == 8)
            begin
                pre_over = 1;
            end
            else if(num2 == 10)
            begin
                num2 = 0;
                num3 = num3 + 1;
            end
        end
        else
        begin
        end
    end
endmodule
