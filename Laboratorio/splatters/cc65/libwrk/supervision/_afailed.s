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
	.import		_stderr
	.import		_fprintf
	.import		_exit
	.export		__afailed

.segment	"RODATA"

L0004:
	.byte	$41,$53,$53,$45,$52,$54,$49,$4F,$4E,$20,$46,$41,$49,$4C,$45,$44
	.byte	$20,$49,$4E,$20,$25,$73,$28,$25,$75,$29,$0A,$00

; ---------------------------------------------------------------
; void __near__ __fastcall__ _afailed (__near__ unsigned char *, unsigned int)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	__afailed: near

.segment	"CODE"

	jsr     pushax
	lda     _stderr
	ldx     _stderr+1
	jsr     pushax
	lda     #<(L0004)
	ldx     #>(L0004)
	jsr     pushax
	ldy     #$09
	jsr     pushwysp
	ldy     #$09
	jsr     pushwysp
	ldy     #$08
	jsr     _fprintf
	ldx     #$00
	lda     #$02
	jsr     _exit
	jmp     incsp4

.endproc

