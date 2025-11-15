.text
main:
    # base RAM = 0x1000
    li x8, 0x10010000 # x8 = base array (s0)

    # inizializzazione array [9,5,2,7,1]
    li x5, 9          # t0
    sw x5, 0(x8)

    li x5, 5
    sw x5, 4(x8)

    li x5, 2
    sw x5, 8(x8)

    li x5, 7
    sw x5, 12(x8)

    li x5, 1
    sw x5, 16(x8)

    li x9, 5          # x9 = n (s1)
    addi x9, x9, -1   # x9 = n-1

    li x5, 0          # t0 = i = 0

outer_loop:
    bge x5, x9, end

    mv x6, x5         # x6 = t1 = min_index
    addi x7, x5, 1    # x7 = t2 = j = i+1

inner_loop:
    li x10, 5         # x10 = n
    bge x7, x10, check_swap

    # array[j]
    slli x11, x7, 2       # x11 = offset j
    add x12, x8, x11      # x12 = &array[j]
    lw x13, 0(x12)        # x13 = array[j]

    # array[min_index]
    slli x14, x6, 2       # x14 = offset min_index
    add x15, x8, x14      # x15 = &array[min_index]
    lw x16, 0(x15)        # x16 = array[min_index]

    blt x13, x16, update_min
    j skip_update

update_min:
    mv x6, x7             # min_index = j

skip_update:
    addi x7, x7, 1
    j inner_loop

check_swap:
    beq x6, x5, next_i

    # swap array[i] <-> array[min_index]
    slli x11, x5, 2
    add x12, x8, x11
    lw x13, 0(x12)

    slli x14, x6, 2
    add x15, x8, x14
    lw x16, 0(x15)

    sw x16, 0(x12)
    sw x13, 0(x15)

next_i:
    addi x5, x5, 1
    j outer_loop

end:
    j end
