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
	.import		_stdout
	.export		_puts
	.import		_strlen
	.import		_write

; ---------------------------------------------------------------
; int __near__ __fastcall__ puts (__near__ const unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_puts: near

.segment	"DATA"

L0003:
	.byte	$0A

.segment	"CODE"

	jsr     pushax
	lda     _stdout+1
	sta     ptr1+1
	lda     _stdout
	sta     ptr1
	lda     (ptr1)
	jsr     pusha0
	ldy     #$05
	jsr     pushwysp
	ldy     #$05
	jsr     ldaxysp
	jsr     _strlen
	jsr     _write
	cpx     #$80
	bcs     L0013
	lda     _stdout+1
	sta     ptr1+1
	lda     _stdout
	sta     ptr1
	lda     (ptr1)
	jsr     pusha0
	lda     #<(L0003)
	ldx     #>(L0003)
	jsr     pushax
	ldx     #$00
	lda     #$01
	jsr     _write
	cpx     #$80
	bcs     L0013
	ldx     #$00
	txa
	jmp     incsp2
L0013:	lda     _stdout+1
	sta     ptr1+1
	lda     _stdout
	sta     ptr1
	ldy     #$01
	lda     (ptr1),y
	ora     #$04
	sta     (ptr1),y
	ldx     #$FF
	txa
	jmp     incsp2

.endproc

