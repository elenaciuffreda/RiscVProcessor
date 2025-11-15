############################################################
# Selection Sort (RARS compatibile)
# Ordina un array di interi in ordine crescente
############################################################

.data
array:  .word 9, 5, 2, 7, 1
n:      .word 5

.text
main:
    la s0, array      # s0 = indirizzo base array
    la s2, n          # s2 = indirizzo di n
    lw s1, 0(s2)      # s1 = dimensione array
    addi s1, s1, -1   # s1 = n - 1 (passaggi esterni)
    li t0, 0          # i = 0

outer_loop:
    bge t0, s1, end_sort   # se i >= n-1 ? fine

    mv t1, t0              # min_index = i
    addi t2, t0, 1         # j = i + 1

inner_loop:
    lw t3, 0(s2)           # t3 = n
    bge t2, t3, check_swap # se j >= n ? esci inner

    # array[j]
    slli t4, t2, 2
    add t5, s0, t4
    lw t6, 0(t5)

    # array[min_index]
    slli s3, t1, 2
    add s4, s0, s3
    lw s5, 0(s4)

    blt t6, s5, update_min
    j skip_update

update_min:
    mv t1, t2              # min_index = j

skip_update:
    addi t2, t2, 1
    j inner_loop

check_swap:
    beq t1, t0, next_i     # se min_index == i ? niente swap

    # swap array[i] e array[min_index]
    slli t4, t0, 2
    add t5, s0, t4
    lw t6, 0(t5)

    slli s3, t1, 2
    add s4, s0, s3
    lw s5, 0(s4)

    sw s5, 0(t5)
    sw t6, 0(s4)

next_i:
    addi t0, t0, 1
    j outer_loop

end_sort:
    nop
