`timescale 1ns / 1ps

module root(
    input clk,
    input rst,
    input din_rdy,
    input din,
    output dout,
    output dout_rdy
    );

wire clk,rst,din_rdy,dout_rdy;
reg done;
wire[31:0] din,dout;
reg[31:0] Root,Counter,Rem_s,Number;
reg[2:0] STATUS,NEXT_STATUS,prova;

parameter Reset_ST=0;
parameter ST_0=1, ST_1=2,ST_2=3, ST_3=4, ST_4=5, ST_5=6;


assign dout = Root;
assign dout_rdy = done;


always@(STATUS,din_rdy,din,Counter)
begin
    case (STATUS)
     
        Reset_ST: begin
            NEXT_STATUS <= ST_0;
        end
        
        ST_0: begin
            if (din_rdy == 1'b1)
                NEXT_STATUS <= ST_1;
            else
                NEXT_STATUS <= ST_0;
        end
        
        ST_1: begin
            NEXT_STATUS <= ST_2;
        end
        
        ST_2: begin
            if (Counter < 32'd16)
                NEXT_STATUS <= ST_3; 
            else
                NEXT_STATUS <= ST_4;
        end
        
        ST_3: begin
            NEXT_STATUS <= ST_2;
        end
        
        ST_4: begin
            NEXT_STATUS <= ST_5;
        end
        
        ST_5: begin
        end
        
        default: begin
            NEXT_STATUS <= STATUS;
        end
        
    endcase 
end



always@(posedge clk,negedge rst)
begin
    
    if (rst == 1'b0)begin
        STATUS<=Reset_ST;
        end
    else
    begin
        STATUS <= NEXT_STATUS;
        case (NEXT_STATUS) 
        
            Reset_ST:begin
                Root <=32'b0;
                done <= 1'b0;
            end
            
            ST_0:begin
                done <= 1'b0;
                Rem_s <= 32'b0;
                Counter <= 32'b0;
                Root <= 32'b0;
            end
            
            ST_1:begin
                Number<= din; 
            end
            
            ST_2:begin
                if (Counter<32'd16) begin
                    Rem_s<=(Rem_s << 2)+(Number >> 30); 
                    Root<=Root << 1; 
                    Number<=Number << 2; 
                end 

            end
            
            ST_3:begin
                if (Root<Rem_s) begin
                    Rem_s <= Rem_s - Root - 1;
                    Root <= Root +2;
                end
                Counter<=Counter+1;
            end
            
                        
            ST_4:begin
                done <= 1'b1;
                Root<= Root >> 1;
            end
            
            ST_5:begin
            end
        endcase
    end 
end
endmodule