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
	.export		_system

; ---------------------------------------------------------------
; int __near__ __fastcall__ system (__near__ const unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_system: near

.segment	"CODE"

	jsr     pushax
	lda     (sp)
	ldy     #$01
	ora     (sp),y
	bne     L0002
	tax
	jmp     incsp2
L0002:	ldx     #$FF
	txa
	jmp     incsp2

.endproc

