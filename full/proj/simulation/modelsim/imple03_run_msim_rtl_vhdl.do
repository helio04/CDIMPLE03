transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/Engenharia/2024.2/CD/CDIMPLE03/full/proj/displays.vhd}
vcom -93 -work work {D:/Engenharia/2024.2/CD/CDIMPLE03/full/proj/mux_4x1.vhd}
vcom -93 -work work {D:/Engenharia/2024.2/CD/CDIMPLE03/full/proj/leds.vhd}
vcom -93 -work work {D:/Engenharia/2024.2/CD/CDIMPLE03/full/proj/FSM_Cofre.vhd}
vcom -93 -work work {D:/Engenharia/2024.2/CD/CDIMPLE03/full/proj/conversor.vhd}
vcom -93 -work work {D:/Engenharia/2024.2/CD/CDIMPLE03/full/proj/imple03.vhd}

