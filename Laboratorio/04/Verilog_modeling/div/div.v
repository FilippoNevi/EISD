`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2019 10:24:14
// Design Name: 
// Module Name: div
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


module div(
    input clk,
    input rst,
    input din_rdy,
    input din,
    output dout,
    input dout_rdy
    );
    


parameter SIZE = 32;
parameter COLOR_SIZE = 16;
parameter Reset_ST=0, ST_0=1, ST_1=2, ST_2=3, ST_3=4, ST_4=5;

wire clk,rst,din_rdy,dout_rdy;
wire [SIZE-1:0]din,dout;

reg [SIZE-1:0] tmp_dout;
reg [SIZE-1:0] tmp_value;
reg [COLOR_SIZE-1:0] r,g,b;
reg [2:0] STATE,NEXT_STATE;
reg done;

assign dout_rdy = done;

assign dout = tmp_dout;

always@(din_rdy,din,STATE)
begin 
    
    case(STATE)
    
        Reset_ST:begin
            NEXT_STATE<= ST_0;
        end
        
        ST_0: begin
            if (din_rdy == 1'b1)
                NEXT_STATE <= ST_1;
             else
                NEXT_STATE <= ST_0;
            end

        ST_1: begin
            NEXT_STATE <= ST_2;
        end

        ST_2: begin
            NEXT_STATE <= ST_3;
        end

        ST_3: begin
            NEXT_STATE <= ST_4;
        end

        ST_4: begin
            NEXT_STATE <= ST_0;
        end

        default:begin
            NEXT_STATE <= STATE;
        end        
    endcase
end
   
always@(posedge clk,rst)
begin
    if (rst==1'b1)
    begin 
        STATE<= Reset_ST;
    end  
    else
    begin
        STATE<=NEXT_STATE;
        
        case(STATE)
        
            Reset_ST:begin
                done <= 1'b0;
                tmp_dout <= 0;
                r <= 0;
                g<= 0;
            end
            
            ST_0:begin
                done <= 1'b0;
                tmp_value <= din;
            end
            
            ST_1:begin
            
                r[7:0] <= tmp_value[7:0];
                g[7:0] <= tmp_value[15:8];
                b[7:0] <= tmp_value[23:16];
                
                r[15:8] <= 8'b0;
                g[15:8] <= 8'b0;
                b[15:8] <= 8'b0;
                
            end
            
            ST_2:begin
                r<= (r << 10) / (r+g+b);
                g<= (g << 10) / (r+g+b);
            end
            
            ST_3:begin
                tmp_dout[23:16] <= r[7:0];
                tmp_dout[15:0]  <= g[15:0];
            end
            
            ST_4:begin
                done<= 1'b1;
            end
            
            default:begin
                STATE<= NEXT_STATE;
            end
            
        endcase
    end
end
   
endmodule