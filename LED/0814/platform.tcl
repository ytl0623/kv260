# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\mini_pc1\Desktop\canliu\kv260\kv260_blinking_led\0814\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\mini_pc1\Desktop\canliu\kv260\kv260_blinking_led\0814\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {0814}\
-hw {C:\Users\mini_pc1\Desktop\canliu\kv260\kv260_blinking_led\top.xsa}\
-proc {psu_cortexa53_0} -os {standalone} -arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {C:/Users/mini_pc1/Desktop/canliu/kv260/kv260_blinking_led}

platform write
platform generate -domains 
platform active {0814}
platform generate
bsp reload
domain active {zynqmp_fsbl}
bsp reload
domain active {zynqmp_pmufw}
bsp reload
domain active {standalone_domain}
bsp setlib -name xilpm -ver 3.4
bsp write
bsp reload
catch {bsp regenerate}
platform generate -domains standalone_domain 
platform active {0814}
platform generate -domains 
