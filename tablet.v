`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/02 14:44:57
// Design Name: 
// Module Name: tablet
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


module tablet(
    input reset,
    input clk,
    input start,
    input key_input,
    input sel,//1表示显示当前瓶药片数，0表示当前瓶数
    input [3:0] f_num,
    input [3:0] l_num,
    output green,
    output red,
    output speaker,
    output [7:0] led,
    output [6:0] content
    );
    
    wire [6:0] seg, seg1, seg2, seg3, seg2_1, seg3_1, seg4, seg5, seg6;
    wire [3:0] num, num1, num2, num3, num2_1, num3_1, num4, num5, num6;
    wire low, low_h, low_2, allow_start, stop, change, over, pre_over;
    
    assign green = start && !over;
    assign red = over;
    assign over = stop && pre_over;
    
    DCLK D1(clk, low, low_h, low_2);
    READ_KEY R1(reset, key_input, f_num, l_num, num1, num, speaker, allow_start);
    decoder d1(num, num1, num2, num3, num2_1, num3_1, num4, num5, num6, seg, seg1, seg2, seg3, seg2_1, seg3_1, seg4, seg5, seg6);
    SHOW S1(low_h, sel, seg, seg1, seg2, seg3, seg2_1, seg3_1, seg4, seg5, seg6, led, content);
    Bottle_sum B1(reset, change, num3, num2, pre_over);
    S_Bottsum S2(reset, low, start, allow_start, stop, over, num3_1, num2_1, change);
    Compare C1(num3_1, num2_1, num1, num, stop);
    Tabsum T1(reset, low, start, allow_start, stop, over, num6, num5, num4);
    //Restart R2(reset, allow_start, over, change, num, num1, num2, num3, num2_1, num3_1, num4, num5, num6);
endmodule
