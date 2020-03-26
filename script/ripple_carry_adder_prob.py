pa=float(input('Inserire pa'))
pb=float(input('Inserire pb'))
p_cin=0

#for a single FA
ps= (pa)*(1-pb)*(1-p_cin)+(1-pa)*(pb)*(1-p_cin)+(1-pa)*(1-pb)*p_cin+pa*pb*p_cin
p_cout= pb*p_cin*(1-pa)+pa*p_cin*(1-pb)+pa*pb*(1-p_cin)+pa*pb*p_cin
pa= 2*(ps)*(1-ps)
print("partial_s_out 1= "+str(ps))

for i in range(1,8):
    p_cin=p_cout
    p_cout= pb*p_cin*(1-pa)+pa*p_cin*(1-pb)+pa*pb*(1-p_cin)+pa*pb*p_cin
    ps= (pa)*(1-pb)*(1-p_cin)+(1-pa)*(pb)*(1-p_cin)+(1-pa)*(1-pb)*p_cin+pa*pb*p_cin
    print("partial_s_out "+str(i+1)+"= "+str(ps))
    
ps= (pa)*(1-pb)*(1-p_cin)+(1-pa)*(pb)*(1-p_cin)+(1-pa)*(1-pb)*p_cin+pa*pb*p_cin
print(ps)
pa= 2*(ps)*(1-ps)
print(pa)
