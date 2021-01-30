`timescale 1ns / 1ps

module gcd(
    input clk,
    input rst,
    input din1,
    input din2,
    input din_rdy,
    output dout,
    output dout_rdy
    );



wire ... clk;
wire [...] dout,din1,din2;
reg [2:0] STATE,...;
parameter Reset_ST=0, ST_0=1,ST_1=2,ST_2=3,ST_3=4,ST_4=5,ST_5=6,ST_6=7;

reg [31:0] a,b,dout_tmp;

reg done;

assign dout_rdy = done;
assign dout = dout_tmp;

//FSM
always@(...)
begin
case(STATE)
   //Implement
end

//datapath
always@( posedge clk,rst )
begin
    if (rst == 1'b1) begin
       ...
    end
    
    case(NEXT_STATE)
    
        Reset_ST:begin
            done <= 1'b0;
            a <= 32'b0;
            b <= 32'b0;
        end
        
        ST_0:begin
            ...
        end
       
        ST_1: begin
            ...
        end
        
        ST_2:begin

        end
        
        ST_3:begin

        end
        
        ST_4:begin
            a<= a - b;
        end
    
        ST_5:begin
            b <= b - a;
        end
    
        ST_6:begin
            ...
        end
    
        default: begin
            NEXT_STATE <= STATE;
        end
    
    endcase
end

endmodule