do mnp.do busT0_DATA busT0.vhd tb_encdec_busT0_DATA.v
do power_report.do busT0_DATA
quit -sim
project close
do mnp.do transbased_ADDRESS busT0.vhd tb_encdec_busT0_ADDRESS.v
do power_report.do busT0_ADDRESS
quit -sim
project close
