;
; File generated by cc65 v 2.17 - Git 582aa41
;
	.fopt		compiler,"cc65 v 2.17 - Git 582aa41"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.import		__errno
	.import		__cbm_filetype
	.export		_readdir
	.import		__dirread
	.import		__dirread1

; ---------------------------------------------------------------
; __near__ struct dirent * __near__ __fastcall__ readdir (register __near__ struct DIR *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_readdir: near

.segment	"RODATA"

L0011:
	.word	$0000
L0018:
	.word	$0000
L0029:
	.word	$0000
L0032:
	.word	$0000

.segment	"BSS"

L0005:
	.res	1,$00
L0006:
	.res	1,$00
L0008:
	.res	23,$00

.segment	"CODE"

	jsr     pushax
	ldy     #$00
	ldx     #$04
	jsr     regswap2
	lda     regbank+2
	ldx     regbank+3
	jsr     pushax
	lda     regbank+1
	jsr     pusha
	lda     regbank+0
	jsr     pusha
	ldy     #$40
	jsr     subysp
	ldy     #$03
	lda     (regbank+4),y
	sta     L0008+17+1
	dey
	lda     (regbank+4),y
	sta     L0008+17
	lda     regbank+4
	ldx     regbank+4+1
	jsr     pushax
	lda     #$02
	jsr     leaa0sp
	jsr     pushax
	lda     #$02
	jsr     __dirread
	tax
	jeq     L0004
	lda     regbank+4
	ldx     regbank+4+1
	jsr     pushax
	lda     #<(L0008+19)
	ldx     #>(L0008+19)
	jsr     pushax
	lda     #$02
	jsr     __dirread
	tax
	jeq     L0004
	lda     #$00
	sta     regbank+0
	lda     sp+1
	sta     regbank+2+1
	lda     sp
	sta     regbank+2
L0019:	lda     regbank+0
	cmp     #$40
	bcs     L001A
	lda     regbank+4
	ldx     regbank+4+1
	jsr     pushax
	lda     regbank+2
	ldx     regbank+2+1
	jsr     __dirread1
	tax
	jeq     L0004
	inc     regbank+0
	ldy     #$00
	lda     (regbank+2),y
	beq     L001A
	inc     regbank+2
	bne     L0019
	inc     regbank+2+1
	jmp     L0019
L001A:	ldy     #$03
	lda     (regbank+4),y
	tax
	dey
	lda     (regbank+4),y
	sta     ptr1
	stx     ptr1+1
	ldx     #$00
	lda     regbank+0
	jsr     incax4
	clc
	adc     ptr1
	pha
	txa
	adc     ptr1+1
	tax
	pla
	ldy     #$02
	sta     (regbank+4),y
	iny
	txa
	sta     (regbank+4),y
	ldx     #$00
	lda     (sp,x)
	cmp     #$42
	jeq     L008E
	txa
	sta     regbank+1
	sta     L0006
	sta     L0005
	lda     sp+1
	sta     regbank+2+1
	lda     sp
	sta     regbank+2
	jmp     L008D
L0088:	lda     L0005
	beq     L0043
	cmp     #$01
	beq     L0049
	cmp     #$02
	beq     L0064
	cmp     #$03
	jeq     L0071
	jmp     L008C
L0043:	lda     (regbank+2,x)
	cmp     #$22
	jne     L008C
	lda     #$01
	sta     L0005
	jmp     L008C
L0049:	ldy     #$00
	lda     (regbank+2),y
	cmp     #$22
	bne     L008A
	ldy     L0006
	txa
	sta     L0008,y
	lda     L0006
	sta     L0008+22
	lda     L0008+17
	cmp     #$03
	lda     L0008+17+1
	sbc     #$00
	bcc     L0089
	lda     #$02
	sta     L0005
	jmp     L008C
L0089:	lda     #$05
	sta     L0008+21
	lda     #<(L0008)
	ldx     #>(L0008)
	jmp     L0004
L008A:	lda     L0006
	cmp     #$10
	bcs     L008C
	lda     #<(L0008)
	ldx     #>(L0008)
	clc
	adc     L0006
	bcc     L0060
	inx
L0060:	sta     ptr1
	stx     ptr1+1
	lda     (regbank+2),y
	sta     (ptr1),y
	inc     L0006
	jmp     L008C
L0064:	lda     (regbank+2,x)
	cmp     #$20
	beq     L008C
	jsr     __cbm_filetype
	sta     L0008+21
	ldy     #$00
	lda     (regbank+2),y
	cmp     #$44
	bne     L006A
	lda     #$03
	sta     L0005
	jmp     L008C
L006A:	lda     #<(L0008)
	ldx     #>(L0008)
	jmp     L0004
L0071:	lda     (regbank+2,x)
	cmp     #$45
	beq     L0074
	cmp     #$49
	bne     L008B
	lda     #$02
	jmp     L0087
L008B:	lda     #$04
L0087:	sta     L0008+21
L0074:	lda     #<(L0008)
	ldx     #>(L0008)
	jmp     L0004
L008C:	inc     regbank+1
	inc     regbank+2
	bne     L0081
	inc     regbank+2+1
L0081:	ldx     #$00
L008D:	lda     regbank+1
	cmp     regbank+0
	jcc     L0088
	lda     #$0B
	sta     __errno
	stx     __errno+1
L008E:	txa
L0004:	pha
	stx     tmp1
	ldy     #$45
	ldx     #$05
L0086:	lda     (sp),y
	sta     regbank+0,x
	dey
	dex
	bpl     L0086
	ldx     tmp1
	pla
	ldy     #$46
	jmp     addysp

.endproc
