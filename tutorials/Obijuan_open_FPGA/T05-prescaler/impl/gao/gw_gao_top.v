module gw_gao(
    \count[23] ,
    \count[22] ,
    \count[21] ,
    \count[20] ,
    \count[19] ,
    \count[18] ,
    \count[17] ,
    \count[16] ,
    \count[15] ,
    \count[14] ,
    \count[13] ,
    \count[12] ,
    \count[11] ,
    \count[10] ,
    \count[9] ,
    \count[8] ,
    \count[7] ,
    \count[6] ,
    \count[5] ,
    \count[4] ,
    \count[3] ,
    \count[2] ,
    \count[1] ,
    \count[0] ,
    clk_in,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \count[23] ;
input \count[22] ;
input \count[21] ;
input \count[20] ;
input \count[19] ;
input \count[18] ;
input \count[17] ;
input \count[16] ;
input \count[15] ;
input \count[14] ;
input \count[13] ;
input \count[12] ;
input \count[11] ;
input \count[10] ;
input \count[9] ;
input \count[8] ;
input \count[7] ;
input \count[6] ;
input \count[5] ;
input \count[4] ;
input \count[3] ;
input \count[2] ;
input \count[1] ;
input \count[0] ;
input clk_in;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \count[23] ;
wire \count[22] ;
wire \count[21] ;
wire \count[20] ;
wire \count[19] ;
wire \count[18] ;
wire \count[17] ;
wire \count[16] ;
wire \count[15] ;
wire \count[14] ;
wire \count[13] ;
wire \count[12] ;
wire \count[11] ;
wire \count[10] ;
wire \count[9] ;
wire \count[8] ;
wire \count[7] ;
wire \count[6] ;
wire \count[5] ;
wire \count[4] ;
wire \count[3] ;
wire \count[2] ;
wire \count[1] ;
wire \count[0] ;
wire clk_in;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;
wire tdo_er2;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(tdo_er2)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top u_ao_top(
    .control(control0[9:0]),
    .data_i({\count[23] ,\count[22] ,\count[21] ,\count[20] ,\count[19] ,\count[18] ,\count[17] ,\count[16] ,\count[15] ,\count[14] ,\count[13] ,\count[12] ,\count[11] ,\count[10] ,\count[9] ,\count[8] ,\count[7] ,\count[6] ,\count[5] ,\count[4] ,\count[3] ,\count[2] ,\count[1] ,\count[0] }),
    .clk_i(clk_in)
);

endmodule
