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
	.export		_fputs
	.import		_strlen
	.import		_write

; ---------------------------------------------------------------
; int __near__ __fastcall__ fputs (__near__ const unsigned char *, register __near__ struct _FILE *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_fputs: near

.segment	"CODE"

	jsr     pushax
	ldy     #$00
	ldx     #$04
	jsr     regswap2
	ldy     #$01
	lda     (regbank+4),y
	and     #$01
	beq     L0011
	lda     (regbank+4),y
	and     #$06
	beq     L0003
L0011:	ldx     #$FF
	txa
	jmp     L0002
L0003:	dey
	lda     (regbank+4),y
	jsr     pusha0
	ldy     #$07
	jsr     pushwysp
	ldy     #$07
	jsr     ldaxysp
	jsr     _strlen
	jsr     _write
L0002:	pha
	ldy     #$00
	lda     (sp),y
	sta     regbank+4
	iny
	lda     (sp),y
	sta     regbank+5
	pla
	jmp     incsp4

.endproc
