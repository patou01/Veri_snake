transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Patrick/Dropbox/fpga/veri_snack {C:/Users/Patrick/Dropbox/fpga/veri_snack/screen_driver.v}
vlog -sv -work work +incdir+C:/Users/Patrick/Dropbox/fpga/veri_snack {C:/Users/Patrick/Dropbox/fpga/veri_snack/clock_disp.v}
vlog -sv -work work +incdir+C:/Users/Patrick/Dropbox/fpga/veri_snack {C:/Users/Patrick/Dropbox/fpga/veri_snack/snk2leds.v}
vlog -sv -work work +incdir+C:/Users/Patrick/Dropbox/fpga/veri_snack/db {C:/Users/Patrick/Dropbox/fpga/veri_snack/db/clock_disp_altpll.v}

