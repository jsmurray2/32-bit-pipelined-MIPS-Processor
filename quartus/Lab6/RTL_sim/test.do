restart -f
delete wave *
do wave.do

force MIPSclock 0 0 ns, 1 10 ns -r 20 ns
force reset_n 0 0ns, 1 40 ns 
run 1500 ns