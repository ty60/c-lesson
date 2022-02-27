target remote localhost:1234
b *0x10000
commands
x/24i $pc
end
c
