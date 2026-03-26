###################################################################

# Created by write_sdc on Wed Mar 25 15:36:59 2026

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
create_clock [get_ports clk]  -period 4  -waveform {0 2}
set_max_delay 5  -to [get_ports {d_out[63]}]
set_max_delay 5  -to [get_ports {d_out[62]}]
set_max_delay 5  -to [get_ports {d_out[61]}]
set_max_delay 5  -to [get_ports {d_out[60]}]
set_max_delay 5  -to [get_ports {d_out[59]}]
set_max_delay 5  -to [get_ports {d_out[58]}]
set_max_delay 5  -to [get_ports {d_out[57]}]
set_max_delay 5  -to [get_ports {d_out[56]}]
set_max_delay 5  -to [get_ports {d_out[55]}]
set_max_delay 5  -to [get_ports {d_out[54]}]
set_max_delay 5  -to [get_ports {d_out[53]}]
set_max_delay 5  -to [get_ports {d_out[52]}]
set_max_delay 5  -to [get_ports {d_out[51]}]
set_max_delay 5  -to [get_ports {d_out[50]}]
set_max_delay 5  -to [get_ports {d_out[49]}]
set_max_delay 5  -to [get_ports {d_out[48]}]
set_max_delay 5  -to [get_ports {d_out[47]}]
set_max_delay 5  -to [get_ports {d_out[46]}]
set_max_delay 5  -to [get_ports {d_out[45]}]
set_max_delay 5  -to [get_ports {d_out[44]}]
set_max_delay 5  -to [get_ports {d_out[43]}]
set_max_delay 5  -to [get_ports {d_out[42]}]
set_max_delay 5  -to [get_ports {d_out[41]}]
set_max_delay 5  -to [get_ports {d_out[40]}]
set_max_delay 5  -to [get_ports {d_out[39]}]
set_max_delay 5  -to [get_ports {d_out[38]}]
set_max_delay 5  -to [get_ports {d_out[37]}]
set_max_delay 5  -to [get_ports {d_out[36]}]
set_max_delay 5  -to [get_ports {d_out[35]}]
set_max_delay 5  -to [get_ports {d_out[34]}]
set_max_delay 5  -to [get_ports {d_out[33]}]
set_max_delay 5  -to [get_ports {d_out[32]}]
set_max_delay 5  -to [get_ports {d_out[31]}]
set_max_delay 5  -to [get_ports {d_out[30]}]
set_max_delay 5  -to [get_ports {d_out[29]}]
set_max_delay 5  -to [get_ports {d_out[28]}]
set_max_delay 5  -to [get_ports {d_out[27]}]
set_max_delay 5  -to [get_ports {d_out[26]}]
set_max_delay 5  -to [get_ports {d_out[25]}]
set_max_delay 5  -to [get_ports {d_out[24]}]
set_max_delay 5  -to [get_ports {d_out[23]}]
set_max_delay 5  -to [get_ports {d_out[22]}]
set_max_delay 5  -to [get_ports {d_out[21]}]
set_max_delay 5  -to [get_ports {d_out[20]}]
set_max_delay 5  -to [get_ports {d_out[19]}]
set_max_delay 5  -to [get_ports {d_out[18]}]
set_max_delay 5  -to [get_ports {d_out[17]}]
set_max_delay 5  -to [get_ports {d_out[16]}]
set_max_delay 5  -to [get_ports {d_out[15]}]
set_max_delay 5  -to [get_ports {d_out[14]}]
set_max_delay 5  -to [get_ports {d_out[13]}]
set_max_delay 5  -to [get_ports {d_out[12]}]
set_max_delay 5  -to [get_ports {d_out[11]}]
set_max_delay 5  -to [get_ports {d_out[10]}]
set_max_delay 5  -to [get_ports {d_out[9]}]
set_max_delay 5  -to [get_ports {d_out[8]}]
set_max_delay 5  -to [get_ports {d_out[7]}]
set_max_delay 5  -to [get_ports {d_out[6]}]
set_max_delay 5  -to [get_ports {d_out[5]}]
set_max_delay 5  -to [get_ports {d_out[4]}]
set_max_delay 5  -to [get_ports {d_out[3]}]
set_max_delay 5  -to [get_ports {d_out[2]}]
set_max_delay 5  -to [get_ports {d_out[1]}]
set_max_delay 5  -to [get_ports {d_out[0]}]
set_max_delay 5  -to [get_ports net_so]
set_max_delay 5  -to [get_ports {net_do[63]}]
set_max_delay 5  -to [get_ports {net_do[62]}]
set_max_delay 5  -to [get_ports {net_do[61]}]
set_max_delay 5  -to [get_ports {net_do[60]}]
set_max_delay 5  -to [get_ports {net_do[59]}]
set_max_delay 5  -to [get_ports {net_do[58]}]
set_max_delay 5  -to [get_ports {net_do[57]}]
set_max_delay 5  -to [get_ports {net_do[56]}]
set_max_delay 5  -to [get_ports {net_do[55]}]
set_max_delay 5  -to [get_ports {net_do[54]}]
set_max_delay 5  -to [get_ports {net_do[53]}]
set_max_delay 5  -to [get_ports {net_do[52]}]
set_max_delay 5  -to [get_ports {net_do[51]}]
set_max_delay 5  -to [get_ports {net_do[50]}]
set_max_delay 5  -to [get_ports {net_do[49]}]
set_max_delay 5  -to [get_ports {net_do[48]}]
set_max_delay 5  -to [get_ports {net_do[47]}]
set_max_delay 5  -to [get_ports {net_do[46]}]
set_max_delay 5  -to [get_ports {net_do[45]}]
set_max_delay 5  -to [get_ports {net_do[44]}]
set_max_delay 5  -to [get_ports {net_do[43]}]
set_max_delay 5  -to [get_ports {net_do[42]}]
set_max_delay 5  -to [get_ports {net_do[41]}]
set_max_delay 5  -to [get_ports {net_do[40]}]
set_max_delay 5  -to [get_ports {net_do[39]}]
set_max_delay 5  -to [get_ports {net_do[38]}]
set_max_delay 5  -to [get_ports {net_do[37]}]
set_max_delay 5  -to [get_ports {net_do[36]}]
set_max_delay 5  -to [get_ports {net_do[35]}]
set_max_delay 5  -to [get_ports {net_do[34]}]
set_max_delay 5  -to [get_ports {net_do[33]}]
set_max_delay 5  -to [get_ports {net_do[32]}]
set_max_delay 5  -to [get_ports {net_do[31]}]
set_max_delay 5  -to [get_ports {net_do[30]}]
set_max_delay 5  -to [get_ports {net_do[29]}]
set_max_delay 5  -to [get_ports {net_do[28]}]
set_max_delay 5  -to [get_ports {net_do[27]}]
set_max_delay 5  -to [get_ports {net_do[26]}]
set_max_delay 5  -to [get_ports {net_do[25]}]
set_max_delay 5  -to [get_ports {net_do[24]}]
set_max_delay 5  -to [get_ports {net_do[23]}]
set_max_delay 5  -to [get_ports {net_do[22]}]
set_max_delay 5  -to [get_ports {net_do[21]}]
set_max_delay 5  -to [get_ports {net_do[20]}]
set_max_delay 5  -to [get_ports {net_do[19]}]
set_max_delay 5  -to [get_ports {net_do[18]}]
set_max_delay 5  -to [get_ports {net_do[17]}]
set_max_delay 5  -to [get_ports {net_do[16]}]
set_max_delay 5  -to [get_ports {net_do[15]}]
set_max_delay 5  -to [get_ports {net_do[14]}]
set_max_delay 5  -to [get_ports {net_do[13]}]
set_max_delay 5  -to [get_ports {net_do[12]}]
set_max_delay 5  -to [get_ports {net_do[11]}]
set_max_delay 5  -to [get_ports {net_do[10]}]
set_max_delay 5  -to [get_ports {net_do[9]}]
set_max_delay 5  -to [get_ports {net_do[8]}]
set_max_delay 5  -to [get_ports {net_do[7]}]
set_max_delay 5  -to [get_ports {net_do[6]}]
set_max_delay 5  -to [get_ports {net_do[5]}]
set_max_delay 5  -to [get_ports {net_do[4]}]
set_max_delay 5  -to [get_ports {net_do[3]}]
set_max_delay 5  -to [get_ports {net_do[2]}]
set_max_delay 5  -to [get_ports {net_do[1]}]
set_max_delay 5  -to [get_ports {net_do[0]}]
set_max_delay 5  -to [get_ports net_ri]
set_max_delay 5  -from [list [get_ports clk] [get_ports reset] [get_ports {addr[1]}]           \
[get_ports {addr[0]}] [get_ports {d_in[63]}] [get_ports {d_in[62]}] [get_ports \
{d_in[61]}] [get_ports {d_in[60]}] [get_ports {d_in[59]}] [get_ports           \
{d_in[58]}] [get_ports {d_in[57]}] [get_ports {d_in[56]}] [get_ports           \
{d_in[55]}] [get_ports {d_in[54]}] [get_ports {d_in[53]}] [get_ports           \
{d_in[52]}] [get_ports {d_in[51]}] [get_ports {d_in[50]}] [get_ports           \
{d_in[49]}] [get_ports {d_in[48]}] [get_ports {d_in[47]}] [get_ports           \
{d_in[46]}] [get_ports {d_in[45]}] [get_ports {d_in[44]}] [get_ports           \
{d_in[43]}] [get_ports {d_in[42]}] [get_ports {d_in[41]}] [get_ports           \
{d_in[40]}] [get_ports {d_in[39]}] [get_ports {d_in[38]}] [get_ports           \
{d_in[37]}] [get_ports {d_in[36]}] [get_ports {d_in[35]}] [get_ports           \
{d_in[34]}] [get_ports {d_in[33]}] [get_ports {d_in[32]}] [get_ports           \
{d_in[31]}] [get_ports {d_in[30]}] [get_ports {d_in[29]}] [get_ports           \
{d_in[28]}] [get_ports {d_in[27]}] [get_ports {d_in[26]}] [get_ports           \
{d_in[25]}] [get_ports {d_in[24]}] [get_ports {d_in[23]}] [get_ports           \
{d_in[22]}] [get_ports {d_in[21]}] [get_ports {d_in[20]}] [get_ports           \
{d_in[19]}] [get_ports {d_in[18]}] [get_ports {d_in[17]}] [get_ports           \
{d_in[16]}] [get_ports {d_in[15]}] [get_ports {d_in[14]}] [get_ports           \
{d_in[13]}] [get_ports {d_in[12]}] [get_ports {d_in[11]}] [get_ports           \
{d_in[10]}] [get_ports {d_in[9]}] [get_ports {d_in[8]}] [get_ports {d_in[7]}]  \
[get_ports {d_in[6]}] [get_ports {d_in[5]}] [get_ports {d_in[4]}] [get_ports   \
{d_in[3]}] [get_ports {d_in[2]}] [get_ports {d_in[1]}] [get_ports {d_in[0]}]   \
[get_ports nicEn] [get_ports nicWrEn] [get_ports net_ro] [get_ports net_si]    \
[get_ports {net_di[63]}] [get_ports {net_di[62]}] [get_ports {net_di[61]}]     \
[get_ports {net_di[60]}] [get_ports {net_di[59]}] [get_ports {net_di[58]}]     \
[get_ports {net_di[57]}] [get_ports {net_di[56]}] [get_ports {net_di[55]}]     \
[get_ports {net_di[54]}] [get_ports {net_di[53]}] [get_ports {net_di[52]}]     \
[get_ports {net_di[51]}] [get_ports {net_di[50]}] [get_ports {net_di[49]}]     \
[get_ports {net_di[48]}] [get_ports {net_di[47]}] [get_ports {net_di[46]}]     \
[get_ports {net_di[45]}] [get_ports {net_di[44]}] [get_ports {net_di[43]}]     \
[get_ports {net_di[42]}] [get_ports {net_di[41]}] [get_ports {net_di[40]}]     \
[get_ports {net_di[39]}] [get_ports {net_di[38]}] [get_ports {net_di[37]}]     \
[get_ports {net_di[36]}] [get_ports {net_di[35]}] [get_ports {net_di[34]}]     \
[get_ports {net_di[33]}] [get_ports {net_di[32]}] [get_ports {net_di[31]}]     \
[get_ports {net_di[30]}] [get_ports {net_di[29]}] [get_ports {net_di[28]}]     \
[get_ports {net_di[27]}] [get_ports {net_di[26]}] [get_ports {net_di[25]}]     \
[get_ports {net_di[24]}] [get_ports {net_di[23]}] [get_ports {net_di[22]}]     \
[get_ports {net_di[21]}] [get_ports {net_di[20]}] [get_ports {net_di[19]}]     \
[get_ports {net_di[18]}] [get_ports {net_di[17]}] [get_ports {net_di[16]}]     \
[get_ports {net_di[15]}] [get_ports {net_di[14]}] [get_ports {net_di[13]}]     \
[get_ports {net_di[12]}] [get_ports {net_di[11]}] [get_ports {net_di[10]}]     \
[get_ports {net_di[9]}] [get_ports {net_di[8]}] [get_ports {net_di[7]}]        \
[get_ports {net_di[6]}] [get_ports {net_di[5]}] [get_ports {net_di[4]}]        \
[get_ports {net_di[3]}] [get_ports {net_di[2]}] [get_ports {net_di[1]}]        \
[get_ports {net_di[0]}] [get_ports net_polarity]]
