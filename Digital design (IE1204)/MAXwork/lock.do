restart -f
vsim -msgmode both -displaymsgmode both codelock
delete wave * 
add wave codelock/clk
add wave codelock/k
add wave codelock/r
add wave codelock/q
add wave codelock/unlock 
force codelock/clk 1 0ns, 0 10ns -repeat 20ns
force codelock/k 000
force codelock/r 0000


run 20ns
force codelock/k 001
force codelock/r 0010

run 20ns
force codelock/k 000
force codelock/r 0000

run 20ns
force codelock/k 001
force codelock/r 0010

run 20ns
force codelock/k 000
force codelock/r 0000

run 20ns
force codelock/k 001
force codelock/r 0100

run 20ns
force codelock/k 000
force codelock/r 0000

run 20ns
force codelock/k 001
force codelock/r 0100

run 20ns
force codelock/k 000
force codelock/r 0000

run 800ns