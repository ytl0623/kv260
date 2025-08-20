# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\mini_pc1\Desktop\canliu\hello_world_vitis\kv260\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\mini_pc1\Desktop\canliu\hello_world_vitis\kv260\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {kv260}\
-hw {C:\Users\mini_pc1\Desktop\canliu\hello_world_vivado\hello_world\kv260.xsa}\
-arch {64-bit} -fsbl-target {psu_cortexa53_0} -out {C:/Users/mini_pc1/Desktop/canliu/hello_world_vitis}

platform write
domain create -name {standalone_psu_cortexa53_0} -display-name {standalone_psu_cortexa53_0} -os {standalone} -proc {psu_cortexa53_0} -runtime {cpp} -arch {64-bit} -support-app {hello_world}
platform generate -domains 
platform active {kv260}
domain active {zynqmp_fsbl}
domain active {zynqmp_pmufw}
domain active {standalone_psu_cortexa53_0}
platform generate -quick
domain active {zynqmp_pmufw}
domain active {standalone_psu_cortexa53_0}
domain active {zynqmp_fsbl}
bsp reload
bsp reload
bsp reload
platform generate
