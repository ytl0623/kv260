# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\mini_pc1\Desktop\canliu\kv260\kv260_blinking_led\led_system\_ide\scripts\systemdebugger_led_system_1_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\mini_pc1\Desktop\canliu\kv260\kv260_blinking_led\led_system\_ide\scripts\systemdebugger_led_system_1_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
source C:/Xilinx/Vitis/2021.1/scripts/vitis/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Xilinx X-MLCC-01 XFL1BQ4D12UWA" && level==0 && jtag_device_ctx=="jsn-X-MLCC-01-XFL1BQ4D12UWA-04724093-0"}
fpga -file C:/Users/mini_pc1/Desktop/canliu/kv260/kv260_blinking_led/led/_ide/bitstream/top.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/mini_pc1/Desktop/canliu/kv260/kv260_blinking_led/0814/export/0814/hw/top.xsa -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
set mode [expr [mrd -value 0xFF5E0200] & 0xf]
mask_write 0xFF5E0200 0xf000 0
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow C:/Users/mini_pc1/Desktop/canliu/kv260/kv260_blinking_led/0814/export/0814/sw/0814/boot/fsbl.elf
set bp_51_20_fsbl_bp [bpadd -addr &XFsbl_Exit]
con -block -timeout 60
bpremove $bp_51_20_fsbl_bp
targets -set -nocase -filter {name =~ "*A53*#0"}
rst -processor
dow C:/Users/mini_pc1/Desktop/canliu/kv260/kv260_blinking_led/led/Debug/led.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A53*#0"}
con
