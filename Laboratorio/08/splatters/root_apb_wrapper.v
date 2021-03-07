`timescale 1ns / 1ps

module root_apb_wrapper(
    input pclk,
    input presetn,
    input paddr,
    input psel,
    input penable,
    input pwrite,
    input pwdata,
    output pready,
    output prdata
);

// From Master to Root
wire pclk, presetn, psel, penable, pwrite;
wire [31:0] paddr;
wire [31:0] pwdata;
// From Root to Master
wire pready;
wire [31:0] prdata;

root root_0(
    .clk(pclk),
    .rst(presetn),
    .din_rdy(penable),
    .din(pwdata),
    .dout(prdata),
    .dout_rdy(pready)
)

endmodule
