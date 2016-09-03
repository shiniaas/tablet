`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/02 11:09:48
// Design Name: 
// Module Name: DCLK
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


module DCLK(
    input high,
    output reg low,
    output reg low_h,
    output reg low_2
    );
    integer k, k1, k2;
    initial
    begin
        low = 0;
        low_h = 0;
        k = 0;
        k1 = 0;
        k2 = 0;
    end
    always @ (posedge high)
    begin
        low_h = 0;
        low = 0;
        low_2 = 0;
        if(k1 == 100000)
        begin
            low_h = 1;
            k1 = 0;
        end
        if(k2 == 50000000)
        begin
            low_2 = 1;
            k2 = 0;
        end
        if(k == 100000000)
        begin
            low = 1;
            k = 0;
        end
        k1 = k1 + 1;
        k2 = k2 + 1;
        k = k + 1;
    end
endmodule
