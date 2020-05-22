do mnp.do businv_DATA businvbeh.vhd tb_encdec_businv_DATA.v
do power_report.do BUSINV_DATA
quit -sim
project close
do mnp.do businv_ADDRESS businvbeh.vhd tb_encdec_businv_ADDRESS.v
do power_report.do BUSINV_ADDRESS
quit -sim
project close
