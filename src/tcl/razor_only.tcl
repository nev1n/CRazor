#razor only

#0. set variables and paths
# -------------------------

set DESIGN_NAME RAZOR_only
set COMPO_PATH "/home/georgen/Nevin/genus/ALU_Razor_Test/src/rtl/vhdl/razor_crazor"

set CLOCK_DELAY 10
set CLOCK1_DELAY 15

set SYN_EFF medium
set MAP_EFF medium


#1. read source rtl files
# ------------------------

read_hdl -vhdl ${COMPO_PATH}/Mux2x1.vhd
read_hdl -vhdl ${COMPO_PATH}/Dff.vhd 
read_hdl -vhdl ${COMPO_PATH}/d_latch.vhd
read_hdl -vhdl ${COMPO_PATH}/razor.vhd

set_db lib_search_path /home/georgen/Nevin/genus
set_db library NangateOpenCellLibrary_typical_ccs.lib


#2. elaborate the design (the top module)
# ---------------------------------------

elaborate razor


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