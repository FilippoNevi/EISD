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
	.import		_free
	.import		_close
	.export		_closedir

; ---------------------------------------------------------------
; int __near__ __fastcall__ closedir (__near__ struct DIR *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_closedir: near

.segment	"CODE"

	jsr     pushax
	jsr     decsp2
	ldy     #$03
	jsr     ldaxysp
	jsr     ldaxi
	jsr     _close
	jsr     stax0sp
	ldy     #$03
	jsr     ldaxysp
	jsr     _free
	jsr     ldax0sp
	jmp     incsp4

.endproc

