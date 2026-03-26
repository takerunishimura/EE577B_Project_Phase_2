###################################################################

# Created by write_sdc on Wed Mar 25 16:07:08 2026

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
create_clock [get_ports clk]  -period 4  -waveform {0 2}
set_max_delay 5  -to [get_ports node00_peri]
set_max_delay 5  -to [get_ports node00_peso]
set_max_delay 5  -to [get_ports {node00_pedo[63]}]
set_max_delay 5  -to [get_ports {node00_pedo[62]}]
set_max_delay 5  -to [get_ports {node00_pedo[61]}]
set_max_delay 5  -to [get_ports {node00_pedo[60]}]
set_max_delay 5  -to [get_ports {node00_pedo[59]}]
set_max_delay 5  -to [get_ports {node00_pedo[58]}]
set_max_delay 5  -to [get_ports {node00_pedo[57]}]
set_max_delay 5  -to [get_ports {node00_pedo[56]}]
set_max_delay 5  -to [get_ports {node00_pedo[55]}]
set_max_delay 5  -to [get_ports {node00_pedo[54]}]
set_max_delay 5  -to [get_ports {node00_pedo[53]}]
set_max_delay 5  -to [get_ports {node00_pedo[52]}]
set_max_delay 5  -to [get_ports {node00_pedo[51]}]
set_max_delay 5  -to [get_ports {node00_pedo[50]}]
set_max_delay 5  -to [get_ports {node00_pedo[49]}]
set_max_delay 5  -to [get_ports {node00_pedo[48]}]
set_max_delay 5  -to [get_ports {node00_pedo[47]}]
set_max_delay 5  -to [get_ports {node00_pedo[46]}]
set_max_delay 5  -to [get_ports {node00_pedo[45]}]
set_max_delay 5  -to [get_ports {node00_pedo[44]}]
set_max_delay 5  -to [get_ports {node00_pedo[43]}]
set_max_delay 5  -to [get_ports {node00_pedo[42]}]
set_max_delay 5  -to [get_ports {node00_pedo[41]}]
set_max_delay 5  -to [get_ports {node00_pedo[40]}]
set_max_delay 5  -to [get_ports {node00_pedo[39]}]
set_max_delay 5  -to [get_ports {node00_pedo[38]}]
set_max_delay 5  -to [get_ports {node00_pedo[37]}]
set_max_delay 5  -to [get_ports {node00_pedo[36]}]
set_max_delay 5  -to [get_ports {node00_pedo[35]}]
set_max_delay 5  -to [get_ports {node00_pedo[34]}]
set_max_delay 5  -to [get_ports {node00_pedo[33]}]
set_max_delay 5  -to [get_ports {node00_pedo[32]}]
set_max_delay 5  -to [get_ports {node00_pedo[31]}]
set_max_delay 5  -to [get_ports {node00_pedo[30]}]
set_max_delay 5  -to [get_ports {node00_pedo[29]}]
set_max_delay 5  -to [get_ports {node00_pedo[28]}]
set_max_delay 5  -to [get_ports {node00_pedo[27]}]
set_max_delay 5  -to [get_ports {node00_pedo[26]}]
set_max_delay 5  -to [get_ports {node00_pedo[25]}]
set_max_delay 5  -to [get_ports {node00_pedo[24]}]
set_max_delay 5  -to [get_ports {node00_pedo[23]}]
set_max_delay 5  -to [get_ports {node00_pedo[22]}]
set_max_delay 5  -to [get_ports {node00_pedo[21]}]
set_max_delay 5  -to [get_ports {node00_pedo[20]}]
set_max_delay 5  -to [get_ports {node00_pedo[19]}]
set_max_delay 5  -to [get_ports {node00_pedo[18]}]
set_max_delay 5  -to [get_ports {node00_pedo[17]}]
set_max_delay 5  -to [get_ports {node00_pedo[16]}]
set_max_delay 5  -to [get_ports {node00_pedo[15]}]
set_max_delay 5  -to [get_ports {node00_pedo[14]}]
set_max_delay 5  -to [get_ports {node00_pedo[13]}]
set_max_delay 5  -to [get_ports {node00_pedo[12]}]
set_max_delay 5  -to [get_ports {node00_pedo[11]}]
set_max_delay 5  -to [get_ports {node00_pedo[10]}]
set_max_delay 5  -to [get_ports {node00_pedo[9]}]
set_max_delay 5  -to [get_ports {node00_pedo[8]}]
set_max_delay 5  -to [get_ports {node00_pedo[7]}]
set_max_delay 5  -to [get_ports {node00_pedo[6]}]
set_max_delay 5  -to [get_ports {node00_pedo[5]}]
set_max_delay 5  -to [get_ports {node00_pedo[4]}]
set_max_delay 5  -to [get_ports {node00_pedo[3]}]
set_max_delay 5  -to [get_ports {node00_pedo[2]}]
set_max_delay 5  -to [get_ports {node00_pedo[1]}]
set_max_delay 5  -to [get_ports {node00_pedo[0]}]
set_max_delay 5  -to [get_ports node00_polarity]
set_max_delay 5  -to [get_ports node01_peri]
set_max_delay 5  -to [get_ports node01_peso]
set_max_delay 5  -to [get_ports {node01_pedo[63]}]
set_max_delay 5  -to [get_ports {node01_pedo[62]}]
set_max_delay 5  -to [get_ports {node01_pedo[61]}]
set_max_delay 5  -to [get_ports {node01_pedo[60]}]
set_max_delay 5  -to [get_ports {node01_pedo[59]}]
set_max_delay 5  -to [get_ports {node01_pedo[58]}]
set_max_delay 5  -to [get_ports {node01_pedo[57]}]
set_max_delay 5  -to [get_ports {node01_pedo[56]}]
set_max_delay 5  -to [get_ports {node01_pedo[55]}]
set_max_delay 5  -to [get_ports {node01_pedo[54]}]
set_max_delay 5  -to [get_ports {node01_pedo[53]}]
set_max_delay 5  -to [get_ports {node01_pedo[52]}]
set_max_delay 5  -to [get_ports {node01_pedo[51]}]
set_max_delay 5  -to [get_ports {node01_pedo[50]}]
set_max_delay 5  -to [get_ports {node01_pedo[49]}]
set_max_delay 5  -to [get_ports {node01_pedo[48]}]
set_max_delay 5  -to [get_ports {node01_pedo[47]}]
set_max_delay 5  -to [get_ports {node01_pedo[46]}]
set_max_delay 5  -to [get_ports {node01_pedo[45]}]
set_max_delay 5  -to [get_ports {node01_pedo[44]}]
set_max_delay 5  -to [get_ports {node01_pedo[43]}]
set_max_delay 5  -to [get_ports {node01_pedo[42]}]
set_max_delay 5  -to [get_ports {node01_pedo[41]}]
set_max_delay 5  -to [get_ports {node01_pedo[40]}]
set_max_delay 5  -to [get_ports {node01_pedo[39]}]
set_max_delay 5  -to [get_ports {node01_pedo[38]}]
set_max_delay 5  -to [get_ports {node01_pedo[37]}]
set_max_delay 5  -to [get_ports {node01_pedo[36]}]
set_max_delay 5  -to [get_ports {node01_pedo[35]}]
set_max_delay 5  -to [get_ports {node01_pedo[34]}]
set_max_delay 5  -to [get_ports {node01_pedo[33]}]
set_max_delay 5  -to [get_ports {node01_pedo[32]}]
set_max_delay 5  -to [get_ports {node01_pedo[31]}]
set_max_delay 5  -to [get_ports {node01_pedo[30]}]
set_max_delay 5  -to [get_ports {node01_pedo[29]}]
set_max_delay 5  -to [get_ports {node01_pedo[28]}]
set_max_delay 5  -to [get_ports {node01_pedo[27]}]
set_max_delay 5  -to [get_ports {node01_pedo[26]}]
set_max_delay 5  -to [get_ports {node01_pedo[25]}]
set_max_delay 5  -to [get_ports {node01_pedo[24]}]
set_max_delay 5  -to [get_ports {node01_pedo[23]}]
set_max_delay 5  -to [get_ports {node01_pedo[22]}]
set_max_delay 5  -to [get_ports {node01_pedo[21]}]
set_max_delay 5  -to [get_ports {node01_pedo[20]}]
set_max_delay 5  -to [get_ports {node01_pedo[19]}]
set_max_delay 5  -to [get_ports {node01_pedo[18]}]
set_max_delay 5  -to [get_ports {node01_pedo[17]}]
set_max_delay 5  -to [get_ports {node01_pedo[16]}]
set_max_delay 5  -to [get_ports {node01_pedo[15]}]
set_max_delay 5  -to [get_ports {node01_pedo[14]}]
set_max_delay 5  -to [get_ports {node01_pedo[13]}]
set_max_delay 5  -to [get_ports {node01_pedo[12]}]
set_max_delay 5  -to [get_ports {node01_pedo[11]}]
set_max_delay 5  -to [get_ports {node01_pedo[10]}]
set_max_delay 5  -to [get_ports {node01_pedo[9]}]
set_max_delay 5  -to [get_ports {node01_pedo[8]}]
set_max_delay 5  -to [get_ports {node01_pedo[7]}]
set_max_delay 5  -to [get_ports {node01_pedo[6]}]
set_max_delay 5  -to [get_ports {node01_pedo[5]}]
set_max_delay 5  -to [get_ports {node01_pedo[4]}]
set_max_delay 5  -to [get_ports {node01_pedo[3]}]
set_max_delay 5  -to [get_ports {node01_pedo[2]}]
set_max_delay 5  -to [get_ports {node01_pedo[1]}]
set_max_delay 5  -to [get_ports {node01_pedo[0]}]
set_max_delay 5  -to [get_ports node01_polarity]
set_max_delay 5  -to [get_ports node02_peri]
set_max_delay 5  -to [get_ports node02_peso]
set_max_delay 5  -to [get_ports {node02_pedo[63]}]
set_max_delay 5  -to [get_ports {node02_pedo[62]}]
set_max_delay 5  -to [get_ports {node02_pedo[61]}]
set_max_delay 5  -to [get_ports {node02_pedo[60]}]
set_max_delay 5  -to [get_ports {node02_pedo[59]}]
set_max_delay 5  -to [get_ports {node02_pedo[58]}]
set_max_delay 5  -to [get_ports {node02_pedo[57]}]
set_max_delay 5  -to [get_ports {node02_pedo[56]}]
set_max_delay 5  -to [get_ports {node02_pedo[55]}]
set_max_delay 5  -to [get_ports {node02_pedo[54]}]
set_max_delay 5  -to [get_ports {node02_pedo[53]}]
set_max_delay 5  -to [get_ports {node02_pedo[52]}]
set_max_delay 5  -to [get_ports {node02_pedo[51]}]
set_max_delay 5  -to [get_ports {node02_pedo[50]}]
set_max_delay 5  -to [get_ports {node02_pedo[49]}]
set_max_delay 5  -to [get_ports {node02_pedo[48]}]
set_max_delay 5  -to [get_ports {node02_pedo[47]}]
set_max_delay 5  -to [get_ports {node02_pedo[46]}]
set_max_delay 5  -to [get_ports {node02_pedo[45]}]
set_max_delay 5  -to [get_ports {node02_pedo[44]}]
set_max_delay 5  -to [get_ports {node02_pedo[43]}]
set_max_delay 5  -to [get_ports {node02_pedo[42]}]
set_max_delay 5  -to [get_ports {node02_pedo[41]}]
set_max_delay 5  -to [get_ports {node02_pedo[40]}]
set_max_delay 5  -to [get_ports {node02_pedo[39]}]
set_max_delay 5  -to [get_ports {node02_pedo[38]}]
set_max_delay 5  -to [get_ports {node02_pedo[37]}]
set_max_delay 5  -to [get_ports {node02_pedo[36]}]
set_max_delay 5  -to [get_ports {node02_pedo[35]}]
set_max_delay 5  -to [get_ports {node02_pedo[34]}]
set_max_delay 5  -to [get_ports {node02_pedo[33]}]
set_max_delay 5  -to [get_ports {node02_pedo[32]}]
set_max_delay 5  -to [get_ports {node02_pedo[31]}]
set_max_delay 5  -to [get_ports {node02_pedo[30]}]
set_max_delay 5  -to [get_ports {node02_pedo[29]}]
set_max_delay 5  -to [get_ports {node02_pedo[28]}]
set_max_delay 5  -to [get_ports {node02_pedo[27]}]
set_max_delay 5  -to [get_ports {node02_pedo[26]}]
set_max_delay 5  -to [get_ports {node02_pedo[25]}]
set_max_delay 5  -to [get_ports {node02_pedo[24]}]
set_max_delay 5  -to [get_ports {node02_pedo[23]}]
set_max_delay 5  -to [get_ports {node02_pedo[22]}]
set_max_delay 5  -to [get_ports {node02_pedo[21]}]
set_max_delay 5  -to [get_ports {node02_pedo[20]}]
set_max_delay 5  -to [get_ports {node02_pedo[19]}]
set_max_delay 5  -to [get_ports {node02_pedo[18]}]
set_max_delay 5  -to [get_ports {node02_pedo[17]}]
set_max_delay 5  -to [get_ports {node02_pedo[16]}]
set_max_delay 5  -to [get_ports {node02_pedo[15]}]
set_max_delay 5  -to [get_ports {node02_pedo[14]}]
set_max_delay 5  -to [get_ports {node02_pedo[13]}]
set_max_delay 5  -to [get_ports {node02_pedo[12]}]
set_max_delay 5  -to [get_ports {node02_pedo[11]}]
set_max_delay 5  -to [get_ports {node02_pedo[10]}]
set_max_delay 5  -to [get_ports {node02_pedo[9]}]
set_max_delay 5  -to [get_ports {node02_pedo[8]}]
set_max_delay 5  -to [get_ports {node02_pedo[7]}]
set_max_delay 5  -to [get_ports {node02_pedo[6]}]
set_max_delay 5  -to [get_ports {node02_pedo[5]}]
set_max_delay 5  -to [get_ports {node02_pedo[4]}]
set_max_delay 5  -to [get_ports {node02_pedo[3]}]
set_max_delay 5  -to [get_ports {node02_pedo[2]}]
set_max_delay 5  -to [get_ports {node02_pedo[1]}]
set_max_delay 5  -to [get_ports {node02_pedo[0]}]
set_max_delay 5  -to [get_ports node02_polarity]
set_max_delay 5  -to [get_ports node03_peri]
set_max_delay 5  -to [get_ports node03_peso]
set_max_delay 5  -to [get_ports {node03_pedo[63]}]
set_max_delay 5  -to [get_ports {node03_pedo[62]}]
set_max_delay 5  -to [get_ports {node03_pedo[61]}]
set_max_delay 5  -to [get_ports {node03_pedo[60]}]
set_max_delay 5  -to [get_ports {node03_pedo[59]}]
set_max_delay 5  -to [get_ports {node03_pedo[58]}]
set_max_delay 5  -to [get_ports {node03_pedo[57]}]
set_max_delay 5  -to [get_ports {node03_pedo[56]}]
set_max_delay 5  -to [get_ports {node03_pedo[55]}]
set_max_delay 5  -to [get_ports {node03_pedo[54]}]
set_max_delay 5  -to [get_ports {node03_pedo[53]}]
set_max_delay 5  -to [get_ports {node03_pedo[52]}]
set_max_delay 5  -to [get_ports {node03_pedo[51]}]
set_max_delay 5  -to [get_ports {node03_pedo[50]}]
set_max_delay 5  -to [get_ports {node03_pedo[49]}]
set_max_delay 5  -to [get_ports {node03_pedo[48]}]
set_max_delay 5  -to [get_ports {node03_pedo[47]}]
set_max_delay 5  -to [get_ports {node03_pedo[46]}]
set_max_delay 5  -to [get_ports {node03_pedo[45]}]
set_max_delay 5  -to [get_ports {node03_pedo[44]}]
set_max_delay 5  -to [get_ports {node03_pedo[43]}]
set_max_delay 5  -to [get_ports {node03_pedo[42]}]
set_max_delay 5  -to [get_ports {node03_pedo[41]}]
set_max_delay 5  -to [get_ports {node03_pedo[40]}]
set_max_delay 5  -to [get_ports {node03_pedo[39]}]
set_max_delay 5  -to [get_ports {node03_pedo[38]}]
set_max_delay 5  -to [get_ports {node03_pedo[37]}]
set_max_delay 5  -to [get_ports {node03_pedo[36]}]
set_max_delay 5  -to [get_ports {node03_pedo[35]}]
set_max_delay 5  -to [get_ports {node03_pedo[34]}]
set_max_delay 5  -to [get_ports {node03_pedo[33]}]
set_max_delay 5  -to [get_ports {node03_pedo[32]}]
set_max_delay 5  -to [get_ports {node03_pedo[31]}]
set_max_delay 5  -to [get_ports {node03_pedo[30]}]
set_max_delay 5  -to [get_ports {node03_pedo[29]}]
set_max_delay 5  -to [get_ports {node03_pedo[28]}]
set_max_delay 5  -to [get_ports {node03_pedo[27]}]
set_max_delay 5  -to [get_ports {node03_pedo[26]}]
set_max_delay 5  -to [get_ports {node03_pedo[25]}]
set_max_delay 5  -to [get_ports {node03_pedo[24]}]
set_max_delay 5  -to [get_ports {node03_pedo[23]}]
set_max_delay 5  -to [get_ports {node03_pedo[22]}]
set_max_delay 5  -to [get_ports {node03_pedo[21]}]
set_max_delay 5  -to [get_ports {node03_pedo[20]}]
set_max_delay 5  -to [get_ports {node03_pedo[19]}]
set_max_delay 5  -to [get_ports {node03_pedo[18]}]
set_max_delay 5  -to [get_ports {node03_pedo[17]}]
set_max_delay 5  -to [get_ports {node03_pedo[16]}]
set_max_delay 5  -to [get_ports {node03_pedo[15]}]
set_max_delay 5  -to [get_ports {node03_pedo[14]}]
set_max_delay 5  -to [get_ports {node03_pedo[13]}]
set_max_delay 5  -to [get_ports {node03_pedo[12]}]
set_max_delay 5  -to [get_ports {node03_pedo[11]}]
set_max_delay 5  -to [get_ports {node03_pedo[10]}]
set_max_delay 5  -to [get_ports {node03_pedo[9]}]
set_max_delay 5  -to [get_ports {node03_pedo[8]}]
set_max_delay 5  -to [get_ports {node03_pedo[7]}]
set_max_delay 5  -to [get_ports {node03_pedo[6]}]
set_max_delay 5  -to [get_ports {node03_pedo[5]}]
set_max_delay 5  -to [get_ports {node03_pedo[4]}]
set_max_delay 5  -to [get_ports {node03_pedo[3]}]
set_max_delay 5  -to [get_ports {node03_pedo[2]}]
set_max_delay 5  -to [get_ports {node03_pedo[1]}]
set_max_delay 5  -to [get_ports {node03_pedo[0]}]
set_max_delay 5  -to [get_ports node03_polarity]
set_max_delay 5  -to [get_ports node10_peri]
set_max_delay 5  -to [get_ports node10_peso]
set_max_delay 5  -to [get_ports {node10_pedo[63]}]
set_max_delay 5  -to [get_ports {node10_pedo[62]}]
set_max_delay 5  -to [get_ports {node10_pedo[61]}]
set_max_delay 5  -to [get_ports {node10_pedo[60]}]
set_max_delay 5  -to [get_ports {node10_pedo[59]}]
set_max_delay 5  -to [get_ports {node10_pedo[58]}]
set_max_delay 5  -to [get_ports {node10_pedo[57]}]
set_max_delay 5  -to [get_ports {node10_pedo[56]}]
set_max_delay 5  -to [get_ports {node10_pedo[55]}]
set_max_delay 5  -to [get_ports {node10_pedo[54]}]
set_max_delay 5  -to [get_ports {node10_pedo[53]}]
set_max_delay 5  -to [get_ports {node10_pedo[52]}]
set_max_delay 5  -to [get_ports {node10_pedo[51]}]
set_max_delay 5  -to [get_ports {node10_pedo[50]}]
set_max_delay 5  -to [get_ports {node10_pedo[49]}]
set_max_delay 5  -to [get_ports {node10_pedo[48]}]
set_max_delay 5  -to [get_ports {node10_pedo[47]}]
set_max_delay 5  -to [get_ports {node10_pedo[46]}]
set_max_delay 5  -to [get_ports {node10_pedo[45]}]
set_max_delay 5  -to [get_ports {node10_pedo[44]}]
set_max_delay 5  -to [get_ports {node10_pedo[43]}]
set_max_delay 5  -to [get_ports {node10_pedo[42]}]
set_max_delay 5  -to [get_ports {node10_pedo[41]}]
set_max_delay 5  -to [get_ports {node10_pedo[40]}]
set_max_delay 5  -to [get_ports {node10_pedo[39]}]
set_max_delay 5  -to [get_ports {node10_pedo[38]}]
set_max_delay 5  -to [get_ports {node10_pedo[37]}]
set_max_delay 5  -to [get_ports {node10_pedo[36]}]
set_max_delay 5  -to [get_ports {node10_pedo[35]}]
set_max_delay 5  -to [get_ports {node10_pedo[34]}]
set_max_delay 5  -to [get_ports {node10_pedo[33]}]
set_max_delay 5  -to [get_ports {node10_pedo[32]}]
set_max_delay 5  -to [get_ports {node10_pedo[31]}]
set_max_delay 5  -to [get_ports {node10_pedo[30]}]
set_max_delay 5  -to [get_ports {node10_pedo[29]}]
set_max_delay 5  -to [get_ports {node10_pedo[28]}]
set_max_delay 5  -to [get_ports {node10_pedo[27]}]
set_max_delay 5  -to [get_ports {node10_pedo[26]}]
set_max_delay 5  -to [get_ports {node10_pedo[25]}]
set_max_delay 5  -to [get_ports {node10_pedo[24]}]
set_max_delay 5  -to [get_ports {node10_pedo[23]}]
set_max_delay 5  -to [get_ports {node10_pedo[22]}]
set_max_delay 5  -to [get_ports {node10_pedo[21]}]
set_max_delay 5  -to [get_ports {node10_pedo[20]}]
set_max_delay 5  -to [get_ports {node10_pedo[19]}]
set_max_delay 5  -to [get_ports {node10_pedo[18]}]
set_max_delay 5  -to [get_ports {node10_pedo[17]}]
set_max_delay 5  -to [get_ports {node10_pedo[16]}]
set_max_delay 5  -to [get_ports {node10_pedo[15]}]
set_max_delay 5  -to [get_ports {node10_pedo[14]}]
set_max_delay 5  -to [get_ports {node10_pedo[13]}]
set_max_delay 5  -to [get_ports {node10_pedo[12]}]
set_max_delay 5  -to [get_ports {node10_pedo[11]}]
set_max_delay 5  -to [get_ports {node10_pedo[10]}]
set_max_delay 5  -to [get_ports {node10_pedo[9]}]
set_max_delay 5  -to [get_ports {node10_pedo[8]}]
set_max_delay 5  -to [get_ports {node10_pedo[7]}]
set_max_delay 5  -to [get_ports {node10_pedo[6]}]
set_max_delay 5  -to [get_ports {node10_pedo[5]}]
set_max_delay 5  -to [get_ports {node10_pedo[4]}]
set_max_delay 5  -to [get_ports {node10_pedo[3]}]
set_max_delay 5  -to [get_ports {node10_pedo[2]}]
set_max_delay 5  -to [get_ports {node10_pedo[1]}]
set_max_delay 5  -to [get_ports {node10_pedo[0]}]
set_max_delay 5  -to [get_ports node10_polarity]
set_max_delay 5  -to [get_ports node11_peri]
set_max_delay 5  -to [get_ports node11_peso]
set_max_delay 5  -to [get_ports {node11_pedo[63]}]
set_max_delay 5  -to [get_ports {node11_pedo[62]}]
set_max_delay 5  -to [get_ports {node11_pedo[61]}]
set_max_delay 5  -to [get_ports {node11_pedo[60]}]
set_max_delay 5  -to [get_ports {node11_pedo[59]}]
set_max_delay 5  -to [get_ports {node11_pedo[58]}]
set_max_delay 5  -to [get_ports {node11_pedo[57]}]
set_max_delay 5  -to [get_ports {node11_pedo[56]}]
set_max_delay 5  -to [get_ports {node11_pedo[55]}]
set_max_delay 5  -to [get_ports {node11_pedo[54]}]
set_max_delay 5  -to [get_ports {node11_pedo[53]}]
set_max_delay 5  -to [get_ports {node11_pedo[52]}]
set_max_delay 5  -to [get_ports {node11_pedo[51]}]
set_max_delay 5  -to [get_ports {node11_pedo[50]}]
set_max_delay 5  -to [get_ports {node11_pedo[49]}]
set_max_delay 5  -to [get_ports {node11_pedo[48]}]
set_max_delay 5  -to [get_ports {node11_pedo[47]}]
set_max_delay 5  -to [get_ports {node11_pedo[46]}]
set_max_delay 5  -to [get_ports {node11_pedo[45]}]
set_max_delay 5  -to [get_ports {node11_pedo[44]}]
set_max_delay 5  -to [get_ports {node11_pedo[43]}]
set_max_delay 5  -to [get_ports {node11_pedo[42]}]
set_max_delay 5  -to [get_ports {node11_pedo[41]}]
set_max_delay 5  -to [get_ports {node11_pedo[40]}]
set_max_delay 5  -to [get_ports {node11_pedo[39]}]
set_max_delay 5  -to [get_ports {node11_pedo[38]}]
set_max_delay 5  -to [get_ports {node11_pedo[37]}]
set_max_delay 5  -to [get_ports {node11_pedo[36]}]
set_max_delay 5  -to [get_ports {node11_pedo[35]}]
set_max_delay 5  -to [get_ports {node11_pedo[34]}]
set_max_delay 5  -to [get_ports {node11_pedo[33]}]
set_max_delay 5  -to [get_ports {node11_pedo[32]}]
set_max_delay 5  -to [get_ports {node11_pedo[31]}]
set_max_delay 5  -to [get_ports {node11_pedo[30]}]
set_max_delay 5  -to [get_ports {node11_pedo[29]}]
set_max_delay 5  -to [get_ports {node11_pedo[28]}]
set_max_delay 5  -to [get_ports {node11_pedo[27]}]
set_max_delay 5  -to [get_ports {node11_pedo[26]}]
set_max_delay 5  -to [get_ports {node11_pedo[25]}]
set_max_delay 5  -to [get_ports {node11_pedo[24]}]
set_max_delay 5  -to [get_ports {node11_pedo[23]}]
set_max_delay 5  -to [get_ports {node11_pedo[22]}]
set_max_delay 5  -to [get_ports {node11_pedo[21]}]
set_max_delay 5  -to [get_ports {node11_pedo[20]}]
set_max_delay 5  -to [get_ports {node11_pedo[19]}]
set_max_delay 5  -to [get_ports {node11_pedo[18]}]
set_max_delay 5  -to [get_ports {node11_pedo[17]}]
set_max_delay 5  -to [get_ports {node11_pedo[16]}]
set_max_delay 5  -to [get_ports {node11_pedo[15]}]
set_max_delay 5  -to [get_ports {node11_pedo[14]}]
set_max_delay 5  -to [get_ports {node11_pedo[13]}]
set_max_delay 5  -to [get_ports {node11_pedo[12]}]
set_max_delay 5  -to [get_ports {node11_pedo[11]}]
set_max_delay 5  -to [get_ports {node11_pedo[10]}]
set_max_delay 5  -to [get_ports {node11_pedo[9]}]
set_max_delay 5  -to [get_ports {node11_pedo[8]}]
set_max_delay 5  -to [get_ports {node11_pedo[7]}]
set_max_delay 5  -to [get_ports {node11_pedo[6]}]
set_max_delay 5  -to [get_ports {node11_pedo[5]}]
set_max_delay 5  -to [get_ports {node11_pedo[4]}]
set_max_delay 5  -to [get_ports {node11_pedo[3]}]
set_max_delay 5  -to [get_ports {node11_pedo[2]}]
set_max_delay 5  -to [get_ports {node11_pedo[1]}]
set_max_delay 5  -to [get_ports {node11_pedo[0]}]
set_max_delay 5  -to [get_ports node11_polarity]
set_max_delay 5  -to [get_ports node12_peri]
set_max_delay 5  -to [get_ports node12_peso]
set_max_delay 5  -to [get_ports {node12_pedo[63]}]
set_max_delay 5  -to [get_ports {node12_pedo[62]}]
set_max_delay 5  -to [get_ports {node12_pedo[61]}]
set_max_delay 5  -to [get_ports {node12_pedo[60]}]
set_max_delay 5  -to [get_ports {node12_pedo[59]}]
set_max_delay 5  -to [get_ports {node12_pedo[58]}]
set_max_delay 5  -to [get_ports {node12_pedo[57]}]
set_max_delay 5  -to [get_ports {node12_pedo[56]}]
set_max_delay 5  -to [get_ports {node12_pedo[55]}]
set_max_delay 5  -to [get_ports {node12_pedo[54]}]
set_max_delay 5  -to [get_ports {node12_pedo[53]}]
set_max_delay 5  -to [get_ports {node12_pedo[52]}]
set_max_delay 5  -to [get_ports {node12_pedo[51]}]
set_max_delay 5  -to [get_ports {node12_pedo[50]}]
set_max_delay 5  -to [get_ports {node12_pedo[49]}]
set_max_delay 5  -to [get_ports {node12_pedo[48]}]
set_max_delay 5  -to [get_ports {node12_pedo[47]}]
set_max_delay 5  -to [get_ports {node12_pedo[46]}]
set_max_delay 5  -to [get_ports {node12_pedo[45]}]
set_max_delay 5  -to [get_ports {node12_pedo[44]}]
set_max_delay 5  -to [get_ports {node12_pedo[43]}]
set_max_delay 5  -to [get_ports {node12_pedo[42]}]
set_max_delay 5  -to [get_ports {node12_pedo[41]}]
set_max_delay 5  -to [get_ports {node12_pedo[40]}]
set_max_delay 5  -to [get_ports {node12_pedo[39]}]
set_max_delay 5  -to [get_ports {node12_pedo[38]}]
set_max_delay 5  -to [get_ports {node12_pedo[37]}]
set_max_delay 5  -to [get_ports {node12_pedo[36]}]
set_max_delay 5  -to [get_ports {node12_pedo[35]}]
set_max_delay 5  -to [get_ports {node12_pedo[34]}]
set_max_delay 5  -to [get_ports {node12_pedo[33]}]
set_max_delay 5  -to [get_ports {node12_pedo[32]}]
set_max_delay 5  -to [get_ports {node12_pedo[31]}]
set_max_delay 5  -to [get_ports {node12_pedo[30]}]
set_max_delay 5  -to [get_ports {node12_pedo[29]}]
set_max_delay 5  -to [get_ports {node12_pedo[28]}]
set_max_delay 5  -to [get_ports {node12_pedo[27]}]
set_max_delay 5  -to [get_ports {node12_pedo[26]}]
set_max_delay 5  -to [get_ports {node12_pedo[25]}]
set_max_delay 5  -to [get_ports {node12_pedo[24]}]
set_max_delay 5  -to [get_ports {node12_pedo[23]}]
set_max_delay 5  -to [get_ports {node12_pedo[22]}]
set_max_delay 5  -to [get_ports {node12_pedo[21]}]
set_max_delay 5  -to [get_ports {node12_pedo[20]}]
set_max_delay 5  -to [get_ports {node12_pedo[19]}]
set_max_delay 5  -to [get_ports {node12_pedo[18]}]
set_max_delay 5  -to [get_ports {node12_pedo[17]}]
set_max_delay 5  -to [get_ports {node12_pedo[16]}]
set_max_delay 5  -to [get_ports {node12_pedo[15]}]
set_max_delay 5  -to [get_ports {node12_pedo[14]}]
set_max_delay 5  -to [get_ports {node12_pedo[13]}]
set_max_delay 5  -to [get_ports {node12_pedo[12]}]
set_max_delay 5  -to [get_ports {node12_pedo[11]}]
set_max_delay 5  -to [get_ports {node12_pedo[10]}]
set_max_delay 5  -to [get_ports {node12_pedo[9]}]
set_max_delay 5  -to [get_ports {node12_pedo[8]}]
set_max_delay 5  -to [get_ports {node12_pedo[7]}]
set_max_delay 5  -to [get_ports {node12_pedo[6]}]
set_max_delay 5  -to [get_ports {node12_pedo[5]}]
set_max_delay 5  -to [get_ports {node12_pedo[4]}]
set_max_delay 5  -to [get_ports {node12_pedo[3]}]
set_max_delay 5  -to [get_ports {node12_pedo[2]}]
set_max_delay 5  -to [get_ports {node12_pedo[1]}]
set_max_delay 5  -to [get_ports {node12_pedo[0]}]
set_max_delay 5  -to [get_ports node12_polarity]
set_max_delay 5  -to [get_ports node13_peri]
set_max_delay 5  -to [get_ports node13_peso]
set_max_delay 5  -to [get_ports {node13_pedo[63]}]
set_max_delay 5  -to [get_ports {node13_pedo[62]}]
set_max_delay 5  -to [get_ports {node13_pedo[61]}]
set_max_delay 5  -to [get_ports {node13_pedo[60]}]
set_max_delay 5  -to [get_ports {node13_pedo[59]}]
set_max_delay 5  -to [get_ports {node13_pedo[58]}]
set_max_delay 5  -to [get_ports {node13_pedo[57]}]
set_max_delay 5  -to [get_ports {node13_pedo[56]}]
set_max_delay 5  -to [get_ports {node13_pedo[55]}]
set_max_delay 5  -to [get_ports {node13_pedo[54]}]
set_max_delay 5  -to [get_ports {node13_pedo[53]}]
set_max_delay 5  -to [get_ports {node13_pedo[52]}]
set_max_delay 5  -to [get_ports {node13_pedo[51]}]
set_max_delay 5  -to [get_ports {node13_pedo[50]}]
set_max_delay 5  -to [get_ports {node13_pedo[49]}]
set_max_delay 5  -to [get_ports {node13_pedo[48]}]
set_max_delay 5  -to [get_ports {node13_pedo[47]}]
set_max_delay 5  -to [get_ports {node13_pedo[46]}]
set_max_delay 5  -to [get_ports {node13_pedo[45]}]
set_max_delay 5  -to [get_ports {node13_pedo[44]}]
set_max_delay 5  -to [get_ports {node13_pedo[43]}]
set_max_delay 5  -to [get_ports {node13_pedo[42]}]
set_max_delay 5  -to [get_ports {node13_pedo[41]}]
set_max_delay 5  -to [get_ports {node13_pedo[40]}]
set_max_delay 5  -to [get_ports {node13_pedo[39]}]
set_max_delay 5  -to [get_ports {node13_pedo[38]}]
set_max_delay 5  -to [get_ports {node13_pedo[37]}]
set_max_delay 5  -to [get_ports {node13_pedo[36]}]
set_max_delay 5  -to [get_ports {node13_pedo[35]}]
set_max_delay 5  -to [get_ports {node13_pedo[34]}]
set_max_delay 5  -to [get_ports {node13_pedo[33]}]
set_max_delay 5  -to [get_ports {node13_pedo[32]}]
set_max_delay 5  -to [get_ports {node13_pedo[31]}]
set_max_delay 5  -to [get_ports {node13_pedo[30]}]
set_max_delay 5  -to [get_ports {node13_pedo[29]}]
set_max_delay 5  -to [get_ports {node13_pedo[28]}]
set_max_delay 5  -to [get_ports {node13_pedo[27]}]
set_max_delay 5  -to [get_ports {node13_pedo[26]}]
set_max_delay 5  -to [get_ports {node13_pedo[25]}]
set_max_delay 5  -to [get_ports {node13_pedo[24]}]
set_max_delay 5  -to [get_ports {node13_pedo[23]}]
set_max_delay 5  -to [get_ports {node13_pedo[22]}]
set_max_delay 5  -to [get_ports {node13_pedo[21]}]
set_max_delay 5  -to [get_ports {node13_pedo[20]}]
set_max_delay 5  -to [get_ports {node13_pedo[19]}]
set_max_delay 5  -to [get_ports {node13_pedo[18]}]
set_max_delay 5  -to [get_ports {node13_pedo[17]}]
set_max_delay 5  -to [get_ports {node13_pedo[16]}]
set_max_delay 5  -to [get_ports {node13_pedo[15]}]
set_max_delay 5  -to [get_ports {node13_pedo[14]}]
set_max_delay 5  -to [get_ports {node13_pedo[13]}]
set_max_delay 5  -to [get_ports {node13_pedo[12]}]
set_max_delay 5  -to [get_ports {node13_pedo[11]}]
set_max_delay 5  -to [get_ports {node13_pedo[10]}]
set_max_delay 5  -to [get_ports {node13_pedo[9]}]
set_max_delay 5  -to [get_ports {node13_pedo[8]}]
set_max_delay 5  -to [get_ports {node13_pedo[7]}]
set_max_delay 5  -to [get_ports {node13_pedo[6]}]
set_max_delay 5  -to [get_ports {node13_pedo[5]}]
set_max_delay 5  -to [get_ports {node13_pedo[4]}]
set_max_delay 5  -to [get_ports {node13_pedo[3]}]
set_max_delay 5  -to [get_ports {node13_pedo[2]}]
set_max_delay 5  -to [get_ports {node13_pedo[1]}]
set_max_delay 5  -to [get_ports {node13_pedo[0]}]
set_max_delay 5  -to [get_ports node13_polarity]
set_max_delay 5  -to [get_ports node20_peri]
set_max_delay 5  -to [get_ports node20_peso]
set_max_delay 5  -to [get_ports {node20_pedo[63]}]
set_max_delay 5  -to [get_ports {node20_pedo[62]}]
set_max_delay 5  -to [get_ports {node20_pedo[61]}]
set_max_delay 5  -to [get_ports {node20_pedo[60]}]
set_max_delay 5  -to [get_ports {node20_pedo[59]}]
set_max_delay 5  -to [get_ports {node20_pedo[58]}]
set_max_delay 5  -to [get_ports {node20_pedo[57]}]
set_max_delay 5  -to [get_ports {node20_pedo[56]}]
set_max_delay 5  -to [get_ports {node20_pedo[55]}]
set_max_delay 5  -to [get_ports {node20_pedo[54]}]
set_max_delay 5  -to [get_ports {node20_pedo[53]}]
set_max_delay 5  -to [get_ports {node20_pedo[52]}]
set_max_delay 5  -to [get_ports {node20_pedo[51]}]
set_max_delay 5  -to [get_ports {node20_pedo[50]}]
set_max_delay 5  -to [get_ports {node20_pedo[49]}]
set_max_delay 5  -to [get_ports {node20_pedo[48]}]
set_max_delay 5  -to [get_ports {node20_pedo[47]}]
set_max_delay 5  -to [get_ports {node20_pedo[46]}]
set_max_delay 5  -to [get_ports {node20_pedo[45]}]
set_max_delay 5  -to [get_ports {node20_pedo[44]}]
set_max_delay 5  -to [get_ports {node20_pedo[43]}]
set_max_delay 5  -to [get_ports {node20_pedo[42]}]
set_max_delay 5  -to [get_ports {node20_pedo[41]}]
set_max_delay 5  -to [get_ports {node20_pedo[40]}]
set_max_delay 5  -to [get_ports {node20_pedo[39]}]
set_max_delay 5  -to [get_ports {node20_pedo[38]}]
set_max_delay 5  -to [get_ports {node20_pedo[37]}]
set_max_delay 5  -to [get_ports {node20_pedo[36]}]
set_max_delay 5  -to [get_ports {node20_pedo[35]}]
set_max_delay 5  -to [get_ports {node20_pedo[34]}]
set_max_delay 5  -to [get_ports {node20_pedo[33]}]
set_max_delay 5  -to [get_ports {node20_pedo[32]}]
set_max_delay 5  -to [get_ports {node20_pedo[31]}]
set_max_delay 5  -to [get_ports {node20_pedo[30]}]
set_max_delay 5  -to [get_ports {node20_pedo[29]}]
set_max_delay 5  -to [get_ports {node20_pedo[28]}]
set_max_delay 5  -to [get_ports {node20_pedo[27]}]
set_max_delay 5  -to [get_ports {node20_pedo[26]}]
set_max_delay 5  -to [get_ports {node20_pedo[25]}]
set_max_delay 5  -to [get_ports {node20_pedo[24]}]
set_max_delay 5  -to [get_ports {node20_pedo[23]}]
set_max_delay 5  -to [get_ports {node20_pedo[22]}]
set_max_delay 5  -to [get_ports {node20_pedo[21]}]
set_max_delay 5  -to [get_ports {node20_pedo[20]}]
set_max_delay 5  -to [get_ports {node20_pedo[19]}]
set_max_delay 5  -to [get_ports {node20_pedo[18]}]
set_max_delay 5  -to [get_ports {node20_pedo[17]}]
set_max_delay 5  -to [get_ports {node20_pedo[16]}]
set_max_delay 5  -to [get_ports {node20_pedo[15]}]
set_max_delay 5  -to [get_ports {node20_pedo[14]}]
set_max_delay 5  -to [get_ports {node20_pedo[13]}]
set_max_delay 5  -to [get_ports {node20_pedo[12]}]
set_max_delay 5  -to [get_ports {node20_pedo[11]}]
set_max_delay 5  -to [get_ports {node20_pedo[10]}]
set_max_delay 5  -to [get_ports {node20_pedo[9]}]
set_max_delay 5  -to [get_ports {node20_pedo[8]}]
set_max_delay 5  -to [get_ports {node20_pedo[7]}]
set_max_delay 5  -to [get_ports {node20_pedo[6]}]
set_max_delay 5  -to [get_ports {node20_pedo[5]}]
set_max_delay 5  -to [get_ports {node20_pedo[4]}]
set_max_delay 5  -to [get_ports {node20_pedo[3]}]
set_max_delay 5  -to [get_ports {node20_pedo[2]}]
set_max_delay 5  -to [get_ports {node20_pedo[1]}]
set_max_delay 5  -to [get_ports {node20_pedo[0]}]
set_max_delay 5  -to [get_ports node20_polarity]
set_max_delay 5  -to [get_ports node21_peri]
set_max_delay 5  -to [get_ports node21_peso]
set_max_delay 5  -to [get_ports {node21_pedo[63]}]
set_max_delay 5  -to [get_ports {node21_pedo[62]}]
set_max_delay 5  -to [get_ports {node21_pedo[61]}]
set_max_delay 5  -to [get_ports {node21_pedo[60]}]
set_max_delay 5  -to [get_ports {node21_pedo[59]}]
set_max_delay 5  -to [get_ports {node21_pedo[58]}]
set_max_delay 5  -to [get_ports {node21_pedo[57]}]
set_max_delay 5  -to [get_ports {node21_pedo[56]}]
set_max_delay 5  -to [get_ports {node21_pedo[55]}]
set_max_delay 5  -to [get_ports {node21_pedo[54]}]
set_max_delay 5  -to [get_ports {node21_pedo[53]}]
set_max_delay 5  -to [get_ports {node21_pedo[52]}]
set_max_delay 5  -to [get_ports {node21_pedo[51]}]
set_max_delay 5  -to [get_ports {node21_pedo[50]}]
set_max_delay 5  -to [get_ports {node21_pedo[49]}]
set_max_delay 5  -to [get_ports {node21_pedo[48]}]
set_max_delay 5  -to [get_ports {node21_pedo[47]}]
set_max_delay 5  -to [get_ports {node21_pedo[46]}]
set_max_delay 5  -to [get_ports {node21_pedo[45]}]
set_max_delay 5  -to [get_ports {node21_pedo[44]}]
set_max_delay 5  -to [get_ports {node21_pedo[43]}]
set_max_delay 5  -to [get_ports {node21_pedo[42]}]
set_max_delay 5  -to [get_ports {node21_pedo[41]}]
set_max_delay 5  -to [get_ports {node21_pedo[40]}]
set_max_delay 5  -to [get_ports {node21_pedo[39]}]
set_max_delay 5  -to [get_ports {node21_pedo[38]}]
set_max_delay 5  -to [get_ports {node21_pedo[37]}]
set_max_delay 5  -to [get_ports {node21_pedo[36]}]
set_max_delay 5  -to [get_ports {node21_pedo[35]}]
set_max_delay 5  -to [get_ports {node21_pedo[34]}]
set_max_delay 5  -to [get_ports {node21_pedo[33]}]
set_max_delay 5  -to [get_ports {node21_pedo[32]}]
set_max_delay 5  -to [get_ports {node21_pedo[31]}]
set_max_delay 5  -to [get_ports {node21_pedo[30]}]
set_max_delay 5  -to [get_ports {node21_pedo[29]}]
set_max_delay 5  -to [get_ports {node21_pedo[28]}]
set_max_delay 5  -to [get_ports {node21_pedo[27]}]
set_max_delay 5  -to [get_ports {node21_pedo[26]}]
set_max_delay 5  -to [get_ports {node21_pedo[25]}]
set_max_delay 5  -to [get_ports {node21_pedo[24]}]
set_max_delay 5  -to [get_ports {node21_pedo[23]}]
set_max_delay 5  -to [get_ports {node21_pedo[22]}]
set_max_delay 5  -to [get_ports {node21_pedo[21]}]
set_max_delay 5  -to [get_ports {node21_pedo[20]}]
set_max_delay 5  -to [get_ports {node21_pedo[19]}]
set_max_delay 5  -to [get_ports {node21_pedo[18]}]
set_max_delay 5  -to [get_ports {node21_pedo[17]}]
set_max_delay 5  -to [get_ports {node21_pedo[16]}]
set_max_delay 5  -to [get_ports {node21_pedo[15]}]
set_max_delay 5  -to [get_ports {node21_pedo[14]}]
set_max_delay 5  -to [get_ports {node21_pedo[13]}]
set_max_delay 5  -to [get_ports {node21_pedo[12]}]
set_max_delay 5  -to [get_ports {node21_pedo[11]}]
set_max_delay 5  -to [get_ports {node21_pedo[10]}]
set_max_delay 5  -to [get_ports {node21_pedo[9]}]
set_max_delay 5  -to [get_ports {node21_pedo[8]}]
set_max_delay 5  -to [get_ports {node21_pedo[7]}]
set_max_delay 5  -to [get_ports {node21_pedo[6]}]
set_max_delay 5  -to [get_ports {node21_pedo[5]}]
set_max_delay 5  -to [get_ports {node21_pedo[4]}]
set_max_delay 5  -to [get_ports {node21_pedo[3]}]
set_max_delay 5  -to [get_ports {node21_pedo[2]}]
set_max_delay 5  -to [get_ports {node21_pedo[1]}]
set_max_delay 5  -to [get_ports {node21_pedo[0]}]
set_max_delay 5  -to [get_ports node21_polarity]
set_max_delay 5  -to [get_ports node22_peri]
set_max_delay 5  -to [get_ports node22_peso]
set_max_delay 5  -to [get_ports {node22_pedo[63]}]
set_max_delay 5  -to [get_ports {node22_pedo[62]}]
set_max_delay 5  -to [get_ports {node22_pedo[61]}]
set_max_delay 5  -to [get_ports {node22_pedo[60]}]
set_max_delay 5  -to [get_ports {node22_pedo[59]}]
set_max_delay 5  -to [get_ports {node22_pedo[58]}]
set_max_delay 5  -to [get_ports {node22_pedo[57]}]
set_max_delay 5  -to [get_ports {node22_pedo[56]}]
set_max_delay 5  -to [get_ports {node22_pedo[55]}]
set_max_delay 5  -to [get_ports {node22_pedo[54]}]
set_max_delay 5  -to [get_ports {node22_pedo[53]}]
set_max_delay 5  -to [get_ports {node22_pedo[52]}]
set_max_delay 5  -to [get_ports {node22_pedo[51]}]
set_max_delay 5  -to [get_ports {node22_pedo[50]}]
set_max_delay 5  -to [get_ports {node22_pedo[49]}]
set_max_delay 5  -to [get_ports {node22_pedo[48]}]
set_max_delay 5  -to [get_ports {node22_pedo[47]}]
set_max_delay 5  -to [get_ports {node22_pedo[46]}]
set_max_delay 5  -to [get_ports {node22_pedo[45]}]
set_max_delay 5  -to [get_ports {node22_pedo[44]}]
set_max_delay 5  -to [get_ports {node22_pedo[43]}]
set_max_delay 5  -to [get_ports {node22_pedo[42]}]
set_max_delay 5  -to [get_ports {node22_pedo[41]}]
set_max_delay 5  -to [get_ports {node22_pedo[40]}]
set_max_delay 5  -to [get_ports {node22_pedo[39]}]
set_max_delay 5  -to [get_ports {node22_pedo[38]}]
set_max_delay 5  -to [get_ports {node22_pedo[37]}]
set_max_delay 5  -to [get_ports {node22_pedo[36]}]
set_max_delay 5  -to [get_ports {node22_pedo[35]}]
set_max_delay 5  -to [get_ports {node22_pedo[34]}]
set_max_delay 5  -to [get_ports {node22_pedo[33]}]
set_max_delay 5  -to [get_ports {node22_pedo[32]}]
set_max_delay 5  -to [get_ports {node22_pedo[31]}]
set_max_delay 5  -to [get_ports {node22_pedo[30]}]
set_max_delay 5  -to [get_ports {node22_pedo[29]}]
set_max_delay 5  -to [get_ports {node22_pedo[28]}]
set_max_delay 5  -to [get_ports {node22_pedo[27]}]
set_max_delay 5  -to [get_ports {node22_pedo[26]}]
set_max_delay 5  -to [get_ports {node22_pedo[25]}]
set_max_delay 5  -to [get_ports {node22_pedo[24]}]
set_max_delay 5  -to [get_ports {node22_pedo[23]}]
set_max_delay 5  -to [get_ports {node22_pedo[22]}]
set_max_delay 5  -to [get_ports {node22_pedo[21]}]
set_max_delay 5  -to [get_ports {node22_pedo[20]}]
set_max_delay 5  -to [get_ports {node22_pedo[19]}]
set_max_delay 5  -to [get_ports {node22_pedo[18]}]
set_max_delay 5  -to [get_ports {node22_pedo[17]}]
set_max_delay 5  -to [get_ports {node22_pedo[16]}]
set_max_delay 5  -to [get_ports {node22_pedo[15]}]
set_max_delay 5  -to [get_ports {node22_pedo[14]}]
set_max_delay 5  -to [get_ports {node22_pedo[13]}]
set_max_delay 5  -to [get_ports {node22_pedo[12]}]
set_max_delay 5  -to [get_ports {node22_pedo[11]}]
set_max_delay 5  -to [get_ports {node22_pedo[10]}]
set_max_delay 5  -to [get_ports {node22_pedo[9]}]
set_max_delay 5  -to [get_ports {node22_pedo[8]}]
set_max_delay 5  -to [get_ports {node22_pedo[7]}]
set_max_delay 5  -to [get_ports {node22_pedo[6]}]
set_max_delay 5  -to [get_ports {node22_pedo[5]}]
set_max_delay 5  -to [get_ports {node22_pedo[4]}]
set_max_delay 5  -to [get_ports {node22_pedo[3]}]
set_max_delay 5  -to [get_ports {node22_pedo[2]}]
set_max_delay 5  -to [get_ports {node22_pedo[1]}]
set_max_delay 5  -to [get_ports {node22_pedo[0]}]
set_max_delay 5  -to [get_ports node22_polarity]
set_max_delay 5  -to [get_ports node23_peri]
set_max_delay 5  -to [get_ports node23_peso]
set_max_delay 5  -to [get_ports {node23_pedo[63]}]
set_max_delay 5  -to [get_ports {node23_pedo[62]}]
set_max_delay 5  -to [get_ports {node23_pedo[61]}]
set_max_delay 5  -to [get_ports {node23_pedo[60]}]
set_max_delay 5  -to [get_ports {node23_pedo[59]}]
set_max_delay 5  -to [get_ports {node23_pedo[58]}]
set_max_delay 5  -to [get_ports {node23_pedo[57]}]
set_max_delay 5  -to [get_ports {node23_pedo[56]}]
set_max_delay 5  -to [get_ports {node23_pedo[55]}]
set_max_delay 5  -to [get_ports {node23_pedo[54]}]
set_max_delay 5  -to [get_ports {node23_pedo[53]}]
set_max_delay 5  -to [get_ports {node23_pedo[52]}]
set_max_delay 5  -to [get_ports {node23_pedo[51]}]
set_max_delay 5  -to [get_ports {node23_pedo[50]}]
set_max_delay 5  -to [get_ports {node23_pedo[49]}]
set_max_delay 5  -to [get_ports {node23_pedo[48]}]
set_max_delay 5  -to [get_ports {node23_pedo[47]}]
set_max_delay 5  -to [get_ports {node23_pedo[46]}]
set_max_delay 5  -to [get_ports {node23_pedo[45]}]
set_max_delay 5  -to [get_ports {node23_pedo[44]}]
set_max_delay 5  -to [get_ports {node23_pedo[43]}]
set_max_delay 5  -to [get_ports {node23_pedo[42]}]
set_max_delay 5  -to [get_ports {node23_pedo[41]}]
set_max_delay 5  -to [get_ports {node23_pedo[40]}]
set_max_delay 5  -to [get_ports {node23_pedo[39]}]
set_max_delay 5  -to [get_ports {node23_pedo[38]}]
set_max_delay 5  -to [get_ports {node23_pedo[37]}]
set_max_delay 5  -to [get_ports {node23_pedo[36]}]
set_max_delay 5  -to [get_ports {node23_pedo[35]}]
set_max_delay 5  -to [get_ports {node23_pedo[34]}]
set_max_delay 5  -to [get_ports {node23_pedo[33]}]
set_max_delay 5  -to [get_ports {node23_pedo[32]}]
set_max_delay 5  -to [get_ports {node23_pedo[31]}]
set_max_delay 5  -to [get_ports {node23_pedo[30]}]
set_max_delay 5  -to [get_ports {node23_pedo[29]}]
set_max_delay 5  -to [get_ports {node23_pedo[28]}]
set_max_delay 5  -to [get_ports {node23_pedo[27]}]
set_max_delay 5  -to [get_ports {node23_pedo[26]}]
set_max_delay 5  -to [get_ports {node23_pedo[25]}]
set_max_delay 5  -to [get_ports {node23_pedo[24]}]
set_max_delay 5  -to [get_ports {node23_pedo[23]}]
set_max_delay 5  -to [get_ports {node23_pedo[22]}]
set_max_delay 5  -to [get_ports {node23_pedo[21]}]
set_max_delay 5  -to [get_ports {node23_pedo[20]}]
set_max_delay 5  -to [get_ports {node23_pedo[19]}]
set_max_delay 5  -to [get_ports {node23_pedo[18]}]
set_max_delay 5  -to [get_ports {node23_pedo[17]}]
set_max_delay 5  -to [get_ports {node23_pedo[16]}]
set_max_delay 5  -to [get_ports {node23_pedo[15]}]
set_max_delay 5  -to [get_ports {node23_pedo[14]}]
set_max_delay 5  -to [get_ports {node23_pedo[13]}]
set_max_delay 5  -to [get_ports {node23_pedo[12]}]
set_max_delay 5  -to [get_ports {node23_pedo[11]}]
set_max_delay 5  -to [get_ports {node23_pedo[10]}]
set_max_delay 5  -to [get_ports {node23_pedo[9]}]
set_max_delay 5  -to [get_ports {node23_pedo[8]}]
set_max_delay 5  -to [get_ports {node23_pedo[7]}]
set_max_delay 5  -to [get_ports {node23_pedo[6]}]
set_max_delay 5  -to [get_ports {node23_pedo[5]}]
set_max_delay 5  -to [get_ports {node23_pedo[4]}]
set_max_delay 5  -to [get_ports {node23_pedo[3]}]
set_max_delay 5  -to [get_ports {node23_pedo[2]}]
set_max_delay 5  -to [get_ports {node23_pedo[1]}]
set_max_delay 5  -to [get_ports {node23_pedo[0]}]
set_max_delay 5  -to [get_ports node23_polarity]
set_max_delay 5  -to [get_ports node30_peri]
set_max_delay 5  -to [get_ports node30_peso]
set_max_delay 5  -to [get_ports {node30_pedo[63]}]
set_max_delay 5  -to [get_ports {node30_pedo[62]}]
set_max_delay 5  -to [get_ports {node30_pedo[61]}]
set_max_delay 5  -to [get_ports {node30_pedo[60]}]
set_max_delay 5  -to [get_ports {node30_pedo[59]}]
set_max_delay 5  -to [get_ports {node30_pedo[58]}]
set_max_delay 5  -to [get_ports {node30_pedo[57]}]
set_max_delay 5  -to [get_ports {node30_pedo[56]}]
set_max_delay 5  -to [get_ports {node30_pedo[55]}]
set_max_delay 5  -to [get_ports {node30_pedo[54]}]
set_max_delay 5  -to [get_ports {node30_pedo[53]}]
set_max_delay 5  -to [get_ports {node30_pedo[52]}]
set_max_delay 5  -to [get_ports {node30_pedo[51]}]
set_max_delay 5  -to [get_ports {node30_pedo[50]}]
set_max_delay 5  -to [get_ports {node30_pedo[49]}]
set_max_delay 5  -to [get_ports {node30_pedo[48]}]
set_max_delay 5  -to [get_ports {node30_pedo[47]}]
set_max_delay 5  -to [get_ports {node30_pedo[46]}]
set_max_delay 5  -to [get_ports {node30_pedo[45]}]
set_max_delay 5  -to [get_ports {node30_pedo[44]}]
set_max_delay 5  -to [get_ports {node30_pedo[43]}]
set_max_delay 5  -to [get_ports {node30_pedo[42]}]
set_max_delay 5  -to [get_ports {node30_pedo[41]}]
set_max_delay 5  -to [get_ports {node30_pedo[40]}]
set_max_delay 5  -to [get_ports {node30_pedo[39]}]
set_max_delay 5  -to [get_ports {node30_pedo[38]}]
set_max_delay 5  -to [get_ports {node30_pedo[37]}]
set_max_delay 5  -to [get_ports {node30_pedo[36]}]
set_max_delay 5  -to [get_ports {node30_pedo[35]}]
set_max_delay 5  -to [get_ports {node30_pedo[34]}]
set_max_delay 5  -to [get_ports {node30_pedo[33]}]
set_max_delay 5  -to [get_ports {node30_pedo[32]}]
set_max_delay 5  -to [get_ports {node30_pedo[31]}]
set_max_delay 5  -to [get_ports {node30_pedo[30]}]
set_max_delay 5  -to [get_ports {node30_pedo[29]}]
set_max_delay 5  -to [get_ports {node30_pedo[28]}]
set_max_delay 5  -to [get_ports {node30_pedo[27]}]
set_max_delay 5  -to [get_ports {node30_pedo[26]}]
set_max_delay 5  -to [get_ports {node30_pedo[25]}]
set_max_delay 5  -to [get_ports {node30_pedo[24]}]
set_max_delay 5  -to [get_ports {node30_pedo[23]}]
set_max_delay 5  -to [get_ports {node30_pedo[22]}]
set_max_delay 5  -to [get_ports {node30_pedo[21]}]
set_max_delay 5  -to [get_ports {node30_pedo[20]}]
set_max_delay 5  -to [get_ports {node30_pedo[19]}]
set_max_delay 5  -to [get_ports {node30_pedo[18]}]
set_max_delay 5  -to [get_ports {node30_pedo[17]}]
set_max_delay 5  -to [get_ports {node30_pedo[16]}]
set_max_delay 5  -to [get_ports {node30_pedo[15]}]
set_max_delay 5  -to [get_ports {node30_pedo[14]}]
set_max_delay 5  -to [get_ports {node30_pedo[13]}]
set_max_delay 5  -to [get_ports {node30_pedo[12]}]
set_max_delay 5  -to [get_ports {node30_pedo[11]}]
set_max_delay 5  -to [get_ports {node30_pedo[10]}]
set_max_delay 5  -to [get_ports {node30_pedo[9]}]
set_max_delay 5  -to [get_ports {node30_pedo[8]}]
set_max_delay 5  -to [get_ports {node30_pedo[7]}]
set_max_delay 5  -to [get_ports {node30_pedo[6]}]
set_max_delay 5  -to [get_ports {node30_pedo[5]}]
set_max_delay 5  -to [get_ports {node30_pedo[4]}]
set_max_delay 5  -to [get_ports {node30_pedo[3]}]
set_max_delay 5  -to [get_ports {node30_pedo[2]}]
set_max_delay 5  -to [get_ports {node30_pedo[1]}]
set_max_delay 5  -to [get_ports {node30_pedo[0]}]
set_max_delay 5  -to [get_ports node30_polarity]
set_max_delay 5  -to [get_ports node31_peri]
set_max_delay 5  -to [get_ports node31_peso]
set_max_delay 5  -to [get_ports {node31_pedo[63]}]
set_max_delay 5  -to [get_ports {node31_pedo[62]}]
set_max_delay 5  -to [get_ports {node31_pedo[61]}]
set_max_delay 5  -to [get_ports {node31_pedo[60]}]
set_max_delay 5  -to [get_ports {node31_pedo[59]}]
set_max_delay 5  -to [get_ports {node31_pedo[58]}]
set_max_delay 5  -to [get_ports {node31_pedo[57]}]
set_max_delay 5  -to [get_ports {node31_pedo[56]}]
set_max_delay 5  -to [get_ports {node31_pedo[55]}]
set_max_delay 5  -to [get_ports {node31_pedo[54]}]
set_max_delay 5  -to [get_ports {node31_pedo[53]}]
set_max_delay 5  -to [get_ports {node31_pedo[52]}]
set_max_delay 5  -to [get_ports {node31_pedo[51]}]
set_max_delay 5  -to [get_ports {node31_pedo[50]}]
set_max_delay 5  -to [get_ports {node31_pedo[49]}]
set_max_delay 5  -to [get_ports {node31_pedo[48]}]
set_max_delay 5  -to [get_ports {node31_pedo[47]}]
set_max_delay 5  -to [get_ports {node31_pedo[46]}]
set_max_delay 5  -to [get_ports {node31_pedo[45]}]
set_max_delay 5  -to [get_ports {node31_pedo[44]}]
set_max_delay 5  -to [get_ports {node31_pedo[43]}]
set_max_delay 5  -to [get_ports {node31_pedo[42]}]
set_max_delay 5  -to [get_ports {node31_pedo[41]}]
set_max_delay 5  -to [get_ports {node31_pedo[40]}]
set_max_delay 5  -to [get_ports {node31_pedo[39]}]
set_max_delay 5  -to [get_ports {node31_pedo[38]}]
set_max_delay 5  -to [get_ports {node31_pedo[37]}]
set_max_delay 5  -to [get_ports {node31_pedo[36]}]
set_max_delay 5  -to [get_ports {node31_pedo[35]}]
set_max_delay 5  -to [get_ports {node31_pedo[34]}]
set_max_delay 5  -to [get_ports {node31_pedo[33]}]
set_max_delay 5  -to [get_ports {node31_pedo[32]}]
set_max_delay 5  -to [get_ports {node31_pedo[31]}]
set_max_delay 5  -to [get_ports {node31_pedo[30]}]
set_max_delay 5  -to [get_ports {node31_pedo[29]}]
set_max_delay 5  -to [get_ports {node31_pedo[28]}]
set_max_delay 5  -to [get_ports {node31_pedo[27]}]
set_max_delay 5  -to [get_ports {node31_pedo[26]}]
set_max_delay 5  -to [get_ports {node31_pedo[25]}]
set_max_delay 5  -to [get_ports {node31_pedo[24]}]
set_max_delay 5  -to [get_ports {node31_pedo[23]}]
set_max_delay 5  -to [get_ports {node31_pedo[22]}]
set_max_delay 5  -to [get_ports {node31_pedo[21]}]
set_max_delay 5  -to [get_ports {node31_pedo[20]}]
set_max_delay 5  -to [get_ports {node31_pedo[19]}]
set_max_delay 5  -to [get_ports {node31_pedo[18]}]
set_max_delay 5  -to [get_ports {node31_pedo[17]}]
set_max_delay 5  -to [get_ports {node31_pedo[16]}]
set_max_delay 5  -to [get_ports {node31_pedo[15]}]
set_max_delay 5  -to [get_ports {node31_pedo[14]}]
set_max_delay 5  -to [get_ports {node31_pedo[13]}]
set_max_delay 5  -to [get_ports {node31_pedo[12]}]
set_max_delay 5  -to [get_ports {node31_pedo[11]}]
set_max_delay 5  -to [get_ports {node31_pedo[10]}]
set_max_delay 5  -to [get_ports {node31_pedo[9]}]
set_max_delay 5  -to [get_ports {node31_pedo[8]}]
set_max_delay 5  -to [get_ports {node31_pedo[7]}]
set_max_delay 5  -to [get_ports {node31_pedo[6]}]
set_max_delay 5  -to [get_ports {node31_pedo[5]}]
set_max_delay 5  -to [get_ports {node31_pedo[4]}]
set_max_delay 5  -to [get_ports {node31_pedo[3]}]
set_max_delay 5  -to [get_ports {node31_pedo[2]}]
set_max_delay 5  -to [get_ports {node31_pedo[1]}]
set_max_delay 5  -to [get_ports {node31_pedo[0]}]
set_max_delay 5  -to [get_ports node31_polarity]
set_max_delay 5  -to [get_ports node32_peri]
set_max_delay 5  -to [get_ports node32_peso]
set_max_delay 5  -to [get_ports {node32_pedo[63]}]
set_max_delay 5  -to [get_ports {node32_pedo[62]}]
set_max_delay 5  -to [get_ports {node32_pedo[61]}]
set_max_delay 5  -to [get_ports {node32_pedo[60]}]
set_max_delay 5  -to [get_ports {node32_pedo[59]}]
set_max_delay 5  -to [get_ports {node32_pedo[58]}]
set_max_delay 5  -to [get_ports {node32_pedo[57]}]
set_max_delay 5  -to [get_ports {node32_pedo[56]}]
set_max_delay 5  -to [get_ports {node32_pedo[55]}]
set_max_delay 5  -to [get_ports {node32_pedo[54]}]
set_max_delay 5  -to [get_ports {node32_pedo[53]}]
set_max_delay 5  -to [get_ports {node32_pedo[52]}]
set_max_delay 5  -to [get_ports {node32_pedo[51]}]
set_max_delay 5  -to [get_ports {node32_pedo[50]}]
set_max_delay 5  -to [get_ports {node32_pedo[49]}]
set_max_delay 5  -to [get_ports {node32_pedo[48]}]
set_max_delay 5  -to [get_ports {node32_pedo[47]}]
set_max_delay 5  -to [get_ports {node32_pedo[46]}]
set_max_delay 5  -to [get_ports {node32_pedo[45]}]
set_max_delay 5  -to [get_ports {node32_pedo[44]}]
set_max_delay 5  -to [get_ports {node32_pedo[43]}]
set_max_delay 5  -to [get_ports {node32_pedo[42]}]
set_max_delay 5  -to [get_ports {node32_pedo[41]}]
set_max_delay 5  -to [get_ports {node32_pedo[40]}]
set_max_delay 5  -to [get_ports {node32_pedo[39]}]
set_max_delay 5  -to [get_ports {node32_pedo[38]}]
set_max_delay 5  -to [get_ports {node32_pedo[37]}]
set_max_delay 5  -to [get_ports {node32_pedo[36]}]
set_max_delay 5  -to [get_ports {node32_pedo[35]}]
set_max_delay 5  -to [get_ports {node32_pedo[34]}]
set_max_delay 5  -to [get_ports {node32_pedo[33]}]
set_max_delay 5  -to [get_ports {node32_pedo[32]}]
set_max_delay 5  -to [get_ports {node32_pedo[31]}]
set_max_delay 5  -to [get_ports {node32_pedo[30]}]
set_max_delay 5  -to [get_ports {node32_pedo[29]}]
set_max_delay 5  -to [get_ports {node32_pedo[28]}]
set_max_delay 5  -to [get_ports {node32_pedo[27]}]
set_max_delay 5  -to [get_ports {node32_pedo[26]}]
set_max_delay 5  -to [get_ports {node32_pedo[25]}]
set_max_delay 5  -to [get_ports {node32_pedo[24]}]
set_max_delay 5  -to [get_ports {node32_pedo[23]}]
set_max_delay 5  -to [get_ports {node32_pedo[22]}]
set_max_delay 5  -to [get_ports {node32_pedo[21]}]
set_max_delay 5  -to [get_ports {node32_pedo[20]}]
set_max_delay 5  -to [get_ports {node32_pedo[19]}]
set_max_delay 5  -to [get_ports {node32_pedo[18]}]
set_max_delay 5  -to [get_ports {node32_pedo[17]}]
set_max_delay 5  -to [get_ports {node32_pedo[16]}]
set_max_delay 5  -to [get_ports {node32_pedo[15]}]
set_max_delay 5  -to [get_ports {node32_pedo[14]}]
set_max_delay 5  -to [get_ports {node32_pedo[13]}]
set_max_delay 5  -to [get_ports {node32_pedo[12]}]
set_max_delay 5  -to [get_ports {node32_pedo[11]}]
set_max_delay 5  -to [get_ports {node32_pedo[10]}]
set_max_delay 5  -to [get_ports {node32_pedo[9]}]
set_max_delay 5  -to [get_ports {node32_pedo[8]}]
set_max_delay 5  -to [get_ports {node32_pedo[7]}]
set_max_delay 5  -to [get_ports {node32_pedo[6]}]
set_max_delay 5  -to [get_ports {node32_pedo[5]}]
set_max_delay 5  -to [get_ports {node32_pedo[4]}]
set_max_delay 5  -to [get_ports {node32_pedo[3]}]
set_max_delay 5  -to [get_ports {node32_pedo[2]}]
set_max_delay 5  -to [get_ports {node32_pedo[1]}]
set_max_delay 5  -to [get_ports {node32_pedo[0]}]
set_max_delay 5  -to [get_ports node32_polarity]
set_max_delay 5  -to [get_ports node33_peri]
set_max_delay 5  -to [get_ports node33_peso]
set_max_delay 5  -to [get_ports {node33_pedo[63]}]
set_max_delay 5  -to [get_ports {node33_pedo[62]}]
set_max_delay 5  -to [get_ports {node33_pedo[61]}]
set_max_delay 5  -to [get_ports {node33_pedo[60]}]
set_max_delay 5  -to [get_ports {node33_pedo[59]}]
set_max_delay 5  -to [get_ports {node33_pedo[58]}]
set_max_delay 5  -to [get_ports {node33_pedo[57]}]
set_max_delay 5  -to [get_ports {node33_pedo[56]}]
set_max_delay 5  -to [get_ports {node33_pedo[55]}]
set_max_delay 5  -to [get_ports {node33_pedo[54]}]
set_max_delay 5  -to [get_ports {node33_pedo[53]}]
set_max_delay 5  -to [get_ports {node33_pedo[52]}]
set_max_delay 5  -to [get_ports {node33_pedo[51]}]
set_max_delay 5  -to [get_ports {node33_pedo[50]}]
set_max_delay 5  -to [get_ports {node33_pedo[49]}]
set_max_delay 5  -to [get_ports {node33_pedo[48]}]
set_max_delay 5  -to [get_ports {node33_pedo[47]}]
set_max_delay 5  -to [get_ports {node33_pedo[46]}]
set_max_delay 5  -to [get_ports {node33_pedo[45]}]
set_max_delay 5  -to [get_ports {node33_pedo[44]}]
set_max_delay 5  -to [get_ports {node33_pedo[43]}]
set_max_delay 5  -to [get_ports {node33_pedo[42]}]
set_max_delay 5  -to [get_ports {node33_pedo[41]}]
set_max_delay 5  -to [get_ports {node33_pedo[40]}]
set_max_delay 5  -to [get_ports {node33_pedo[39]}]
set_max_delay 5  -to [get_ports {node33_pedo[38]}]
set_max_delay 5  -to [get_ports {node33_pedo[37]}]
set_max_delay 5  -to [get_ports {node33_pedo[36]}]
set_max_delay 5  -to [get_ports {node33_pedo[35]}]
set_max_delay 5  -to [get_ports {node33_pedo[34]}]
set_max_delay 5  -to [get_ports {node33_pedo[33]}]
set_max_delay 5  -to [get_ports {node33_pedo[32]}]
set_max_delay 5  -to [get_ports {node33_pedo[31]}]
set_max_delay 5  -to [get_ports {node33_pedo[30]}]
set_max_delay 5  -to [get_ports {node33_pedo[29]}]
set_max_delay 5  -to [get_ports {node33_pedo[28]}]
set_max_delay 5  -to [get_ports {node33_pedo[27]}]
set_max_delay 5  -to [get_ports {node33_pedo[26]}]
set_max_delay 5  -to [get_ports {node33_pedo[25]}]
set_max_delay 5  -to [get_ports {node33_pedo[24]}]
set_max_delay 5  -to [get_ports {node33_pedo[23]}]
set_max_delay 5  -to [get_ports {node33_pedo[22]}]
set_max_delay 5  -to [get_ports {node33_pedo[21]}]
set_max_delay 5  -to [get_ports {node33_pedo[20]}]
set_max_delay 5  -to [get_ports {node33_pedo[19]}]
set_max_delay 5  -to [get_ports {node33_pedo[18]}]
set_max_delay 5  -to [get_ports {node33_pedo[17]}]
set_max_delay 5  -to [get_ports {node33_pedo[16]}]
set_max_delay 5  -to [get_ports {node33_pedo[15]}]
set_max_delay 5  -to [get_ports {node33_pedo[14]}]
set_max_delay 5  -to [get_ports {node33_pedo[13]}]
set_max_delay 5  -to [get_ports {node33_pedo[12]}]
set_max_delay 5  -to [get_ports {node33_pedo[11]}]
set_max_delay 5  -to [get_ports {node33_pedo[10]}]
set_max_delay 5  -to [get_ports {node33_pedo[9]}]
set_max_delay 5  -to [get_ports {node33_pedo[8]}]
set_max_delay 5  -to [get_ports {node33_pedo[7]}]
set_max_delay 5  -to [get_ports {node33_pedo[6]}]
set_max_delay 5  -to [get_ports {node33_pedo[5]}]
set_max_delay 5  -to [get_ports {node33_pedo[4]}]
set_max_delay 5  -to [get_ports {node33_pedo[3]}]
set_max_delay 5  -to [get_ports {node33_pedo[2]}]
set_max_delay 5  -to [get_ports {node33_pedo[1]}]
set_max_delay 5  -to [get_ports {node33_pedo[0]}]
set_max_delay 5  -to [get_ports node33_polarity]
set_max_delay 5  -from [list [get_ports clk] [get_ports reset] [get_ports node00_pesi]         \
[get_ports {node00_pedi[63]}] [get_ports {node00_pedi[62]}] [get_ports         \
{node00_pedi[61]}] [get_ports {node00_pedi[60]}] [get_ports {node00_pedi[59]}] \
[get_ports {node00_pedi[58]}] [get_ports {node00_pedi[57]}] [get_ports         \
{node00_pedi[56]}] [get_ports {node00_pedi[55]}] [get_ports {node00_pedi[54]}] \
[get_ports {node00_pedi[53]}] [get_ports {node00_pedi[52]}] [get_ports         \
{node00_pedi[51]}] [get_ports {node00_pedi[50]}] [get_ports {node00_pedi[49]}] \
[get_ports {node00_pedi[48]}] [get_ports {node00_pedi[47]}] [get_ports         \
{node00_pedi[46]}] [get_ports {node00_pedi[45]}] [get_ports {node00_pedi[44]}] \
[get_ports {node00_pedi[43]}] [get_ports {node00_pedi[42]}] [get_ports         \
{node00_pedi[41]}] [get_ports {node00_pedi[40]}] [get_ports {node00_pedi[39]}] \
[get_ports {node00_pedi[38]}] [get_ports {node00_pedi[37]}] [get_ports         \
{node00_pedi[36]}] [get_ports {node00_pedi[35]}] [get_ports {node00_pedi[34]}] \
[get_ports {node00_pedi[33]}] [get_ports {node00_pedi[32]}] [get_ports         \
{node00_pedi[31]}] [get_ports {node00_pedi[30]}] [get_ports {node00_pedi[29]}] \
[get_ports {node00_pedi[28]}] [get_ports {node00_pedi[27]}] [get_ports         \
{node00_pedi[26]}] [get_ports {node00_pedi[25]}] [get_ports {node00_pedi[24]}] \
[get_ports {node00_pedi[23]}] [get_ports {node00_pedi[22]}] [get_ports         \
{node00_pedi[21]}] [get_ports {node00_pedi[20]}] [get_ports {node00_pedi[19]}] \
[get_ports {node00_pedi[18]}] [get_ports {node00_pedi[17]}] [get_ports         \
{node00_pedi[16]}] [get_ports {node00_pedi[15]}] [get_ports {node00_pedi[14]}] \
[get_ports {node00_pedi[13]}] [get_ports {node00_pedi[12]}] [get_ports         \
{node00_pedi[11]}] [get_ports {node00_pedi[10]}] [get_ports {node00_pedi[9]}]  \
[get_ports {node00_pedi[8]}] [get_ports {node00_pedi[7]}] [get_ports           \
{node00_pedi[6]}] [get_ports {node00_pedi[5]}] [get_ports {node00_pedi[4]}]    \
[get_ports {node00_pedi[3]}] [get_ports {node00_pedi[2]}] [get_ports           \
{node00_pedi[1]}] [get_ports {node00_pedi[0]}] [get_ports node00_pero]         \
[get_ports node01_pesi] [get_ports {node01_pedi[63]}] [get_ports               \
{node01_pedi[62]}] [get_ports {node01_pedi[61]}] [get_ports {node01_pedi[60]}] \
[get_ports {node01_pedi[59]}] [get_ports {node01_pedi[58]}] [get_ports         \
{node01_pedi[57]}] [get_ports {node01_pedi[56]}] [get_ports {node01_pedi[55]}] \
[get_ports {node01_pedi[54]}] [get_ports {node01_pedi[53]}] [get_ports         \
{node01_pedi[52]}] [get_ports {node01_pedi[51]}] [get_ports {node01_pedi[50]}] \
[get_ports {node01_pedi[49]}] [get_ports {node01_pedi[48]}] [get_ports         \
{node01_pedi[47]}] [get_ports {node01_pedi[46]}] [get_ports {node01_pedi[45]}] \
[get_ports {node01_pedi[44]}] [get_ports {node01_pedi[43]}] [get_ports         \
{node01_pedi[42]}] [get_ports {node01_pedi[41]}] [get_ports {node01_pedi[40]}] \
[get_ports {node01_pedi[39]}] [get_ports {node01_pedi[38]}] [get_ports         \
{node01_pedi[37]}] [get_ports {node01_pedi[36]}] [get_ports {node01_pedi[35]}] \
[get_ports {node01_pedi[34]}] [get_ports {node01_pedi[33]}] [get_ports         \
{node01_pedi[32]}] [get_ports {node01_pedi[31]}] [get_ports {node01_pedi[30]}] \
[get_ports {node01_pedi[29]}] [get_ports {node01_pedi[28]}] [get_ports         \
{node01_pedi[27]}] [get_ports {node01_pedi[26]}] [get_ports {node01_pedi[25]}] \
[get_ports {node01_pedi[24]}] [get_ports {node01_pedi[23]}] [get_ports         \
{node01_pedi[22]}] [get_ports {node01_pedi[21]}] [get_ports {node01_pedi[20]}] \
[get_ports {node01_pedi[19]}] [get_ports {node01_pedi[18]}] [get_ports         \
{node01_pedi[17]}] [get_ports {node01_pedi[16]}] [get_ports {node01_pedi[15]}] \
[get_ports {node01_pedi[14]}] [get_ports {node01_pedi[13]}] [get_ports         \
{node01_pedi[12]}] [get_ports {node01_pedi[11]}] [get_ports {node01_pedi[10]}] \
[get_ports {node01_pedi[9]}] [get_ports {node01_pedi[8]}] [get_ports           \
{node01_pedi[7]}] [get_ports {node01_pedi[6]}] [get_ports {node01_pedi[5]}]    \
[get_ports {node01_pedi[4]}] [get_ports {node01_pedi[3]}] [get_ports           \
{node01_pedi[2]}] [get_ports {node01_pedi[1]}] [get_ports {node01_pedi[0]}]    \
[get_ports node01_pero] [get_ports node02_pesi] [get_ports {node02_pedi[63]}]  \
[get_ports {node02_pedi[62]}] [get_ports {node02_pedi[61]}] [get_ports         \
{node02_pedi[60]}] [get_ports {node02_pedi[59]}] [get_ports {node02_pedi[58]}] \
[get_ports {node02_pedi[57]}] [get_ports {node02_pedi[56]}] [get_ports         \
{node02_pedi[55]}] [get_ports {node02_pedi[54]}] [get_ports {node02_pedi[53]}] \
[get_ports {node02_pedi[52]}] [get_ports {node02_pedi[51]}] [get_ports         \
{node02_pedi[50]}] [get_ports {node02_pedi[49]}] [get_ports {node02_pedi[48]}] \
[get_ports {node02_pedi[47]}] [get_ports {node02_pedi[46]}] [get_ports         \
{node02_pedi[45]}] [get_ports {node02_pedi[44]}] [get_ports {node02_pedi[43]}] \
[get_ports {node02_pedi[42]}] [get_ports {node02_pedi[41]}] [get_ports         \
{node02_pedi[40]}] [get_ports {node02_pedi[39]}] [get_ports {node02_pedi[38]}] \
[get_ports {node02_pedi[37]}] [get_ports {node02_pedi[36]}] [get_ports         \
{node02_pedi[35]}] [get_ports {node02_pedi[34]}] [get_ports {node02_pedi[33]}] \
[get_ports {node02_pedi[32]}] [get_ports {node02_pedi[31]}] [get_ports         \
{node02_pedi[30]}] [get_ports {node02_pedi[29]}] [get_ports {node02_pedi[28]}] \
[get_ports {node02_pedi[27]}] [get_ports {node02_pedi[26]}] [get_ports         \
{node02_pedi[25]}] [get_ports {node02_pedi[24]}] [get_ports {node02_pedi[23]}] \
[get_ports {node02_pedi[22]}] [get_ports {node02_pedi[21]}] [get_ports         \
{node02_pedi[20]}] [get_ports {node02_pedi[19]}] [get_ports {node02_pedi[18]}] \
[get_ports {node02_pedi[17]}] [get_ports {node02_pedi[16]}] [get_ports         \
{node02_pedi[15]}] [get_ports {node02_pedi[14]}] [get_ports {node02_pedi[13]}] \
[get_ports {node02_pedi[12]}] [get_ports {node02_pedi[11]}] [get_ports         \
{node02_pedi[10]}] [get_ports {node02_pedi[9]}] [get_ports {node02_pedi[8]}]   \
[get_ports {node02_pedi[7]}] [get_ports {node02_pedi[6]}] [get_ports           \
{node02_pedi[5]}] [get_ports {node02_pedi[4]}] [get_ports {node02_pedi[3]}]    \
[get_ports {node02_pedi[2]}] [get_ports {node02_pedi[1]}] [get_ports           \
{node02_pedi[0]}] [get_ports node02_pero] [get_ports node03_pesi] [get_ports   \
{node03_pedi[63]}] [get_ports {node03_pedi[62]}] [get_ports {node03_pedi[61]}] \
[get_ports {node03_pedi[60]}] [get_ports {node03_pedi[59]}] [get_ports         \
{node03_pedi[58]}] [get_ports {node03_pedi[57]}] [get_ports {node03_pedi[56]}] \
[get_ports {node03_pedi[55]}] [get_ports {node03_pedi[54]}] [get_ports         \
{node03_pedi[53]}] [get_ports {node03_pedi[52]}] [get_ports {node03_pedi[51]}] \
[get_ports {node03_pedi[50]}] [get_ports {node03_pedi[49]}] [get_ports         \
{node03_pedi[48]}] [get_ports {node03_pedi[47]}] [get_ports {node03_pedi[46]}] \
[get_ports {node03_pedi[45]}] [get_ports {node03_pedi[44]}] [get_ports         \
{node03_pedi[43]}] [get_ports {node03_pedi[42]}] [get_ports {node03_pedi[41]}] \
[get_ports {node03_pedi[40]}] [get_ports {node03_pedi[39]}] [get_ports         \
{node03_pedi[38]}] [get_ports {node03_pedi[37]}] [get_ports {node03_pedi[36]}] \
[get_ports {node03_pedi[35]}] [get_ports {node03_pedi[34]}] [get_ports         \
{node03_pedi[33]}] [get_ports {node03_pedi[32]}] [get_ports {node03_pedi[31]}] \
[get_ports {node03_pedi[30]}] [get_ports {node03_pedi[29]}] [get_ports         \
{node03_pedi[28]}] [get_ports {node03_pedi[27]}] [get_ports {node03_pedi[26]}] \
[get_ports {node03_pedi[25]}] [get_ports {node03_pedi[24]}] [get_ports         \
{node03_pedi[23]}] [get_ports {node03_pedi[22]}] [get_ports {node03_pedi[21]}] \
[get_ports {node03_pedi[20]}] [get_ports {node03_pedi[19]}] [get_ports         \
{node03_pedi[18]}] [get_ports {node03_pedi[17]}] [get_ports {node03_pedi[16]}] \
[get_ports {node03_pedi[15]}] [get_ports {node03_pedi[14]}] [get_ports         \
{node03_pedi[13]}] [get_ports {node03_pedi[12]}] [get_ports {node03_pedi[11]}] \
[get_ports {node03_pedi[10]}] [get_ports {node03_pedi[9]}] [get_ports          \
{node03_pedi[8]}] [get_ports {node03_pedi[7]}] [get_ports {node03_pedi[6]}]    \
[get_ports {node03_pedi[5]}] [get_ports {node03_pedi[4]}] [get_ports           \
{node03_pedi[3]}] [get_ports {node03_pedi[2]}] [get_ports {node03_pedi[1]}]    \
[get_ports {node03_pedi[0]}] [get_ports node03_pero] [get_ports node10_pesi]   \
[get_ports {node10_pedi[63]}] [get_ports {node10_pedi[62]}] [get_ports         \
{node10_pedi[61]}] [get_ports {node10_pedi[60]}] [get_ports {node10_pedi[59]}] \
[get_ports {node10_pedi[58]}] [get_ports {node10_pedi[57]}] [get_ports         \
{node10_pedi[56]}] [get_ports {node10_pedi[55]}] [get_ports {node10_pedi[54]}] \
[get_ports {node10_pedi[53]}] [get_ports {node10_pedi[52]}] [get_ports         \
{node10_pedi[51]}] [get_ports {node10_pedi[50]}] [get_ports {node10_pedi[49]}] \
[get_ports {node10_pedi[48]}] [get_ports {node10_pedi[47]}] [get_ports         \
{node10_pedi[46]}] [get_ports {node10_pedi[45]}] [get_ports {node10_pedi[44]}] \
[get_ports {node10_pedi[43]}] [get_ports {node10_pedi[42]}] [get_ports         \
{node10_pedi[41]}] [get_ports {node10_pedi[40]}] [get_ports {node10_pedi[39]}] \
[get_ports {node10_pedi[38]}] [get_ports {node10_pedi[37]}] [get_ports         \
{node10_pedi[36]}] [get_ports {node10_pedi[35]}] [get_ports {node10_pedi[34]}] \
[get_ports {node10_pedi[33]}] [get_ports {node10_pedi[32]}] [get_ports         \
{node10_pedi[31]}] [get_ports {node10_pedi[30]}] [get_ports {node10_pedi[29]}] \
[get_ports {node10_pedi[28]}] [get_ports {node10_pedi[27]}] [get_ports         \
{node10_pedi[26]}] [get_ports {node10_pedi[25]}] [get_ports {node10_pedi[24]}] \
[get_ports {node10_pedi[23]}] [get_ports {node10_pedi[22]}] [get_ports         \
{node10_pedi[21]}] [get_ports {node10_pedi[20]}] [get_ports {node10_pedi[19]}] \
[get_ports {node10_pedi[18]}] [get_ports {node10_pedi[17]}] [get_ports         \
{node10_pedi[16]}] [get_ports {node10_pedi[15]}] [get_ports {node10_pedi[14]}] \
[get_ports {node10_pedi[13]}] [get_ports {node10_pedi[12]}] [get_ports         \
{node10_pedi[11]}] [get_ports {node10_pedi[10]}] [get_ports {node10_pedi[9]}]  \
[get_ports {node10_pedi[8]}] [get_ports {node10_pedi[7]}] [get_ports           \
{node10_pedi[6]}] [get_ports {node10_pedi[5]}] [get_ports {node10_pedi[4]}]    \
[get_ports {node10_pedi[3]}] [get_ports {node10_pedi[2]}] [get_ports           \
{node10_pedi[1]}] [get_ports {node10_pedi[0]}] [get_ports node10_pero]         \
[get_ports node11_pesi] [get_ports {node11_pedi[63]}] [get_ports               \
{node11_pedi[62]}] [get_ports {node11_pedi[61]}] [get_ports {node11_pedi[60]}] \
[get_ports {node11_pedi[59]}] [get_ports {node11_pedi[58]}] [get_ports         \
{node11_pedi[57]}] [get_ports {node11_pedi[56]}] [get_ports {node11_pedi[55]}] \
[get_ports {node11_pedi[54]}] [get_ports {node11_pedi[53]}] [get_ports         \
{node11_pedi[52]}] [get_ports {node11_pedi[51]}] [get_ports {node11_pedi[50]}] \
[get_ports {node11_pedi[49]}] [get_ports {node11_pedi[48]}] [get_ports         \
{node11_pedi[47]}] [get_ports {node11_pedi[46]}] [get_ports {node11_pedi[45]}] \
[get_ports {node11_pedi[44]}] [get_ports {node11_pedi[43]}] [get_ports         \
{node11_pedi[42]}] [get_ports {node11_pedi[41]}] [get_ports {node11_pedi[40]}] \
[get_ports {node11_pedi[39]}] [get_ports {node11_pedi[38]}] [get_ports         \
{node11_pedi[37]}] [get_ports {node11_pedi[36]}] [get_ports {node11_pedi[35]}] \
[get_ports {node11_pedi[34]}] [get_ports {node11_pedi[33]}] [get_ports         \
{node11_pedi[32]}] [get_ports {node11_pedi[31]}] [get_ports {node11_pedi[30]}] \
[get_ports {node11_pedi[29]}] [get_ports {node11_pedi[28]}] [get_ports         \
{node11_pedi[27]}] [get_ports {node11_pedi[26]}] [get_ports {node11_pedi[25]}] \
[get_ports {node11_pedi[24]}] [get_ports {node11_pedi[23]}] [get_ports         \
{node11_pedi[22]}] [get_ports {node11_pedi[21]}] [get_ports {node11_pedi[20]}] \
[get_ports {node11_pedi[19]}] [get_ports {node11_pedi[18]}] [get_ports         \
{node11_pedi[17]}] [get_ports {node11_pedi[16]}] [get_ports {node11_pedi[15]}] \
[get_ports {node11_pedi[14]}] [get_ports {node11_pedi[13]}] [get_ports         \
{node11_pedi[12]}] [get_ports {node11_pedi[11]}] [get_ports {node11_pedi[10]}] \
[get_ports {node11_pedi[9]}] [get_ports {node11_pedi[8]}] [get_ports           \
{node11_pedi[7]}] [get_ports {node11_pedi[6]}] [get_ports {node11_pedi[5]}]    \
[get_ports {node11_pedi[4]}] [get_ports {node11_pedi[3]}] [get_ports           \
{node11_pedi[2]}] [get_ports {node11_pedi[1]}] [get_ports {node11_pedi[0]}]    \
[get_ports node11_pero] [get_ports node12_pesi] [get_ports {node12_pedi[63]}]  \
[get_ports {node12_pedi[62]}] [get_ports {node12_pedi[61]}] [get_ports         \
{node12_pedi[60]}] [get_ports {node12_pedi[59]}] [get_ports {node12_pedi[58]}] \
[get_ports {node12_pedi[57]}] [get_ports {node12_pedi[56]}] [get_ports         \
{node12_pedi[55]}] [get_ports {node12_pedi[54]}] [get_ports {node12_pedi[53]}] \
[get_ports {node12_pedi[52]}] [get_ports {node12_pedi[51]}] [get_ports         \
{node12_pedi[50]}] [get_ports {node12_pedi[49]}] [get_ports {node12_pedi[48]}] \
[get_ports {node12_pedi[47]}] [get_ports {node12_pedi[46]}] [get_ports         \
{node12_pedi[45]}] [get_ports {node12_pedi[44]}] [get_ports {node12_pedi[43]}] \
[get_ports {node12_pedi[42]}] [get_ports {node12_pedi[41]}] [get_ports         \
{node12_pedi[40]}] [get_ports {node12_pedi[39]}] [get_ports {node12_pedi[38]}] \
[get_ports {node12_pedi[37]}] [get_ports {node12_pedi[36]}] [get_ports         \
{node12_pedi[35]}] [get_ports {node12_pedi[34]}] [get_ports {node12_pedi[33]}] \
[get_ports {node12_pedi[32]}] [get_ports {node12_pedi[31]}] [get_ports         \
{node12_pedi[30]}] [get_ports {node12_pedi[29]}] [get_ports {node12_pedi[28]}] \
[get_ports {node12_pedi[27]}] [get_ports {node12_pedi[26]}] [get_ports         \
{node12_pedi[25]}] [get_ports {node12_pedi[24]}] [get_ports {node12_pedi[23]}] \
[get_ports {node12_pedi[22]}] [get_ports {node12_pedi[21]}] [get_ports         \
{node12_pedi[20]}] [get_ports {node12_pedi[19]}] [get_ports {node12_pedi[18]}] \
[get_ports {node12_pedi[17]}] [get_ports {node12_pedi[16]}] [get_ports         \
{node12_pedi[15]}] [get_ports {node12_pedi[14]}] [get_ports {node12_pedi[13]}] \
[get_ports {node12_pedi[12]}] [get_ports {node12_pedi[11]}] [get_ports         \
{node12_pedi[10]}] [get_ports {node12_pedi[9]}] [get_ports {node12_pedi[8]}]   \
[get_ports {node12_pedi[7]}] [get_ports {node12_pedi[6]}] [get_ports           \
{node12_pedi[5]}] [get_ports {node12_pedi[4]}] [get_ports {node12_pedi[3]}]    \
[get_ports {node12_pedi[2]}] [get_ports {node12_pedi[1]}] [get_ports           \
{node12_pedi[0]}] [get_ports node12_pero] [get_ports node13_pesi] [get_ports   \
{node13_pedi[63]}] [get_ports {node13_pedi[62]}] [get_ports {node13_pedi[61]}] \
[get_ports {node13_pedi[60]}] [get_ports {node13_pedi[59]}] [get_ports         \
{node13_pedi[58]}] [get_ports {node13_pedi[57]}] [get_ports {node13_pedi[56]}] \
[get_ports {node13_pedi[55]}] [get_ports {node13_pedi[54]}] [get_ports         \
{node13_pedi[53]}] [get_ports {node13_pedi[52]}] [get_ports {node13_pedi[51]}] \
[get_ports {node13_pedi[50]}] [get_ports {node13_pedi[49]}] [get_ports         \
{node13_pedi[48]}] [get_ports {node13_pedi[47]}] [get_ports {node13_pedi[46]}] \
[get_ports {node13_pedi[45]}] [get_ports {node13_pedi[44]}] [get_ports         \
{node13_pedi[43]}] [get_ports {node13_pedi[42]}] [get_ports {node13_pedi[41]}] \
[get_ports {node13_pedi[40]}] [get_ports {node13_pedi[39]}] [get_ports         \
{node13_pedi[38]}] [get_ports {node13_pedi[37]}] [get_ports {node13_pedi[36]}] \
[get_ports {node13_pedi[35]}] [get_ports {node13_pedi[34]}] [get_ports         \
{node13_pedi[33]}] [get_ports {node13_pedi[32]}] [get_ports {node13_pedi[31]}] \
[get_ports {node13_pedi[30]}] [get_ports {node13_pedi[29]}] [get_ports         \
{node13_pedi[28]}] [get_ports {node13_pedi[27]}] [get_ports {node13_pedi[26]}] \
[get_ports {node13_pedi[25]}] [get_ports {node13_pedi[24]}] [get_ports         \
{node13_pedi[23]}] [get_ports {node13_pedi[22]}] [get_ports {node13_pedi[21]}] \
[get_ports {node13_pedi[20]}] [get_ports {node13_pedi[19]}] [get_ports         \
{node13_pedi[18]}] [get_ports {node13_pedi[17]}] [get_ports {node13_pedi[16]}] \
[get_ports {node13_pedi[15]}] [get_ports {node13_pedi[14]}] [get_ports         \
{node13_pedi[13]}] [get_ports {node13_pedi[12]}] [get_ports {node13_pedi[11]}] \
[get_ports {node13_pedi[10]}] [get_ports {node13_pedi[9]}] [get_ports          \
{node13_pedi[8]}] [get_ports {node13_pedi[7]}] [get_ports {node13_pedi[6]}]    \
[get_ports {node13_pedi[5]}] [get_ports {node13_pedi[4]}] [get_ports           \
{node13_pedi[3]}] [get_ports {node13_pedi[2]}] [get_ports {node13_pedi[1]}]    \
[get_ports {node13_pedi[0]}] [get_ports node13_pero] [get_ports node20_pesi]   \
[get_ports {node20_pedi[63]}] [get_ports {node20_pedi[62]}] [get_ports         \
{node20_pedi[61]}] [get_ports {node20_pedi[60]}] [get_ports {node20_pedi[59]}] \
[get_ports {node20_pedi[58]}] [get_ports {node20_pedi[57]}] [get_ports         \
{node20_pedi[56]}] [get_ports {node20_pedi[55]}] [get_ports {node20_pedi[54]}] \
[get_ports {node20_pedi[53]}] [get_ports {node20_pedi[52]}] [get_ports         \
{node20_pedi[51]}] [get_ports {node20_pedi[50]}] [get_ports {node20_pedi[49]}] \
[get_ports {node20_pedi[48]}] [get_ports {node20_pedi[47]}] [get_ports         \
{node20_pedi[46]}] [get_ports {node20_pedi[45]}] [get_ports {node20_pedi[44]}] \
[get_ports {node20_pedi[43]}] [get_ports {node20_pedi[42]}] [get_ports         \
{node20_pedi[41]}] [get_ports {node20_pedi[40]}] [get_ports {node20_pedi[39]}] \
[get_ports {node20_pedi[38]}] [get_ports {node20_pedi[37]}] [get_ports         \
{node20_pedi[36]}] [get_ports {node20_pedi[35]}] [get_ports {node20_pedi[34]}] \
[get_ports {node20_pedi[33]}] [get_ports {node20_pedi[32]}] [get_ports         \
{node20_pedi[31]}] [get_ports {node20_pedi[30]}] [get_ports {node20_pedi[29]}] \
[get_ports {node20_pedi[28]}] [get_ports {node20_pedi[27]}] [get_ports         \
{node20_pedi[26]}] [get_ports {node20_pedi[25]}] [get_ports {node20_pedi[24]}] \
[get_ports {node20_pedi[23]}] [get_ports {node20_pedi[22]}] [get_ports         \
{node20_pedi[21]}] [get_ports {node20_pedi[20]}] [get_ports {node20_pedi[19]}] \
[get_ports {node20_pedi[18]}] [get_ports {node20_pedi[17]}] [get_ports         \
{node20_pedi[16]}] [get_ports {node20_pedi[15]}] [get_ports {node20_pedi[14]}] \
[get_ports {node20_pedi[13]}] [get_ports {node20_pedi[12]}] [get_ports         \
{node20_pedi[11]}] [get_ports {node20_pedi[10]}] [get_ports {node20_pedi[9]}]  \
[get_ports {node20_pedi[8]}] [get_ports {node20_pedi[7]}] [get_ports           \
{node20_pedi[6]}] [get_ports {node20_pedi[5]}] [get_ports {node20_pedi[4]}]    \
[get_ports {node20_pedi[3]}] [get_ports {node20_pedi[2]}] [get_ports           \
{node20_pedi[1]}] [get_ports {node20_pedi[0]}] [get_ports node20_pero]         \
[get_ports node21_pesi] [get_ports {node21_pedi[63]}] [get_ports               \
{node21_pedi[62]}] [get_ports {node21_pedi[61]}] [get_ports {node21_pedi[60]}] \
[get_ports {node21_pedi[59]}] [get_ports {node21_pedi[58]}] [get_ports         \
{node21_pedi[57]}] [get_ports {node21_pedi[56]}] [get_ports {node21_pedi[55]}] \
[get_ports {node21_pedi[54]}] [get_ports {node21_pedi[53]}] [get_ports         \
{node21_pedi[52]}] [get_ports {node21_pedi[51]}] [get_ports {node21_pedi[50]}] \
[get_ports {node21_pedi[49]}] [get_ports {node21_pedi[48]}] [get_ports         \
{node21_pedi[47]}] [get_ports {node21_pedi[46]}] [get_ports {node21_pedi[45]}] \
[get_ports {node21_pedi[44]}] [get_ports {node21_pedi[43]}] [get_ports         \
{node21_pedi[42]}] [get_ports {node21_pedi[41]}] [get_ports {node21_pedi[40]}] \
[get_ports {node21_pedi[39]}] [get_ports {node21_pedi[38]}] [get_ports         \
{node21_pedi[37]}] [get_ports {node21_pedi[36]}] [get_ports {node21_pedi[35]}] \
[get_ports {node21_pedi[34]}] [get_ports {node21_pedi[33]}] [get_ports         \
{node21_pedi[32]}] [get_ports {node21_pedi[31]}] [get_ports {node21_pedi[30]}] \
[get_ports {node21_pedi[29]}] [get_ports {node21_pedi[28]}] [get_ports         \
{node21_pedi[27]}] [get_ports {node21_pedi[26]}] [get_ports {node21_pedi[25]}] \
[get_ports {node21_pedi[24]}] [get_ports {node21_pedi[23]}] [get_ports         \
{node21_pedi[22]}] [get_ports {node21_pedi[21]}] [get_ports {node21_pedi[20]}] \
[get_ports {node21_pedi[19]}] [get_ports {node21_pedi[18]}] [get_ports         \
{node21_pedi[17]}] [get_ports {node21_pedi[16]}] [get_ports {node21_pedi[15]}] \
[get_ports {node21_pedi[14]}] [get_ports {node21_pedi[13]}] [get_ports         \
{node21_pedi[12]}] [get_ports {node21_pedi[11]}] [get_ports {node21_pedi[10]}] \
[get_ports {node21_pedi[9]}] [get_ports {node21_pedi[8]}] [get_ports           \
{node21_pedi[7]}] [get_ports {node21_pedi[6]}] [get_ports {node21_pedi[5]}]    \
[get_ports {node21_pedi[4]}] [get_ports {node21_pedi[3]}] [get_ports           \
{node21_pedi[2]}] [get_ports {node21_pedi[1]}] [get_ports {node21_pedi[0]}]    \
[get_ports node21_pero] [get_ports node22_pesi] [get_ports {node22_pedi[63]}]  \
[get_ports {node22_pedi[62]}] [get_ports {node22_pedi[61]}] [get_ports         \
{node22_pedi[60]}] [get_ports {node22_pedi[59]}] [get_ports {node22_pedi[58]}] \
[get_ports {node22_pedi[57]}] [get_ports {node22_pedi[56]}] [get_ports         \
{node22_pedi[55]}] [get_ports {node22_pedi[54]}] [get_ports {node22_pedi[53]}] \
[get_ports {node22_pedi[52]}] [get_ports {node22_pedi[51]}] [get_ports         \
{node22_pedi[50]}] [get_ports {node22_pedi[49]}] [get_ports {node22_pedi[48]}] \
[get_ports {node22_pedi[47]}] [get_ports {node22_pedi[46]}] [get_ports         \
{node22_pedi[45]}] [get_ports {node22_pedi[44]}] [get_ports {node22_pedi[43]}] \
[get_ports {node22_pedi[42]}] [get_ports {node22_pedi[41]}] [get_ports         \
{node22_pedi[40]}] [get_ports {node22_pedi[39]}] [get_ports {node22_pedi[38]}] \
[get_ports {node22_pedi[37]}] [get_ports {node22_pedi[36]}] [get_ports         \
{node22_pedi[35]}] [get_ports {node22_pedi[34]}] [get_ports {node22_pedi[33]}] \
[get_ports {node22_pedi[32]}] [get_ports {node22_pedi[31]}] [get_ports         \
{node22_pedi[30]}] [get_ports {node22_pedi[29]}] [get_ports {node22_pedi[28]}] \
[get_ports {node22_pedi[27]}] [get_ports {node22_pedi[26]}] [get_ports         \
{node22_pedi[25]}] [get_ports {node22_pedi[24]}] [get_ports {node22_pedi[23]}] \
[get_ports {node22_pedi[22]}] [get_ports {node22_pedi[21]}] [get_ports         \
{node22_pedi[20]}] [get_ports {node22_pedi[19]}] [get_ports {node22_pedi[18]}] \
[get_ports {node22_pedi[17]}] [get_ports {node22_pedi[16]}] [get_ports         \
{node22_pedi[15]}] [get_ports {node22_pedi[14]}] [get_ports {node22_pedi[13]}] \
[get_ports {node22_pedi[12]}] [get_ports {node22_pedi[11]}] [get_ports         \
{node22_pedi[10]}] [get_ports {node22_pedi[9]}] [get_ports {node22_pedi[8]}]   \
[get_ports {node22_pedi[7]}] [get_ports {node22_pedi[6]}] [get_ports           \
{node22_pedi[5]}] [get_ports {node22_pedi[4]}] [get_ports {node22_pedi[3]}]    \
[get_ports {node22_pedi[2]}] [get_ports {node22_pedi[1]}] [get_ports           \
{node22_pedi[0]}] [get_ports node22_pero] [get_ports node23_pesi] [get_ports   \
{node23_pedi[63]}] [get_ports {node23_pedi[62]}] [get_ports {node23_pedi[61]}] \
[get_ports {node23_pedi[60]}] [get_ports {node23_pedi[59]}] [get_ports         \
{node23_pedi[58]}] [get_ports {node23_pedi[57]}] [get_ports {node23_pedi[56]}] \
[get_ports {node23_pedi[55]}] [get_ports {node23_pedi[54]}] [get_ports         \
{node23_pedi[53]}] [get_ports {node23_pedi[52]}] [get_ports {node23_pedi[51]}] \
[get_ports {node23_pedi[50]}] [get_ports {node23_pedi[49]}] [get_ports         \
{node23_pedi[48]}] [get_ports {node23_pedi[47]}] [get_ports {node23_pedi[46]}] \
[get_ports {node23_pedi[45]}] [get_ports {node23_pedi[44]}] [get_ports         \
{node23_pedi[43]}] [get_ports {node23_pedi[42]}] [get_ports {node23_pedi[41]}] \
[get_ports {node23_pedi[40]}] [get_ports {node23_pedi[39]}] [get_ports         \
{node23_pedi[38]}] [get_ports {node23_pedi[37]}] [get_ports {node23_pedi[36]}] \
[get_ports {node23_pedi[35]}] [get_ports {node23_pedi[34]}] [get_ports         \
{node23_pedi[33]}] [get_ports {node23_pedi[32]}] [get_ports {node23_pedi[31]}] \
[get_ports {node23_pedi[30]}] [get_ports {node23_pedi[29]}] [get_ports         \
{node23_pedi[28]}] [get_ports {node23_pedi[27]}] [get_ports {node23_pedi[26]}] \
[get_ports {node23_pedi[25]}] [get_ports {node23_pedi[24]}] [get_ports         \
{node23_pedi[23]}] [get_ports {node23_pedi[22]}] [get_ports {node23_pedi[21]}] \
[get_ports {node23_pedi[20]}] [get_ports {node23_pedi[19]}] [get_ports         \
{node23_pedi[18]}] [get_ports {node23_pedi[17]}] [get_ports {node23_pedi[16]}] \
[get_ports {node23_pedi[15]}] [get_ports {node23_pedi[14]}] [get_ports         \
{node23_pedi[13]}] [get_ports {node23_pedi[12]}] [get_ports {node23_pedi[11]}] \
[get_ports {node23_pedi[10]}] [get_ports {node23_pedi[9]}] [get_ports          \
{node23_pedi[8]}] [get_ports {node23_pedi[7]}] [get_ports {node23_pedi[6]}]    \
[get_ports {node23_pedi[5]}] [get_ports {node23_pedi[4]}] [get_ports           \
{node23_pedi[3]}] [get_ports {node23_pedi[2]}] [get_ports {node23_pedi[1]}]    \
[get_ports {node23_pedi[0]}] [get_ports node23_pero] [get_ports node30_pesi]   \
[get_ports {node30_pedi[63]}] [get_ports {node30_pedi[62]}] [get_ports         \
{node30_pedi[61]}] [get_ports {node30_pedi[60]}] [get_ports {node30_pedi[59]}] \
[get_ports {node30_pedi[58]}] [get_ports {node30_pedi[57]}] [get_ports         \
{node30_pedi[56]}] [get_ports {node30_pedi[55]}] [get_ports {node30_pedi[54]}] \
[get_ports {node30_pedi[53]}] [get_ports {node30_pedi[52]}] [get_ports         \
{node30_pedi[51]}] [get_ports {node30_pedi[50]}] [get_ports {node30_pedi[49]}] \
[get_ports {node30_pedi[48]}] [get_ports {node30_pedi[47]}] [get_ports         \
{node30_pedi[46]}] [get_ports {node30_pedi[45]}] [get_ports {node30_pedi[44]}] \
[get_ports {node30_pedi[43]}] [get_ports {node30_pedi[42]}] [get_ports         \
{node30_pedi[41]}] [get_ports {node30_pedi[40]}] [get_ports {node30_pedi[39]}] \
[get_ports {node30_pedi[38]}] [get_ports {node30_pedi[37]}] [get_ports         \
{node30_pedi[36]}] [get_ports {node30_pedi[35]}] [get_ports {node30_pedi[34]}] \
[get_ports {node30_pedi[33]}] [get_ports {node30_pedi[32]}] [get_ports         \
{node30_pedi[31]}] [get_ports {node30_pedi[30]}] [get_ports {node30_pedi[29]}] \
[get_ports {node30_pedi[28]}] [get_ports {node30_pedi[27]}] [get_ports         \
{node30_pedi[26]}] [get_ports {node30_pedi[25]}] [get_ports {node30_pedi[24]}] \
[get_ports {node30_pedi[23]}] [get_ports {node30_pedi[22]}] [get_ports         \
{node30_pedi[21]}] [get_ports {node30_pedi[20]}] [get_ports {node30_pedi[19]}] \
[get_ports {node30_pedi[18]}] [get_ports {node30_pedi[17]}] [get_ports         \
{node30_pedi[16]}] [get_ports {node30_pedi[15]}] [get_ports {node30_pedi[14]}] \
[get_ports {node30_pedi[13]}] [get_ports {node30_pedi[12]}] [get_ports         \
{node30_pedi[11]}] [get_ports {node30_pedi[10]}] [get_ports {node30_pedi[9]}]  \
[get_ports {node30_pedi[8]}] [get_ports {node30_pedi[7]}] [get_ports           \
{node30_pedi[6]}] [get_ports {node30_pedi[5]}] [get_ports {node30_pedi[4]}]    \
[get_ports {node30_pedi[3]}] [get_ports {node30_pedi[2]}] [get_ports           \
{node30_pedi[1]}] [get_ports {node30_pedi[0]}] [get_ports node30_pero]         \
[get_ports node31_pesi] [get_ports {node31_pedi[63]}] [get_ports               \
{node31_pedi[62]}] [get_ports {node31_pedi[61]}] [get_ports {node31_pedi[60]}] \
[get_ports {node31_pedi[59]}] [get_ports {node31_pedi[58]}] [get_ports         \
{node31_pedi[57]}] [get_ports {node31_pedi[56]}] [get_ports {node31_pedi[55]}] \
[get_ports {node31_pedi[54]}] [get_ports {node31_pedi[53]}] [get_ports         \
{node31_pedi[52]}] [get_ports {node31_pedi[51]}] [get_ports {node31_pedi[50]}] \
[get_ports {node31_pedi[49]}] [get_ports {node31_pedi[48]}] [get_ports         \
{node31_pedi[47]}] [get_ports {node31_pedi[46]}] [get_ports {node31_pedi[45]}] \
[get_ports {node31_pedi[44]}] [get_ports {node31_pedi[43]}] [get_ports         \
{node31_pedi[42]}] [get_ports {node31_pedi[41]}] [get_ports {node31_pedi[40]}] \
[get_ports {node31_pedi[39]}] [get_ports {node31_pedi[38]}] [get_ports         \
{node31_pedi[37]}] [get_ports {node31_pedi[36]}] [get_ports {node31_pedi[35]}] \
[get_ports {node31_pedi[34]}] [get_ports {node31_pedi[33]}] [get_ports         \
{node31_pedi[32]}] [get_ports {node31_pedi[31]}] [get_ports {node31_pedi[30]}] \
[get_ports {node31_pedi[29]}] [get_ports {node31_pedi[28]}] [get_ports         \
{node31_pedi[27]}] [get_ports {node31_pedi[26]}] [get_ports {node31_pedi[25]}] \
[get_ports {node31_pedi[24]}] [get_ports {node31_pedi[23]}] [get_ports         \
{node31_pedi[22]}] [get_ports {node31_pedi[21]}] [get_ports {node31_pedi[20]}] \
[get_ports {node31_pedi[19]}] [get_ports {node31_pedi[18]}] [get_ports         \
{node31_pedi[17]}] [get_ports {node31_pedi[16]}] [get_ports {node31_pedi[15]}] \
[get_ports {node31_pedi[14]}] [get_ports {node31_pedi[13]}] [get_ports         \
{node31_pedi[12]}] [get_ports {node31_pedi[11]}] [get_ports {node31_pedi[10]}] \
[get_ports {node31_pedi[9]}] [get_ports {node31_pedi[8]}] [get_ports           \
{node31_pedi[7]}] [get_ports {node31_pedi[6]}] [get_ports {node31_pedi[5]}]    \
[get_ports {node31_pedi[4]}] [get_ports {node31_pedi[3]}] [get_ports           \
{node31_pedi[2]}] [get_ports {node31_pedi[1]}] [get_ports {node31_pedi[0]}]    \
[get_ports node31_pero] [get_ports node32_pesi] [get_ports {node32_pedi[63]}]  \
[get_ports {node32_pedi[62]}] [get_ports {node32_pedi[61]}] [get_ports         \
{node32_pedi[60]}] [get_ports {node32_pedi[59]}] [get_ports {node32_pedi[58]}] \
[get_ports {node32_pedi[57]}] [get_ports {node32_pedi[56]}] [get_ports         \
{node32_pedi[55]}] [get_ports {node32_pedi[54]}] [get_ports {node32_pedi[53]}] \
[get_ports {node32_pedi[52]}] [get_ports {node32_pedi[51]}] [get_ports         \
{node32_pedi[50]}] [get_ports {node32_pedi[49]}] [get_ports {node32_pedi[48]}] \
[get_ports {node32_pedi[47]}] [get_ports {node32_pedi[46]}] [get_ports         \
{node32_pedi[45]}] [get_ports {node32_pedi[44]}] [get_ports {node32_pedi[43]}] \
[get_ports {node32_pedi[42]}] [get_ports {node32_pedi[41]}] [get_ports         \
{node32_pedi[40]}] [get_ports {node32_pedi[39]}] [get_ports {node32_pedi[38]}] \
[get_ports {node32_pedi[37]}] [get_ports {node32_pedi[36]}] [get_ports         \
{node32_pedi[35]}] [get_ports {node32_pedi[34]}] [get_ports {node32_pedi[33]}] \
[get_ports {node32_pedi[32]}] [get_ports {node32_pedi[31]}] [get_ports         \
{node32_pedi[30]}] [get_ports {node32_pedi[29]}] [get_ports {node32_pedi[28]}] \
[get_ports {node32_pedi[27]}] [get_ports {node32_pedi[26]}] [get_ports         \
{node32_pedi[25]}] [get_ports {node32_pedi[24]}] [get_ports {node32_pedi[23]}] \
[get_ports {node32_pedi[22]}] [get_ports {node32_pedi[21]}] [get_ports         \
{node32_pedi[20]}] [get_ports {node32_pedi[19]}] [get_ports {node32_pedi[18]}] \
[get_ports {node32_pedi[17]}] [get_ports {node32_pedi[16]}] [get_ports         \
{node32_pedi[15]}] [get_ports {node32_pedi[14]}] [get_ports {node32_pedi[13]}] \
[get_ports {node32_pedi[12]}] [get_ports {node32_pedi[11]}] [get_ports         \
{node32_pedi[10]}] [get_ports {node32_pedi[9]}] [get_ports {node32_pedi[8]}]   \
[get_ports {node32_pedi[7]}] [get_ports {node32_pedi[6]}] [get_ports           \
{node32_pedi[5]}] [get_ports {node32_pedi[4]}] [get_ports {node32_pedi[3]}]    \
[get_ports {node32_pedi[2]}] [get_ports {node32_pedi[1]}] [get_ports           \
{node32_pedi[0]}] [get_ports node32_pero] [get_ports node33_pesi] [get_ports   \
{node33_pedi[63]}] [get_ports {node33_pedi[62]}] [get_ports {node33_pedi[61]}] \
[get_ports {node33_pedi[60]}] [get_ports {node33_pedi[59]}] [get_ports         \
{node33_pedi[58]}] [get_ports {node33_pedi[57]}] [get_ports {node33_pedi[56]}] \
[get_ports {node33_pedi[55]}] [get_ports {node33_pedi[54]}] [get_ports         \
{node33_pedi[53]}] [get_ports {node33_pedi[52]}] [get_ports {node33_pedi[51]}] \
[get_ports {node33_pedi[50]}] [get_ports {node33_pedi[49]}] [get_ports         \
{node33_pedi[48]}] [get_ports {node33_pedi[47]}] [get_ports {node33_pedi[46]}] \
[get_ports {node33_pedi[45]}] [get_ports {node33_pedi[44]}] [get_ports         \
{node33_pedi[43]}] [get_ports {node33_pedi[42]}] [get_ports {node33_pedi[41]}] \
[get_ports {node33_pedi[40]}] [get_ports {node33_pedi[39]}] [get_ports         \
{node33_pedi[38]}] [get_ports {node33_pedi[37]}] [get_ports {node33_pedi[36]}] \
[get_ports {node33_pedi[35]}] [get_ports {node33_pedi[34]}] [get_ports         \
{node33_pedi[33]}] [get_ports {node33_pedi[32]}] [get_ports {node33_pedi[31]}] \
[get_ports {node33_pedi[30]}] [get_ports {node33_pedi[29]}] [get_ports         \
{node33_pedi[28]}] [get_ports {node33_pedi[27]}] [get_ports {node33_pedi[26]}] \
[get_ports {node33_pedi[25]}] [get_ports {node33_pedi[24]}] [get_ports         \
{node33_pedi[23]}] [get_ports {node33_pedi[22]}] [get_ports {node33_pedi[21]}] \
[get_ports {node33_pedi[20]}] [get_ports {node33_pedi[19]}] [get_ports         \
{node33_pedi[18]}] [get_ports {node33_pedi[17]}] [get_ports {node33_pedi[16]}] \
[get_ports {node33_pedi[15]}] [get_ports {node33_pedi[14]}] [get_ports         \
{node33_pedi[13]}] [get_ports {node33_pedi[12]}] [get_ports {node33_pedi[11]}] \
[get_ports {node33_pedi[10]}] [get_ports {node33_pedi[9]}] [get_ports          \
{node33_pedi[8]}] [get_ports {node33_pedi[7]}] [get_ports {node33_pedi[6]}]    \
[get_ports {node33_pedi[5]}] [get_ports {node33_pedi[4]}] [get_ports           \
{node33_pedi[3]}] [get_ports {node33_pedi[2]}] [get_ports {node33_pedi[1]}]    \
[get_ports {node33_pedi[0]}] [get_ports node33_pero]]
