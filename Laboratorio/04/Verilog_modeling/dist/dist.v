`timescale 1ns / 1ps


module dist(

    input clk,
    input rst,
    input din_rdy,
    input din,
    output dout,
    output dout_rdy,
    input db_mode,
    input addr
);
    
parameter Reset_ST=0, ST_0=1, ST_1=2, ST_2=3, ST_3=4, ST_4=5, ST_5=6, ST_6=7;

wire clk,rst, din_rdy,dout_rdy, db_mode;
wire [31:0] din, addr;
wire [17:0] dout;

reg [17:0] p1,p2,p3,p4,dout_tmp;
reg [31:0] addr_reg,din_reg;
reg done;
reg[2:0] STATE; 
reg [7:0] image_segment [0:512]; 
reg [7:0] middleres1,middleres2,middleres3,middleres4;



assign dout = dout_tmp;
assign dout_rdy = done;

always@(posedge clk)
begin
 if (rst ==1'b1) begin
    STATE <= Reset_ST;
    done <= 1'b0;
    dout_tmp <= 0;
 end 
 else begin 
    
    case(STATE)
        
        Reset_ST: begin
            //operation
            done <= 1'b0;
            dout_tmp <=0;
            //transition
            STATE<=ST_0;        
        end
        
        ST_0: begin
            //operation
            done<= 1'b0;
            dout_tmp<= 0;
            
            //transition
            if (din_rdy == 1'b1)
                STATE <= ST_1;
            else
                STATE <=ST_0;
            
        end
        
        ST_1: begin
        
            //operation
            din_reg<= din;
            addr_reg<=addr;
        
            //transition
            if(db_mode== 1'b1)
                STATE <= ST_2;
            else
                STATE <= ST_3;
        end
        
        ST_2:begin
            //operation
                image_segment[addr_reg]     <= din_reg[31:24];
                image_segment[addr_reg+1]   <= din_reg[23:16];
                image_segment[addr_reg+2]   <= din_reg[15:8];
                image_segment[addr_reg+3]   <= din_reg[7:0];
            //transition
            STATE <= ST_6;
        end
        
        // db_mode 0
        ST_3:begin
            //operation
            middleres1 <= din_reg[31:24]    - image_segment[addr_reg];
            middleres2 <= din_reg[23:16]    - image_segment[addr_reg+1];
            middleres3 <= din_reg[15:8]     - image_segment[addr_reg+2];
            middleres4 <= din_reg[7:0]      - image_segment[addr_reg+3];
            //transition
            STATE <= ST_4;
        end
        
        ST_4:begin
            //operation
            p1 <= {"00", middleres1*middleres1};
            p2 <= {"00", middleres2*middleres2};
            p3 <= {"00", middleres3*middleres3};
            p4 <= {"00", middleres4*middleres4};
            //transition
            STATE<= ST_5;
        end
        
        ST_5:begin
            //operation
            dout_tmp <= p1+p2+p3+p4;
            //transition
            STATE <= ST_6;
        end
        
        ST_6:begin
            //operation
            done <= 1'b1;
            //transition
            STATE<=ST_0;
        end
        
        default: begin
        //operation
        //transition
        end
    endcase
 
 end 
end




endmodule
