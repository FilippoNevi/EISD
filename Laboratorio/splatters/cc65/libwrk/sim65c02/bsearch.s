;
; File generated by cc65 v 2.17 - Git 582aa41
;
	.fopt		compiler,"cc65 v 2.17 - Git 582aa41"
	.setcpu		"65C02"
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
	jmp     L001A
L0005:	ldy     #$03
	jsr     ldaxysp
	clc
	adc     (sp)
	pha
	txa
	ldy     #$01
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
	ina
	bne     L0016
	inx
L0016:	ldy     #$02
	bra     L0026
L0012:	ldy     #$09
	jsr     ldaxysp
	jsr     decax1
	jsr     stax0sp
	ldy     #$06
	lda     (sp),y
	iny
	ora     (sp),y
	bne     L001A
	tax
	ina
	ldy     #$04
L0026:	jsr     staxysp
L001A:	ldy     #$05
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
	beq     L0021
	ldy     #$13
	jsr     pushwysp
	ldy     #$07
	jsr     pushwysp
	ldy     #$11
	jsr     ldaxysp
	jsr     tosumulax
	jsr     tosaddax
	bra     L0001
L0021:	tax
L0001:	ldy     #$14
	jmp     addysp

.endproc

