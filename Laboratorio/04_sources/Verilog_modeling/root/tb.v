`timescale 1ns / 1ps

module tb();

reg clk, rst,din_rdy;
reg [31:0] din;

wire dout_rdy;
wire [31:0] dout;

root dut(.clk(clk), 
         .rst(rst), 
         .din_rdy(din_rdy),
         .din(din),
         .dout_rdy(dout_rdy),
         .dout(dout)
         );

initial 
begin
   clk <= 1'b0;
   rst <= #10 1'b1;
   rst <= #30 1'b0;
   din_rdy <= #40 1'b1;
   din_rdy <= #60 1'b0;
   
   din <= #40 32'd16;
end

always #10 clk <= !clk; 

endmodule