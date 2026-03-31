###################################################################

# Created by write_sdc on Mon Mar 30 18:13:29 2026

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
create_clock [get_ports clk]  -period 4  -waveform {0 2}
