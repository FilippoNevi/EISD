// Mos 6502 Instantiation

module m6502 (clk, addr, datai, datao, irq_n, nmi_n,
              sob_n, res_n, rdy, vpab, sync, we_n, oeb);
    input           clk;
    output [15:0]   addr;   // Address bus
    input   [7:0]   datai;  // Data bus in
    output  [7:0]   datao;  // Data bus out
    output          oeb;    // Data bus negtive enable
    input           irq_n;  // Interrupt request
    input           nmi_n;  // Non-makable interrupt request
    input           res_n;  // Reset
    input           rdy ;   // Ready
    input           sob_n;  // Set Overflow bit
    output          sync;   // Indicates an opcode fetch
    output          vpab;   // Vector Pull Address
    output          we_n;   // Write enable (1=read, 0=write)

    wire    dataenb;    //  TRI enable from the M6502
    wire    vpa;
    wire    oen;
    wire    clk_n;      //  clock to the M6502

    assign vpab=~vpa;

    assign oen = !(!clk | we_n);

    assign oeb=~oen;

    assign clk_n=~clk;

    m6502_org core (.clk(clk_n),    .addr(addr),    .datai(datai),
                    .datao(datao),  .irq_n(irq_n),  .nmi_n(nmi_n),
                    .sob_n(sob_n),  .res_n(res_n),  .rdy(rdy),
                    .vpa(vpa),      .sync(sync),    .we_n(we_n),
                    .dataenb(dataenb));

endmodule // module m6502
