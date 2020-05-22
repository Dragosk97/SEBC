do mnp.do transbased_DATA transbased.vhd tb_encdec_transbased_DATA.v
do power_report.do transbased_DATA
quit -sim
project close
do mnp.do transbased_ADDRESS transbased.vhd tb_encdec_transbased_ADDRESS.v
do power_report.do transbased_ADDRESS
quit -sim
project close
