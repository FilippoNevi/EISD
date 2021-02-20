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
	.export		_bsearch

; ---------------------------------------------------------------
; __near__ void * __near__ __fastcall__ bsearch (__near__ const void *, __near__ const void *, unsigned int, unsigned int, __near__ __near__ __fastcall__ function returning int *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_bsearch: near

.segment	"CODE"

	jsr     pushax
	jsr     decsp4
	jsr     push0
	jsr     push0
	ldy     #$0D
	jsr     ldaxysp
	jsr     decax1
	jsr     pushax
	jmp     L0019
L0005:	ldy     #$03
	jsr     ldaxysp
	clc
	ldy     #$00
	adc     (sp),y
	pha
	txa
	iny
	adc     (sp),y
	tax
	pla
	jsr     asrax1
	ldy     #$08
	jsr     staxysp
	ldy     #$0D
	jsr     pushwysp
	ldy     #$15
	jsr     pushwysp
	ldy     #$0F
	jsr     pushwysp
	ldy     #$13
	jsr     ldaxysp
	jsr     tosumulax
	jsr     tosaddax
	jsr     pushax
	ldy     #$17
	jsr     ldaxysp
	pha
	ldy     #$02
	lda     (sp),y
	sta     jmpvec+1
	iny
	lda     (sp),y
	sta     jmpvec+2
	pla
	jsr     jmpvec
	jsr     incsp2
	ldy     #$06
	jsr     staxysp
	cpx     #$80
	bcc     L0012
	ldy     #$09
	jsr     ldaxysp
	jsr     incax1
	ldy     #$02
	jmp     L0025
L0012:	ldy     #$09
	jsr     ldaxysp
	jsr     decax1
	jsr     stax0sp
	ldy     #$06
	lda     (sp),y
	iny
	ora     (sp),y
	bne     L0019
	tax
	lda     #$01
	ldy     #$04
L0025:	jsr     staxysp
L0019:	ldy     #$05
	jsr     pushwysp
	ldy     #$03
	jsr     ldaxysp
	jsr     tosicmp
	jmi     L0005
	jeq     L0005
	ldy     #$05
	lda     (sp),y
	dey
	ora     (sp),y
	beq     L0020
	ldy     #$13
	jsr     pushwysp
	ldy     #$07
	jsr     pushwysp
	ldy     #$11
	jsr     ldaxysp
	jsr     tosumulax
	jsr     tosaddax
	jmp     L0001
L0020:	tax
L0001:	ldy     #$14
	jmp     addysp

.endproc
