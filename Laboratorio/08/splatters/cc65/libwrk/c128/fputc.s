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
	.export		_fputc
	.import		_write

; ---------------------------------------------------------------
; int __near__ __fastcall__ fputc (int, register __near__ struct _FILE *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_fputc: near

.segment	"RODATA"

L000C:
	.word	$0000

.segment	"CODE"

	jsr     pushax
	ldy     #$00
	ldx     #$04
	jsr     regswap2
	ldy     #$01
	lda     (regbank+4),y
	and     #$01
	beq     L000B
	lda     (regbank+4),y
	and     #$06
	bne     L000B
	dey
	lda     (regbank+4),y
	jsr     pusha0
	lda     #$04
	jsr     leaa0sp
	jsr     pushax
	ldx     #$00
	lda     #$01
	jsr     _write
	cpx     #$00
	bne     L0019
	cmp     #$01
	beq     L000D
L0019:	ldy     #$01
	lda     (regbank+4),y
	ora     #$04
	sta     (regbank+4),y
L000B:	ldx     #$FF
	txa
	jmp     L0002
L000D:	ldy     #$02
	lda     (sp),y
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

