;
; File generated by cc65 v 2.17 - Git 582aa41
;
	.fopt		compiler,"cc65 v 2.17 - Git 582aa41"
	.setcpu		"65SC02"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.export		_fsetpos
	.import		_fseek

; ---------------------------------------------------------------
; int __near__ __fastcall__ fsetpos (__near__ struct _FILE *, __near__ const unsigned long *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_fsetpos: near

.segment	"CODE"

	jsr     pushax
	ldy     #$05
	jsr     pushwysp
	ldy     #$03
	jsr     ldaxysp
	jsr     ldeaxi
	jsr     pusheax
	ldx     #$00
	lda     #$02
	jsr     _fseek
	jmp     incsp4

.endproc

