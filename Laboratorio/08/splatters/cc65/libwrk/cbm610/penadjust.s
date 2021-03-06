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
	.import		_open
	.import		_close
	.import		_write
	.import		_read
	.import		_pen_adjuster
	.import		_pen_calibrate
	.export		_pen_adjust

.segment	"BSS"

_name:
	.res	2,$00

; ---------------------------------------------------------------
; void __near__ __fastcall__ pen_adjust (__near__ const unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_pen_adjust: near

.segment	"CODE"

	jsr     pushax
	ldy     #$00
	lda     (sp),y
	iny
	ora     (sp),y
	beq     L001D
	jsr     ldax0sp
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	beq     L001D
	jsr     ldax0sp
	sta     _name
	stx     _name+1
	lda     #>(_adjuster)
	sta     _pen_adjuster+1
	lda     #<(_adjuster)
	jmp     L002A
L001D:	lda     #>(_pen_calibrate)
	sta     _pen_adjuster+1
	lda     #<(_pen_calibrate)
L002A:	sta     _pen_adjuster
	jmp     incsp2

.endproc

; ---------------------------------------------------------------
; void __near__ __fastcall__ adjuster (__near__ unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_adjuster: near

.segment	"CODE"

	jsr     pushax
	lda     _name
	ldx     _name+1
	jsr     pushax
	lda     #$01
	jsr     pusha0
	ldy     #$04
	jsr     _open
	jsr     pushax
	jsr     ldax0sp
	cpx     #$80
	bcc     L0005
	ldy     #$03
	jsr     ldaxysp
	jsr     _pen_calibrate
	lda     _name
	ldx     _name+1
	jsr     pushax
	lda     #$92
	jsr     pusha0
	ldy     #$04
	jsr     _open
	jsr     stax0sp
	txa
	bmi     L0015
	jsr     pushw0sp
	ldy     #$07
	jsr     pushwysp
	ldx     #$00
	lda     #$01
	jsr     _write
	jmp     L002E
L0005:	jsr     pushw0sp
	ldy     #$07
	jsr     pushwysp
	ldx     #$00
	lda     #$01
	jsr     _read
L002E:	jsr     ldax0sp
	jsr     _close
L0015:	jmp     incsp4

.endproc

