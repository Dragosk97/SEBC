do mnp.do gray_DATA grayencoder.vhd tb_encdec_gray_DATA.v
do power_report.do gray_DATA
quit -sim
project close
do mnp.do gray_ADDRESS grayencoder.vhd tb_encdec_gray_ADDRESS.v
do power_report.do gray_ADDRESS
quit -sim
project close
