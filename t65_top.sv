module t65_top (
    input logic rst_n,
    input logic enable,
    input logic clk,
    input logic rdy,
    input logic abort_n,
    input logic irq_n,
    input logic nmi_n,
    input logic so_n,
    output logic r_not_w,
    output logic sync,
    output logic ef,
    output logic mf,
    output logic xf,
    output logic ml_n,
    output logic vp_n,
    output logic vda,
    output logic vpa,
    output logic [15:0] addr,
    inout logic [7:0] data
);
    logic [23:0] full_addr;
    logic [7:0] data_i;
    logic [7:0] data_o;

    T65 core (
        .Mode(2'b00), // 6502 mode
        .BCD_en(1'b0), // 2A03/2A07
    
        .Res_n(rst_n),
        .Enable(enable),
        .Clk(clk),
        .Rdy(rdy),
        .Abort_n(abort_n),
        .IRQ_n(irq_n),
        .NMI_n(nmi_n),
        .SO_n(so_n),
        .R_W_n(r_not_w),
        .Sync(sync),
        .EF(ef),
        .MF(mf),
        .XF(xf),
        .ML_n(ml_n),
        .VP_n(vp_n),
        .VDA(vda),
        .VPA(vpa),
        .A(full_addr),
        .DI(data_i),
        .DO(data_o)
    );
    assign addr = full_addr[15:0];
    assign data = r_not_w ? 7'bz : data_o;
    assign data_i = data;

endmodule;
