`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/02 11:16:40
// Design Name: 
// Module Name: READ_KEY
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


module READ_KEY(
    input reset,
    input flag,
    input [3:0] f_num,
    input [3:0] l_num,
    output reg [3:0] ff_num,
    output reg [3:0] fl_num,
    output reg speaker,
    output reg allow_start
    );
    
    initial
    begin
        ff_num = 0;
        fl_num = 0;
        speaker = 0;
        allow_start = 0;
    end
    
    always @ (posedge flag or posedge reset)
    begin
        if(reset)
        begin
            ff_num = 0;
            fl_num = 0;
            speaker = 0;
            allow_start = 0;
        end
        else
        begin
        speaker = 0;
        allow_start = 0;
        if(flag)
        begin
            if(f_num > 5 || ((f_num == 5) && (l_num > 0)) || ((f_num == 0) && (l_num == 0)))
            begin 
                speaker = 1;
            end
            else
            begin
                ff_num = f_num;
                fl_num = l_num;
                allow_start = 1;
            end
        end
        else
        begin
            ff_num = 0;
            fl_num = 0;
        end
        end
    end
    
endmodule
