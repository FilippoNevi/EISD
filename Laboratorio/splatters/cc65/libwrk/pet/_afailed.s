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
	.import		_stderr
	.import		_fprintf
	.import		_exit
	.export		__afailed

.segment	"RODATA"

L0004:
	.byte	$C1,$D3,$D3,$C5,$D2,$D4,$C9,$CF,$CE,$20,$C6,$C1,$C9,$CC,$C5,$C4
	.byte	$20,$C9,$CE,$20,$25,$53,$28,$25,$55,$29,$0D,$00

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

