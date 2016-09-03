`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/02 16:30:05
// Design Name: 
// Module Name: Compare
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


module Compare(
    input[3:0] fact_f,
    input[3:0] fact_l,
    input[3:0] set_f,
    input[3:0] set_l,
    output stop
    );
    assign stop = !((fact_f^set_f) || (fact_l^set_l));// && !changed;
endmodule
