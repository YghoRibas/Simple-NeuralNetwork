.LC3:
.asciiz  "Digite um numero: \000"
.LC4:
.asciiz  "%d\000"
.LC5:
.asciiz  "Sua soma eh: %lf\000"
main:
daddiu  $sp,$sp,-80
sd      $31,72($sp)
sd      $fp,64($sp)
sd      $28,56($sp)
move    $fp,$sp
lui     $28,%hi(%neg(%gp_rel(main)))
daddu   $28,$28,$25
daddiu  $28,$28,%lo(%neg(%gp_rel(main)))
ld      $2,%got_page(.LC0)($28)
ldc1    $f0,%got_ofst(.LC0)($2)
sdc1    $f0,16($fp)
ld      $2,%got_page(.LC1)($28)
ldc1    $f0,%got_ofst(.LC1)($2)
sdc1    $f0,24($fp)
ld      $2,%got_page(.LC2)($28)
ldc1    $f0,%got_ofst(.LC2)($2)
sdc1    $f0,32($fp)
sd      $0,0($fp)
ld      $2,%got_page(.LC3)($28)
daddiu  $4,$2,%got_ofst(.LC3)
ld      $2,%call16(printf)($28)
move    $25,$2
nop

daddiu  $2,$fp,40
move    $5,$2
ld      $2,%got_page(.LC4)($28)
daddiu  $4,$2,%got_ofst(.LC4)
ld      $2,%call16(scanf)($28)
move    $25,$2
nop

sw      $0,8($fp)
b       .L2
nop

.L3:
lw      $2,8($fp)
dsll    $2,$2,3
daddu   $2,$fp,$2
ldc1    $f0,16($2)
ldc1    $f1,0($fp)
add.d   $f0,$f1,$f0
sdc1    $f0,0($fp)
lw      $2,8($fp)
addiu   $2,$2,1
sw      $2,8($fp)
.L2:
lw      $2,8($fp)
sltu    $2,$2,3
bne     $2,$0,.L3
nop

ld      $5,0($fp)
ld      $2,%got_page(.LC5)($28)
daddiu  $4,$2,%got_ofst(.LC5)
ld      $2,%call16(printf)($28)
move    $25,$2
nop

move    $2,$0
move    $sp,$fp
ld      $31,72($sp)
ld      $fp,64($sp)
ld      $28,56($sp)
daddiu  $sp,$sp,80
j       $31
nop

.LC0:
.word   3098555708
.word   1072322732
.LC1:
.word   1349276689
.word   1072822564
.LC2:
.word   3610862156
.word   1072749162