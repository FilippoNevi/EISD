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
	.import		_cbm_k_save
	.import		_cbm_k_setlfs
	.import		_cbm_k_setnam
	.export		_cbm_save
	.import		__oserror

; ---------------------------------------------------------------
; unsigned char __near__ __fastcall__ cbm_save (__near__ const unsigned char *, unsigned char, __near__ const void *, unsigned int)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_cbm_save: near

.segment	"CODE"

	jsr     pushax
	lda     #$00
	jsr     pusha
	ldy     #$05
	lda     (sp),y
	jsr     pusha
	lda     #$00
	jsr     _cbm_k_setlfs
	ldy     #$06
	jsr     ldaxysp
	jsr     _cbm_k_setnam
	ldy     #$05
	jsr     pushwysp
	ldy     #$03
	jsr     ldaxysp
	clc
	ldy     #$04
	adc     (sp),y
	pha
	txa
	iny
	adc     (sp),y
	tax
	pla
	jsr     _cbm_k_save
	sta     __oserror
	jmp     incsp7

.endproc
