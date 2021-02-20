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
	.import		__cbm_filetype
	.import		_cbm_k_basin
	.import		_cbm_k_chkin
	.import		_cbm_k_clrch
	.import		_cbm_k_readst
	.import		_cbm_open
	.import		_cbm_close
	.export		_cbm_opendir
	.export		_cbm_readdir
	.export		_cbm_closedir
	.import		__oserror

.segment	"RODATA"

L0003:
	.byte	$24,$00

; ---------------------------------------------------------------
; unsigned char __near__ cbm_opendir (unsigned char, unsigned char)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cbm_opendir: near

.segment	"CODE"

	jsr     enter
	jsr     decsp2
	lda     #<(L0003)
	ldx     #>(L0003)
	jsr     pushax
	ldy     #$04
	lda     (sp),y
	cmp     #$04
	bne     L00B3
	jsr     leaa0sp
	jsr     incax3
	ldy     #$02
	jsr     staxysp
	ldx     #$00
	lda     #$02
	tay
	jsr     subeqysp
	jsr     ldaxi
	jsr     stax0sp
	ldy     #$04
L00B3:	lda     (sp),y
	jsr     leaa0sp
	jsr     incax4
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	jsr     pusha
	ldy     #$05
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax4
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	jsr     pusha
	lda     #$00
	jsr     pusha
	ldy     #$04
	jsr     ldaxysp
	jsr     _cbm_open
	cmp     #$00
	bne     L0020
	ldy     #$04
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax4
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	jsr     _cbm_k_chkin
	sta     __oserror
	cmp     #$00
	bne     L0020
	jsr     _cbm_k_basin
	jsr     _cbm_k_basin
	jsr     _cbm_k_clrch
	jsr     _cbm_k_readst
	tax
	beq     L00B4
	ldy     #$04
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax4
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	jsr     _cbm_close
	lda     #$04
	sta     __oserror
L0020:	ldx     #$00
L00B4:	lda     __oserror
	ldy     #$04
	jmp     leavey

.endproc

; ---------------------------------------------------------------
; unsigned char __near__ __fastcall__ cbm_readdir (unsigned char, register __near__ struct cbm_dirent *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cbm_readdir: near

.segment	"RODATA"

L0044:
	.word	$0000
L0051:
	.word	$0000
L005E:
	.word	$0000
L0081:
	.word	$0000
L00A7:
	.word	$0000
L00AC:
	.word	$0000

.segment	"CODE"

	jsr     pushax
	ldy     #$00
	ldx     #$04
	jsr     regswap2
	jsr     decsp1
	lda     #$00
	jsr     pusha
	jsr     pusha
	lda     #$01
	jsr     pusha
	ldy     #$06
	lda     (sp),y
	jsr     _cbm_k_chkin
	tax
	jne     L002E
	jsr     _cbm_k_readst
	tax
	jne     L002E
	jsr     _cbm_k_basin
	jsr     _cbm_k_basin
	lda     regbank+4
	ldx     regbank+4+1
	jsr     pushax
	jsr     _cbm_k_basin
	jsr     pushax
	jsr     _cbm_k_basin
	tax
	lda     #$00
	jsr     tosorax
	ldy     #$11
	jsr     staxspidx
	jsr     _cbm_k_basin
	ldy     #$03
	sta     (sp),y
	cmp     #$12
	beq     L00B9
	cmp     #$42
	beq     L003E
	jmp     L00BB
L003C:	jsr     _cbm_k_basin
L003E:	jsr     _cbm_k_readst
	tax
	beq     L003C
	lda     #$02
	jmp     L00C1
L00B9:	lda     #$01
	tay
	jmp     L00B8
L0049:	jsr     _cbm_k_readst
	tax
	beq     L004D
	lda     #$03
	jmp     L00C1
L004D:	jsr     _cbm_k_basin
	ldy     #$03
L00B8:	sta     (sp),y
	ldy     #$03
L00BB:	lda     (sp),y
	cmp     #$22
	bne     L0049
	jmp     L005F
L0054:	jsr     _cbm_k_readst
	tax
	beq     L005A
	lda     #$04
	jmp     L00C1
L005A:	ldy     #$02
	lda     (sp),y
	cmp     #$10
	bcs     L005F
	clc
	adc     regbank+4
	ldx     regbank+4+1
	bcc     L00B5
	inx
L00B5:	sta     ptr1
	stx     ptr1+1
	iny
	lda     (sp),y
	ldy     #$00
	sta     (ptr1),y
	ldy     #$02
	clc
	lda     #$01
	adc     (sp),y
	sta     (sp),y
L005F:	jsr     _cbm_k_basin
	ldy     #$03
	sta     (sp),y
	cmp     #$22
	bne     L0054
	dey
	lda     (sp),y
	clc
	adc     regbank+4
	ldx     regbank+4+1
	bcc     L00B6
	inx
L00B6:	sta     ptr1
	stx     ptr1+1
	lda     #$00
	tay
	sta     (ptr1),y
	iny
	lda     (sp),y
	beq     L007D
	lda     #$05
	ldy     #$13
	sta     (regbank+4),y
	lda     #$06
	ldy     #$02
	sta     (sp),y
L006F:	lda     regbank+4
	ldx     regbank+4+1
	jsr     pushax
	jsr     _cbm_k_basin
	ldy     #$05
	sta     (sp),y
	ldy     #$14
	jsr     staspidx
	ldy     #$02
	lda     (sp),y
	sec
	sbc     #$01
	sta     (sp),y
	cmp     #$00
	bne     L006F
	jmp     L00A1
L0077:	jsr     _cbm_k_readst
	tax
	beq     L007D
	lda     #$05
	jmp     L00C1
L007D:	jsr     _cbm_k_basin
	ldy     #$03
	sta     (sp),y
	cmp     #$20
	beq     L0077
	tya
	ldy     #$14
	sta     (regbank+4),y
	tay
	lda     (sp),y
	cmp     #$2A
	bne     L0084
	lda     #$02
	ldy     #$14
	sta     (regbank+4),y
	jsr     _cbm_k_basin
	ldy     #$03
	sta     (sp),y
L0084:	lda     regbank+4
	ldx     regbank+4+1
	jsr     pushax
	ldy     #$05
	lda     (sp),y
	jsr     __cbm_filetype
	ldy     #$13
	jsr     staspidx
	jsr     _cbm_k_basin
	cmp     #$49
	bne     L008D
	ldy     #$03
	lda     (sp),y
	cmp     #$44
	bne     L008D
	lda     #$02
	ldy     #$13
	sta     (regbank+4),y
L008D:	jsr     _cbm_k_basin
	jsr     _cbm_k_basin
	ldy     #$03
	sta     (sp),y
	cmp     #$3C
	bne     L00C0
	ldy     #$14
	lda     (regbank+4),y
	cmp     #$02
	bne     L00BD
	lda     #$00
	jmp     L00BF
L00BD:	lda     #$01
L00BF:	sta     (regbank+4),y
	jmp     L00A1
L009F:	jsr     _cbm_k_readst
	tax
	beq     L00A3
	lda     #$06
	jmp     L00C1
L00A3:	jsr     _cbm_k_basin
	ldy     #$03
	sta     (sp),y
L00A1:	ldy     #$03
L00C0:	lda     (sp),y
	bne     L009F
L00C1:	ldy     #$00
	sta     (sp),y
L002E:	jsr     _cbm_k_clrch
	ldx     #$00
	lda     (sp,x)
	pha
	ldy     #$04
	lda     (sp),y
	sta     regbank+4
	iny
	lda     (sp),y
	sta     regbank+5
	pla
	jmp     incsp7

.endproc

; ---------------------------------------------------------------
; void __near__ __fastcall__ cbm_closedir (unsigned char)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cbm_closedir: near

.segment	"CODE"

	jsr     pusha
	ldy     #$00
	lda     (sp),y
	jsr     _cbm_close
	jmp     incsp1

.endproc
