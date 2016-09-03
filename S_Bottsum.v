`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/02 15:16:15
// Design Name: 
// Module Name: S_Bottsum
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


module S_Bottsum(
    input reset,
    input clk,
    input start,
    input allow_start,
    input stop,
    input over,
    output reg [3:0] num3_1,
    output reg [3:0] num2_1,
    output reg change
    );
    reg flag;
    initial
    begin
        flag = 0;
        num2_1 = 0;
        num3_1 = 0;
        change = 0;
    end
    always @ (posedge clk or posedge reset)
    begin
        if(reset)
        begin
            flag = 0;
            num2_1 = 0;
            num3_1 = 0;
            change = 0;
        end
        else
        begin
        change = 0;
        if(start && allow_start && !stop && !over)
        begin
            num2_1 = num2_1 + 1;
            if(num2_1 == 10)
            begin
                num2_1 = 0;
                num3_1 = num3_1 + 1;
            end
        end
        else if(start && allow_start && stop && !over)
        begin
            if(flag)
            begin
                change = 1;
                num2_1 = 0;
                num3_1 = 0;
                flag = 0;
            end
            else
            begin
                flag = 1;
            end
        end
        end
    end
endmodule
