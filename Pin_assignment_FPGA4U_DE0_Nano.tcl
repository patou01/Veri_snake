###############################################################################
# pin_assignment_DE0_Nano.tcl
#
# BOARD         : DE0-Nano from Terasic
# Author        : René Beuchat, LAP/EPFL from Terasic documentation (adapted by Sahand Kashani)
# Revision      : 1.1
# Creation date : 24/08/2012
#
# Syntax Rule : GROUP_NAME_N[bit]
#
# GROUP : specify a particular interface (ex: SDR_)
# NAME  : signal name (ex: CONFIG, D, ...)
# bit   : signal index
# _N    : to specify an active-low signal
#
# You can run this script from Quartus II by performing the following steps:
# 1. Place this TCL script in your project directory
# 2. Open your project in Quartus
# 3. Go to the View > Utility Windows -> Tcl Console
# 4. In the Tcl Console type:
#        source pin_assignment_FPGA4U_DE0_Nano.tcl
# 5. The script will assign pins and return an "assignment made" message.
###############################################################################
# Modified:
# RB 2012/08/24
#
# Use Quartus II's ability to allow multiple signal names for the same pin.
# Note though that only one name can be used at a time in a design.
#
# Define:
# - Clks
# - SDRAM
# - LED
# - Buttons and associated LEDs
# - 20-pin extension connector SWITCH name, Mubus, Camera
###############################################################################
# Modified:
# SK 2015/09/2015
#
# - Added IO_STANDARD for all pins of the design
# - Renamed a few pins with additional underscores to better see them in
#   Quartus II's schematic editor.
##############################################################################

set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE22F17C6
set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA
set_global_assignment -name DEVICE_FILTER_PIN_COUNT 256
set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 6

#============================================================
# CLOCK
#============================================================
set_location_assignment PIN_R8  -to CLOCK_50
set_location_assignment PIN_R8  -to CLOCK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK

#============================================================
# LED_GREEN
#============================================================
set_location_assignment PIN_A15 -to LED_GREEN[0]
set_location_assignment PIN_A15 -to LED_GREEN0
set_location_assignment PIN_A13 -to LED_GREEN[1]
set_location_assignment PIN_A13 -to LED_GREEN1
set_location_assignment PIN_B13 -to LED_GREEN[2]
set_location_assignment PIN_B13 -to LED_GREEN2
set_location_assignment PIN_A11 -to LED_GREEN[3]
set_location_assignment PIN_A11 -to LED_GREEN3
set_location_assignment PIN_D1  -to LED_GREEN[4]
set_location_assignment PIN_D1  -to LED_GREEN4
set_location_assignment PIN_F3  -to LED_GREEN[5]
set_location_assignment PIN_F3  -to LED_GREEN5
set_location_assignment PIN_B1  -to LED_GREEN[6]
set_location_assignment PIN_B1  -to LED_GREEN6
set_location_assignment PIN_L3  -to LED_GREEN[7]
set_location_assignment PIN_L3  -to LED_GREEN7
assignment_group -add_member LED_GREEN[0] LED_GREEN[0..7]
assignment_group -add_member LED_GREEN[1] LED_GREEN[0..7]
assignment_group -add_member LED_GREEN[2] LED_GREEN[0..7]
assignment_group -add_member LED_GREEN[3] LED_GREEN[0..7]
assignment_group -add_member LED_GREEN[4] LED_GREEN[0..7]
assignment_group -add_member LED_GREEN[5] LED_GREEN[0..7]
assignment_group -add_member LED_GREEN[6] LED_GREEN[0..7]
assignment_group -add_member LED_GREEN[7] LED_GREEN[0..7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_GREEN[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_GREEN[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_GREEN[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_GREEN[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_GREEN[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_GREEN[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_GREEN[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_GREEN[7]

#============================================================
# KEY_N
#============================================================
set_location_assignment PIN_J15 -to KEY_N[0]
set_location_assignment PIN_J15 -to KEY_N0
set_location_assignment PIN_E1  -to KEY_N[1]
set_location_assignment PIN_E1  -to KEY_N1
assignment_group -add_member KEY_N[0] KEY_N[0..1]
assignment_group -add_member KEY_N[1] KEY_N[0..1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_N[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_N[1]

#============================================================
# SW
#============================================================
set_location_assignment PIN_M1  -to SW[0]
set_location_assignment PIN_M1  -to SW0
set_location_assignment PIN_T8  -to SW[1]
set_location_assignment PIN_T8  -to SW1
set_location_assignment PIN_B9  -to SW[2]
set_location_assignment PIN_B9  -to SW2
set_location_assignment PIN_M15 -to SW[3]
set_location_assignment PIN_M15 -to SW3
assignment_group -add_member SW[0] SW[0..3]
assignment_group -add_member SW[1] SW[0..3]
assignment_group -add_member SW[2] SW[0..3]
assignment_group -add_member SW[3] SW[0..3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[3]

#============================================================
# SDRAM
#============================================================
set_location_assignment PIN_M7  -to DRAM_BA[0]
set_location_assignment PIN_M7  -to DRAM_BA0
set_location_assignment PIN_M6  -to DRAM_BA[1]
set_location_assignment PIN_M6  -to DRAM_BA1
assignment_group -add_member DRAM_BA[0] DRAM_BA[0..1]
assignment_group -add_member DRAM_BA[1] DRAM_BA[0..1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA[1]

set_location_assignment PIN_R6  -to DRAM_DQM[0]
set_location_assignment PIN_R6  -to DRAM_DQM0
set_location_assignment PIN_T5  -to DRAM_DQM[1]
set_location_assignment PIN_T5  -to DRAM_DQM1
assignment_group -add_member DRAM_DQM[0] DRAM_DQM[0..1]
assignment_group -add_member DRAM_DQM[1] DRAM_DQM[0..1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQM[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQM[1]

set_location_assignment PIN_L2  -to DRAM_RAS_N
set_location_assignment PIN_L1  -to DRAM_CAS_N
set_location_assignment PIN_L7  -to DRAM_CKE
set_location_assignment PIN_R4  -to DRAM_CLK
set_location_assignment PIN_C2  -to DRAM_WE_N
set_location_assignment PIN_P6  -to DRAM_CS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_RAS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CAS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CKE
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_WE_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CS_N

set_location_assignment PIN_G2  -to DRAM_DQ[0]
set_location_assignment PIN_G2  -to DRAM_DQ0
set_location_assignment PIN_G1  -to DRAM_DQ[1]
set_location_assignment PIN_G1  -to DRAM_DQ1
set_location_assignment PIN_L8  -to DRAM_DQ[2]
set_location_assignment PIN_L8  -to DRAM_DQ2
set_location_assignment PIN_K5  -to DRAM_DQ[3]
set_location_assignment PIN_K5  -to DRAM_DQ3
set_location_assignment PIN_K2  -to DRAM_DQ[4]
set_location_assignment PIN_K2  -to DRAM_DQ4
set_location_assignment PIN_J2  -to DRAM_DQ[5]
set_location_assignment PIN_J2  -to DRAM_DQ5
set_location_assignment PIN_J1  -to DRAM_DQ[6]
set_location_assignment PIN_J1  -to DRAM_DQ6
set_location_assignment PIN_R7  -to DRAM_DQ[7]
set_location_assignment PIN_R7  -to DRAM_DQ7
set_location_assignment PIN_T4  -to DRAM_DQ[8]
set_location_assignment PIN_T4  -to DRAM_DQ8
set_location_assignment PIN_T2  -to DRAM_DQ[9]
set_location_assignment PIN_T2  -to DRAM_DQ9
set_location_assignment PIN_T3  -to DRAM_DQ[10]
set_location_assignment PIN_T3  -to DRAM_DQ10
set_location_assignment PIN_R3  -to DRAM_DQ[11]
set_location_assignment PIN_R3  -to DRAM_DQ11
set_location_assignment PIN_R5  -to DRAM_DQ[12]
set_location_assignment PIN_R5  -to DRAM_DQ12
set_location_assignment PIN_P3  -to DRAM_DQ[13]
set_location_assignment PIN_P3  -to DRAM_DQ13
set_location_assignment PIN_N3  -to DRAM_DQ[14]
set_location_assignment PIN_N3  -to DRAM_DQ14
set_location_assignment PIN_K1  -to DRAM_DQ[15]
set_location_assignment PIN_K1  -to DRAM_DQ15
assignment_group -add_member DRAM_DQ[0]  DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[1]  DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[2]  DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[3]  DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[4]  DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[5]  DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[6]  DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[7]  DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[8]  DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[9]  DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[10] DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[11] DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[12] DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[13] DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[14] DRAM_DQ[0..15]
assignment_group -add_member DRAM_DQ[15] DRAM_DQ[0..15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[15]

set_location_assignment PIN_P2  -to DRAM_ADDR[0]
set_location_assignment PIN_P2  -to DRAM_ADDR0
set_location_assignment PIN_N5  -to DRAM_ADDR[1]
set_location_assignment PIN_N5  -to DRAM_ADDR1
set_location_assignment PIN_N6  -to DRAM_ADDR[2]
set_location_assignment PIN_N6  -to DRAM_ADDR2
set_location_assignment PIN_M8  -to DRAM_ADDR[3]
set_location_assignment PIN_M8  -to DRAM_ADDR3
set_location_assignment PIN_P8  -to DRAM_ADDR[4]
set_location_assignment PIN_P8  -to DRAM_ADDR4
set_location_assignment PIN_T7  -to DRAM_ADDR[5]
set_location_assignment PIN_T7  -to DRAM_ADDR5
set_location_assignment PIN_N8  -to DRAM_ADDR[6]
set_location_assignment PIN_N8  -to DRAM_ADDR6
set_location_assignment PIN_T6  -to DRAM_ADDR[7]
set_location_assignment PIN_T6  -to DRAM_ADDR7
set_location_assignment PIN_R1  -to DRAM_ADDR[8]
set_location_assignment PIN_R1  -to DRAM_ADDR8
set_location_assignment PIN_P1  -to DRAM_ADDR[9]
set_location_assignment PIN_P1  -to DRAM_ADDR9
set_location_assignment PIN_N2  -to DRAM_ADDR[10]
set_location_assignment PIN_N2  -to DRAM_ADDR10
set_location_assignment PIN_N1  -to DRAM_ADDR[11]
set_location_assignment PIN_N1  -to DRAM_ADDR11
set_location_assignment PIN_L4  -to DRAM_ADDR[12]
set_location_assignment PIN_L4  -to DRAM_ADDR12
assignment_group -add_member DRAM_ADDR[0]  DRAM_ADDR[0..12]
assignment_group -add_member DRAM_ADDR[1]  DRAM_ADDR[0..12]
assignment_group -add_member DRAM_ADDR[2]  DRAM_ADDR[0..12]
assignment_group -add_member DRAM_ADDR[3]  DRAM_ADDR[0..12]
assignment_group -add_member DRAM_ADDR[4]  DRAM_ADDR[0..12]
assignment_group -add_member DRAM_ADDR[5]  DRAM_ADDR[0..12]
assignment_group -add_member DRAM_ADDR[6]  DRAM_ADDR[0..12]
assignment_group -add_member DRAM_ADDR[7]  DRAM_ADDR[0..12]
assignment_group -add_member DRAM_ADDR[8]  DRAM_ADDR[0..12]
assignment_group -add_member DRAM_ADDR[9]  DRAM_ADDR[0..12]
assignment_group -add_member DRAM_ADDR[10] DRAM_ADDR[0..12]
assignment_group -add_member DRAM_ADDR[11] DRAM_ADDR[0..12]
assignment_group -add_member DRAM_ADDR[12] DRAM_ADDR[0..12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[12]

#============================================================
# EPCS
#============================================================
set_location_assignment PIN_H2  -to EPCS_DATA0
set_location_assignment PIN_H1  -to EPCS_DCLK
set_location_assignment PIN_D2  -to EPCS_NCSO
set_location_assignment PIN_C1  -to EPCS_ASDO
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to EPCS_DATA0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to EPCS_DCLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to EPCS_NCSO
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to EPCS_ASDO

#============================================================
# Accelerometer and EEPROM
#============================================================
set_location_assignment PIN_F2  -to I2C_SCLK
set_location_assignment PIN_F1  -to I2C_SDAT
set_location_assignment PIN_G5  -to G_SENSOR_CS_N
set_location_assignment PIN_M2  -to G_SENSOR_INT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to I2C_SCLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to I2C_SDAT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to G_SENSOR_CS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to G_SENSOR_INT

#============================================================
# ADC
#============================================================
set_location_assignment PIN_A10 -to ADC_CS_N
set_location_assignment PIN_B10 -to ADC_SADDR
set_location_assignment PIN_B14 -to ADC_SCLK
set_location_assignment PIN_A9  -to ADC_SDAT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_CS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SADDR
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SCLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SDAT

#============================================================
# 2x13 GPIO Header
#============================================================
set_location_assignment PIN_A14 -to GPIO_2_D[0]
set_location_assignment PIN_A14 -to GPIO_2_D0
set_location_assignment PIN_B16 -to GPIO_2_D[1]
set_location_assignment PIN_B16 -to GPIO_2_D1
set_location_assignment PIN_C14 -to GPIO_2_D[2]
set_location_assignment PIN_C14 -to GPIO_2_D2
set_location_assignment PIN_C16 -to GPIO_2_D[3]
set_location_assignment PIN_C16 -to GPIO_2_D3
set_location_assignment PIN_C15 -to GPIO_2_D[4]
set_location_assignment PIN_C15 -to GPIO_2_D4
set_location_assignment PIN_D16 -to GPIO_2_D[5]
set_location_assignment PIN_D16 -to GPIO_2_D5
set_location_assignment PIN_D15 -to GPIO_2_D[6]
set_location_assignment PIN_D15 -to GPIO_2_D6
set_location_assignment PIN_D14 -to GPIO_2_D[7]
set_location_assignment PIN_D14 -to GPIO_2_D7
set_location_assignment PIN_F15 -to GPIO_2_D[8]
set_location_assignment PIN_F15 -to GPIO_2_D8
set_location_assignment PIN_F16 -to GPIO_2_D[9]
set_location_assignment PIN_F16 -to GPIO_2_D9
set_location_assignment PIN_F14 -to GPIO_2_D[10]
set_location_assignment PIN_F14 -to GPIO_2_D10
set_location_assignment PIN_G16 -to GPIO_2_D[11]
set_location_assignment PIN_G16 -to GPIO_2_D11
set_location_assignment PIN_G15 -to GPIO_2_D[12]
set_location_assignment PIN_G15 -to GPIO_2_D12
assignment_group -add_member GPIO_2_D[0] GPIO_2_D[0..12]
assignment_group -add_member GPIO_2_D[1] GPIO_2_D[0..12]
assignment_group -add_member GPIO_2_D[2] GPIO_2_D[0..12]
assignment_group -add_member GPIO_2_D[3] GPIO_2_D[0..12]
assignment_group -add_member GPIO_2_D[4] GPIO_2_D[0..12]
assignment_group -add_member GPIO_2_D[5] GPIO_2_D[0..12]
assignment_group -add_member GPIO_2_D[6] GPIO_2_D[0..12]
assignment_group -add_member GPIO_2_D[7] GPIO_2_D[0..12]
assignment_group -add_member GPIO_2_D[8] GPIO_2_D[0..12]
assignment_group -add_member GPIO_2_D[9] GPIO_2_D[0..12]
assignment_group -add_member GPIO_2_D[10] GPIO_2_D[0..12]
assignment_group -add_member GPIO_2_D[11] GPIO_2_D[0..12]
assignment_group -add_member GPIO_2_D[12] GPIO_2_D[0..12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D[12]

set_location_assignment PIN_E15 -to GPIO_2_D_IN[0]
set_location_assignment PIN_E15 -to GPIO_2_D_IN0
set_location_assignment PIN_E16 -to GPIO_2_D_IN[1]
set_location_assignment PIN_E16 -to GPIO_2_D_IN1
set_location_assignment PIN_M16 -to GPIO_2_D_IN[2]
set_location_assignment PIN_M16 -to GPIO_2_D_IN2
assignment_group -add_member GPIO_2_D_IN[0] GPIO_2_D_IN[0..2]
assignment_group -add_member GPIO_2_D_IN[1] GPIO_2_D_IN[0..2]
assignment_group -add_member GPIO_2_D_IN[2] GPIO_2_D_IN[0..2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D_IN[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D_IN[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_2_D_IN[2]

#============================================================
# GPIO_0 (FPGA4U extension board)
#============================================================
set_location_assignment PIN_D3  -to EXT_CLK_IN
set_location_assignment PIN_C3  -to EXT_CLK_OUT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to EXT_CLK_IN
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to EXT_CLK_OUT

set_location_assignment PIN_A3  -to TP0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TP0

set_location_assignment PIN_B4  -to LED_RESET
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_RESET

set_location_assignment PIN_B5  -to LED_SEL_C_N[0]
set_location_assignment PIN_B5  -to LED_SEL_C_N0
set_location_assignment PIN_A4  -to LED_SEL_C_N[1]
set_location_assignment PIN_A4  -to LED_SEL_C_N1
set_location_assignment PIN_D5  -to LED_SEL_C_N[2]
set_location_assignment PIN_D5  -to LED_SEL_C_N2
set_location_assignment PIN_A5  -to LED_SEL_C_N[3]
set_location_assignment PIN_A5  -to LED_SEL_C_N3
set_location_assignment PIN_A6  -to LED_SEL_C_N[4]
set_location_assignment PIN_A6  -to LED_SEL_C_N4
set_location_assignment PIN_B6  -to LED_SEL_C_N[5]
set_location_assignment PIN_B6  -to LED_SEL_C_N5
set_location_assignment PIN_D6  -to LED_SEL_C_N[6]
set_location_assignment PIN_D6  -to LED_SEL_C_N6
set_location_assignment PIN_B7  -to LED_SEL_C_N[7]
set_location_assignment PIN_B7  -to LED_SEL_C_N7
set_location_assignment PIN_C6  -to LED_SEL_C_N[8]
set_location_assignment PIN_C6  -to LED_SEL_C_N8
set_location_assignment PIN_A7  -to LED_SEL_C_N[9]
set_location_assignment PIN_A7  -to LED_SEL_C_N9
set_location_assignment PIN_E6  -to LED_SEL_C_N[10]
set_location_assignment PIN_E6  -to LED_SEL_C_N10
set_location_assignment PIN_C8  -to LED_SEL_C_N[11]
set_location_assignment PIN_C8  -to LED_SEL_C_N11
assignment_group -add_member LED_SEL_C_N[0]  LED_SEL_C_N[0..11]
assignment_group -add_member LED_SEL_C_N[1]  LED_SEL_C_N[0..11]
assignment_group -add_member LED_SEL_C_N[2]  LED_SEL_C_N[0..11]
assignment_group -add_member LED_SEL_C_N[3]  LED_SEL_C_N[0..11]
assignment_group -add_member LED_SEL_C_N[4]  LED_SEL_C_N[0..11]
assignment_group -add_member LED_SEL_C_N[5]  LED_SEL_C_N[0..11]
assignment_group -add_member LED_SEL_C_N[6]  LED_SEL_C_N[0..11]
assignment_group -add_member LED_SEL_C_N[7]  LED_SEL_C_N[0..11]
assignment_group -add_member LED_SEL_C_N[8]  LED_SEL_C_N[0..11]
assignment_group -add_member LED_SEL_C_N[9]  LED_SEL_C_N[0..11]
assignment_group -add_member LED_SEL_C_N[10] LED_SEL_C_N[0..11]
assignment_group -add_member LED_SEL_C_N[11] LED_SEL_C_N[0..11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_C_N[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_C_N[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_C_N[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_C_N[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_C_N[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_C_N[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_C_N[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_C_N[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_C_N[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_C_N[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_C_N[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_C_N[11]

set_location_assignment PIN_B12 -to SW_LED_A[0]
set_location_assignment PIN_B12 -to SW_LED_A0
set_location_assignment PIN_D12 -to SW_LED_A[1]
set_location_assignment PIN_D12 -to SW_LED_A1
set_location_assignment PIN_D11 -to SW_LED_A[2]
set_location_assignment PIN_D11 -to SW_LED_A2
set_location_assignment PIN_A12 -to SW_LED_A[3]
set_location_assignment PIN_A12 -to SW_LED_A3
set_location_assignment PIN_B11 -to SW_LED_A[4]
set_location_assignment PIN_B11 -to SW_LED_A4
set_location_assignment PIN_C11 -to SW_LED_A[5]
set_location_assignment PIN_C11 -to SW_LED_A5
set_location_assignment PIN_E10 -to SW_LED_A[6]
set_location_assignment PIN_E10 -to SW_LED_A6
set_location_assignment PIN_E11 -to SW_LED_A[7]
set_location_assignment PIN_E11 -to SW_LED_A7
assignment_group -add_member SW_LED_A[0] SW_LED_A[0..7]
assignment_group -add_member SW_LED_A[1] SW_LED_A[0..7]
assignment_group -add_member SW_LED_A[2] SW_LED_A[0..7]
assignment_group -add_member SW_LED_A[3] SW_LED_A[0..7]
assignment_group -add_member SW_LED_A[4] SW_LED_A[0..7]
assignment_group -add_member SW_LED_A[5] SW_LED_A[0..7]
assignment_group -add_member SW_LED_A[6] SW_LED_A[0..7]
assignment_group -add_member SW_LED_A[7] SW_LED_A[0..7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_A[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_A[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_A[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_A[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_A[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_A[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_A[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_A[7]

set_location_assignment PIN_D9  -to SW_LED_B[0]
set_location_assignment PIN_D9  -to SW_LED_B0
set_location_assignment PIN_C9  -to SW_LED_B[1]
set_location_assignment PIN_C9  -to SW_LED_B1
set_location_assignment PIN_E9  -to SW_LED_B[2]
set_location_assignment PIN_E9  -to SW_LED_B2
set_location_assignment PIN_F9  -to SW_LED_B[3]
set_location_assignment PIN_F9  -to SW_LED_B3
set_location_assignment PIN_F8  -to SW_LED_B[4]
set_location_assignment PIN_F8  -to SW_LED_B4
set_location_assignment PIN_E8  -to SW_LED_B[5]
set_location_assignment PIN_E8  -to SW_LED_B5
set_location_assignment PIN_D8  -to SW_LED_B[6]
set_location_assignment PIN_D8  -to SW_LED_B6
set_location_assignment PIN_E7  -to SW_LED_B[7]
set_location_assignment PIN_E7  -to SW_LED_B7
assignment_group -add_member SW_LED_B[0] SW_LED_B[0..7]
assignment_group -add_member SW_LED_B[1] SW_LED_B[0..7]
assignment_group -add_member SW_LED_B[2] SW_LED_B[0..7]
assignment_group -add_member SW_LED_B[3] SW_LED_B[0..7]
assignment_group -add_member SW_LED_B[4] SW_LED_B[0..7]
assignment_group -add_member SW_LED_B[5] SW_LED_B[0..7]
assignment_group -add_member SW_LED_B[6] SW_LED_B[0..7]
assignment_group -add_member SW_LED_B[7] SW_LED_B[0..7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_B[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_B[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_B[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_B[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_B[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_B[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_B[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_LED_B[7]

set_location_assignment PIN_A8  -to BUTTON_N[0]
set_location_assignment PIN_A8  -to BUTTON_N0
set_location_assignment PIN_B8  -to BUTTON_N[1]
set_location_assignment PIN_B8  -to BUTTON_N1
set_location_assignment PIN_A2  -to BUTTON_N[2]
set_location_assignment PIN_A2  -to BUTTON_N2
set_location_assignment PIN_B3  -to BUTTON_N[3]
set_location_assignment PIN_B3  -to BUTTON_N3
assignment_group -add_member BUTTON_N[0] BUTTON_N[0..3]
assignment_group -add_member BUTTON_N[1] BUTTON_N[0..3]
assignment_group -add_member BUTTON_N[2] BUTTON_N[0..3]
assignment_group -add_member BUTTON_N[3] BUTTON_N[0..3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to BUTTON_N[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to BUTTON_N[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to BUTTON_N[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to BUTTON_N[3]

#============================================================
# GPIO_1 (FPGA4U extension board)
#============================================================
set_location_assignment PIN_F13 -to SERIAL_SDA
set_location_assignment PIN_T15 -to SERIAL_SCL
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SERIAL_SDA
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SERIAL_SCL

set_location_assignment PIN_T13 -to TP1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TP1

set_location_assignment PIN_R12 -to LED_SEL_R[0]
set_location_assignment PIN_R12 -to LED_SEL_R0
set_location_assignment PIN_R11 -to LED_SEL_R[1]
set_location_assignment PIN_R11 -to LED_SEL_R1
set_location_assignment PIN_N12 -to LED_SEL_R[2]
set_location_assignment PIN_N12 -to LED_SEL_R2
set_location_assignment PIN_N11 -to LED_SEL_R[3]
set_location_assignment PIN_N11 -to LED_SEL_R3
set_location_assignment PIN_R16 -to LED_SEL_R[4]
set_location_assignment PIN_R16 -to LED_SEL_R4
set_location_assignment PIN_P16 -to LED_SEL_R[5]
set_location_assignment PIN_P16 -to LED_SEL_R5
set_location_assignment PIN_N15 -to LED_SEL_R[6]
set_location_assignment PIN_N15 -to LED_SEL_R6
set_location_assignment PIN_N14 -to LED_SEL_R[7]
set_location_assignment PIN_N14 -to LED_SEL_R7
assignment_group -add_member LED_SEL_R[0] LED_SEL_R[0..7]
assignment_group -add_member LED_SEL_R[1] LED_SEL_R[0..7]
assignment_group -add_member LED_SEL_R[2] LED_SEL_R[0..7]
assignment_group -add_member LED_SEL_R[3] LED_SEL_R[0..7]
assignment_group -add_member LED_SEL_R[4] LED_SEL_R[0..7]
assignment_group -add_member LED_SEL_R[5] LED_SEL_R[0..7]
assignment_group -add_member LED_SEL_R[6] LED_SEL_R[0..7]
assignment_group -add_member LED_SEL_R[7] LED_SEL_R[0..7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_R[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_R[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_R[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_R[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_R[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_R[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_R[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_R[7]

set_location_assignment PIN_T10 -to LED_SEL_G[0]
set_location_assignment PIN_T10 -to LED_SEL_G0
set_location_assignment PIN_R10 -to LED_SEL_G[1]
set_location_assignment PIN_R10 -to LED_SEL_G1
set_location_assignment PIN_N9  -to LED_SEL_G[2]
set_location_assignment PIN_N9  -to LED_SEL_G2
set_location_assignment PIN_K16 -to LED_SEL_G[3]
set_location_assignment PIN_K16 -to LED_SEL_G3
set_location_assignment PIN_P15 -to LED_SEL_G[4]
set_location_assignment PIN_P15 -to LED_SEL_G4
set_location_assignment PIN_N16 -to LED_SEL_G[5]
set_location_assignment PIN_N16 -to LED_SEL_G5
set_location_assignment PIN_L14 -to LED_SEL_G[6]
set_location_assignment PIN_L14 -to LED_SEL_G6
set_location_assignment PIN_L13 -to LED_SEL_G[7]
set_location_assignment PIN_L13 -to LED_SEL_G7
assignment_group -add_member LED_SEL_G[0] LED_SEL_G[0..7]
assignment_group -add_member LED_SEL_G[1] LED_SEL_G[0..7]
assignment_group -add_member LED_SEL_G[2] LED_SEL_G[0..7]
assignment_group -add_member LED_SEL_G[3] LED_SEL_G[0..7]
assignment_group -add_member LED_SEL_G[4] LED_SEL_G[0..7]
assignment_group -add_member LED_SEL_G[5] LED_SEL_G[0..7]
assignment_group -add_member LED_SEL_G[6] LED_SEL_G[0..7]
assignment_group -add_member LED_SEL_G[7] LED_SEL_G[0..7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_G[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_G[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_G[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_G[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_G[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_G[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_G[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_G[7]

set_location_assignment PIN_T11 -to LED_SEL_B[0]
set_location_assignment PIN_T11 -to LED_SEL_B0
set_location_assignment PIN_P11 -to LED_SEL_B[1]
set_location_assignment PIN_P11 -to LED_SEL_B1
set_location_assignment PIN_P9  -to LED_SEL_B[2]
set_location_assignment PIN_P9  -to LED_SEL_B2
set_location_assignment PIN_L16 -to LED_SEL_B[3]
set_location_assignment PIN_L16 -to LED_SEL_B3
set_location_assignment PIN_L15 -to LED_SEL_B[4]
set_location_assignment PIN_L15 -to LED_SEL_B4
set_location_assignment PIN_R14 -to LED_SEL_B[5]
set_location_assignment PIN_R14 -to LED_SEL_B5
set_location_assignment PIN_P14 -to LED_SEL_B[6]
set_location_assignment PIN_P14 -to LED_SEL_B6
set_location_assignment PIN_M10 -to LED_SEL_B[7]
set_location_assignment PIN_M10 -to LED_SEL_B7
assignment_group -add_member LED_SEL_B[0] LED_SEL_B[0..7]
assignment_group -add_member LED_SEL_B[1] LED_SEL_B[0..7]
assignment_group -add_member LED_SEL_B[2] LED_SEL_B[0..7]
assignment_group -add_member LED_SEL_B[3] LED_SEL_B[0..7]
assignment_group -add_member LED_SEL_B[4] LED_SEL_B[0..7]
assignment_group -add_member LED_SEL_B[5] LED_SEL_B[0..7]
assignment_group -add_member LED_SEL_B[6] LED_SEL_B[0..7]
assignment_group -add_member LED_SEL_B[7] LED_SEL_B[0..7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_B[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_B[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_B[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_B[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_B[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_B[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_B[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_SEL_B[7]

set_location_assignment PIN_J16 -to LED_BUTTON[0]
set_location_assignment PIN_J16 -to LED_BUTTON0
set_location_assignment PIN_K15 -to LED_BUTTON[1]
set_location_assignment PIN_K15 -to LED_BUTTON1
set_location_assignment PIN_J13 -to LED_BUTTON[2]
set_location_assignment PIN_J13 -to LED_BUTTON2
set_location_assignment PIN_J14 -to LED_BUTTON[3]
set_location_assignment PIN_J14 -to LED_BUTTON3
assignment_group -add_member LED_BUTTON[0] LED_BUTTON[0..3]
assignment_group -add_member LED_BUTTON[1] LED_BUTTON[0..3]
assignment_group -add_member LED_BUTTON[2] LED_BUTTON[0..3]
assignment_group -add_member LED_BUTTON[3] LED_BUTTON[0..3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_BUTTON[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_BUTTON[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_BUTTON[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED_BUTTON[3]

set_location_assignment PIN_T9  -to JOYSTICKN_N
set_location_assignment PIN_T14 -to JOYSTICKS_N
set_location_assignment PIN_R9  -to JOYSTICKE_N
set_location_assignment PIN_R13 -to JOYSTICKW_N
set_location_assignment PIN_T12 -to JOYSTICKC_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to JOYSTICKN_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to JOYSTICKS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to JOYSTICKE_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to JOYSTICKW_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to JOYSTICKC_N

#============================================================
# Misc
#============================================================
set_location_assignment PIN_H13 -to MSEL[0]
set_location_assignment PIN_H13 -to MSEL0
set_location_assignment PIN_H12 -to MSEL[1]
set_location_assignment PIN_H12 -to MSEL1
set_location_assignment PIN_G12 -to MSEL[2]
set_location_assignment PIN_G12 -to MSEL2
assignment_group -add_member MSEL[0] MSEL[0..2]
assignment_group -add_member MSEL[1] MSEL[0..2]
assignment_group -add_member MSEL[2] MSEL[0..2]

set_location_assignment PIN_J3  -to nCE
set_location_assignment PIN_H5  -to nCONFIG
set_location_assignment PIN_F4  -to nSTATUS
set_location_assignment PIN_H14 -to CONF_DONE

#============================================================
# JTAG
#============================================================
set_location_assignment PIN_H3  -to TCK
set_location_assignment PIN_H4  -to TDI
set_location_assignment PIN_J4  -to TDO
set_location_assignment PIN_J5  -to TMS
