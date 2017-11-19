restart -f
delete wave * 
add wave codelock/clk
add wave codelock/k
add wave codelock/r
add wave codelock/q
add wave codelock/unlock 
force codelock/clk 1 0ns, 0 12ns -repeat 24ns
force codelock/k 000
force codelock/r 0000
run 100ns
force codelock/k 001
force codelock/r 0001
run 30ns
force codelock/k 000
force codelock/r 0000
run 100ns
force codelock/k 010
force codelock/r 0100
run 30ns
force codelock/k 000
force codelock/r 0000
run 800ns