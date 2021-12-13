set_time_format -unit ns -decimal_places 3
create_clock -name {clock} -period 20.800 -waveform { 0.000 10.400 } [get_ports {clock}]

create_generated_clock -divide_by 4096 -source [get_ports clock] -name {sevenseg_clock[12]} [get_registers sevenseg_clock[12]]


set_clock_uncertainty -rise_from [get_ports {clock}] -rise_to [get_ports {clock}] 0.020
set_clock_uncertainty -rise_from [get_ports {clock}] -fall_to [get_ports {clock}] 0.020
set_clock_uncertainty -fall_from [get_ports {clock}] -rise_to [get_ports {clock}] 0.020
set_clock_uncertainty -fall_from [get_ports {clock}] -fall_to [get_ports {clock}] 0.020

set_false_path -to [get_ports {DS_A DS_B DS_C DS_D DS_E DS_F DS_G DS_EN1 DS_EN2 DS_EN3 DS_EN4}]