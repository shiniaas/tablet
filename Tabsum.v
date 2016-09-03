`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/02 15:49:12
// Design Name: 
// Module Name: Tabsum
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


module Tabsum(
    input reset,
    input clk,
    input start,
    input allow_start,
    input stop,
    input over,
    output reg [3:0] num6,
    output reg [3:0] num5,
    output reg [3:0] num4
    );
    initial
    begin
        num6 = 0;
        num5 = 0;
        num4 = 0;
    end
    always @ (posedge clk or posedge reset)
    begin
        if(reset)
        begin
            num6 = 0;
            num5 = 0;
            num4 = 0;
        end
        else if(start && allow_start && !stop && !over)
        begin
            num4 = num4 + 1;
            if(num4 == 10)
            begin
                num4 = 0;
                num5 = num5 + 1;
                if(num5 == 10)
                begin
                    num5 = 0;
                    num6 = num6 + 1;
                end
            end
        end
        else if(stop)
        begin
        end
    end
endmodule
