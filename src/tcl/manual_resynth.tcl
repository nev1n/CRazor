#razor only

#0. set variables and paths
# -------------------------

set DESIGN_NAME Manual_Resynth_ALU_RAZOR_COMBINED
set COMPO_PATH "src/rtl/vhdl"

set CLOCK_DELAY 10
set CLOCK1_DELAY 15

set SYN_EFF medium
set MAP_EFF medium


#1. read source rtl files
# ------------------------

# read_hdl -vhdl ${COMPO_PATH}/razor_crazor/Mux2x1.vhd
# read_hdl -vhdl ${COMPO_PATH}/razor_crazor/Dff.vhd 
# read_hdl -vhdl ${COMPO_PATH}/razor_crazor/d_latch.vhd
# read_hdl -vhdl ${COMPO_PATH}/razor_crazor/razor_clk_only.vhd

# read_hdl -vhdl ${COMPO_PATH}/RISC_lib.vhd
# read_hdl -vhdl ${COMPO_PATH}/alu.vhd
# read_hdl -vhdl ${COMPO_PATH}/top.vhd

set_db lib_search_path 
set_db library NangateOpenCellLibrary_typical_ccs.lib

read_hdl ${COMPO_PATH}/Manual_ALU_Razor.v




#2. elaborate the design (the top module)
# ---------------------------------------

elaborate Manual_ALU_Razor


#3. prechanges and specification to design before final synthesis, like ungroup, clocks etc
# -----------------------------------------------------------------------------------------

ungroup -all -flatten

create_clock -name MY_CLK -period ${CLOCK_DELAY} "clk"

set_dont_touch_network MY_CLK
set_dont_touch_network "reset"


#4. synthesize the design
# -----------------------------

synthesize -to_generic -eff ${SYN_EFF}
puts "Runtime & Memory after 'synthesize -to_generic'"
timestat

synthesize -to_mapped  -eff ${MAP_EFF}
puts "Runtime & Memory after 'synthesize -to_mapped'"
timestat


#5. check the design?
# -----------------------------

check_design


#6. report on the synthesized design
# -----------------------------------

report timing            > reports/timing/${DESIGN_NAME}.txt
report area              > reports/area/${DESIGN_NAME}.txt
report power             > reports/power/${DESIGN_NAME}.txt
report gates             > reports/gates/${DESIGN_NAME}.txt

write_design -basename designs/${DESIGN_NAME} -hierarchical

write_saif               > designs/${DESIGN_NAME}.saif
write_sdf                > designs/${DESIGN_NAME}.sdf