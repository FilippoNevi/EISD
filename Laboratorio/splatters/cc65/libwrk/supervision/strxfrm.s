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
	.import		_strlen
	.import		_strncpy
	.export		_strxfrm

; ---------------------------------------------------------------
; unsigned int __near__ __fastcall__ strxfrm (__near__ unsigned char *, __near__ const unsigned char *, unsigned int)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_strxfrm: near

.segment	"CODE"

	jsr     pushax
	ldy     #$07
	jsr     pushwysp
	ldy     #$07
	jsr     pushwysp
	ldy     #$05
	jsr     ldaxysp
	jsr     _strncpy
	ldy     #$03
	jsr     ldaxysp
	jsr     _strlen
	jmp     incsp6

.endproc

