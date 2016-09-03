`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/02 14:32:18
// Design Name: 
// Module Name: SHOW
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


module SHOW(
    input low_h,
    input sel,
    input[6:0] seg,
    input[6:0] seg1,
    input[6:0] seg2,
    input[6:0] seg3,
    input[6:0] seg2_1,
    input[6:0] seg3_1,
    input[6:0] seg4,
    input[6:0] seg5,
    input[6:0] seg6,
    output reg[7:0] led,
    output reg[6:0] content
    );
    integer sel_led;
    initial
    begin
        sel_led = 0;
        content = 7'b1111111;
    end
    always @ (posedge low_h)
    begin
        if(sel_led == 0)
        begin
            led = 8'b11111110;
            content = seg;    
        end
        else if(sel_led == 1)
        begin
            led = 8'b11111101;
            content = seg1;    
        end
        else if(sel_led == 2)
        begin
            led = 8'b11111011;
            if(sel)
            begin
                content = seg2_1;
            end
            else
            begin
                content = seg2;
            end
        end
        else if(sel_led == 3)
        begin
            led = 8'b11110111;
            if(sel)
            begin
                content = seg3_1;
            end
            else
            begin
                content = seg3;
            end                  
        end
        else if(sel_led == 4)
        begin
            led = 8'b11101111;
            content = seg4;
        end
        else if(sel_led == 5)
        begin
            led = 8'b11011111;
            content = seg5;
        end
        else if(sel_led == 6)
        begin
            led = 8'b10111111;
            content = seg6;
        end
        sel_led = sel_led + 1;
        if(sel_led == 7)
        begin
            sel_led = 0;
        end
    end
endmodule
