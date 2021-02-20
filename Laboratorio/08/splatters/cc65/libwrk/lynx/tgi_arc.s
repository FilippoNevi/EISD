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
	.import		_tgi_line
	.export		_tgi_arc
	.import		_tgi_imulround
	.import		_cc65_sin
	.import		_cc65_cos

; ---------------------------------------------------------------
; void __near__ __fastcall__ tgi_arc (int, int, unsigned char, unsigned char, unsigned int, unsigned int)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_tgi_arc: near

.segment	"CODE"

	jsr     pushax
	ldy     #$09
	jsr     subysp
	lda     #$00
	jsr     pusha
	ldy     #$0D
	jsr     ldaxysp
	sec
	ldy     #$0A
	sbc     (sp),y
	sta     tmp1
	txa
	iny
	sbc     (sp),y
	ora     tmp1
	bcc     L001D
	jne     L0031
L001D:	ldx     #$00
	ldy     #$0E
	lda     (sp),y
	clc
	iny
	adc     (sp),y
	bcc     L004F
	inx
L004F:	cmp     #$19
	txa
	sbc     #$00
	bcc     L0051
	lda     #$0C
	bra     L0052
L0051:	lda     #$18
L0052:	ldy     #$01
	sta     (sp),y
	ldy     #$15
	jsr     pushwysp
	ldy     #$11
	lda     (sp),y
	jsr     pusha0
	ldy     #$11
	jsr     ldaxysp
	jsr     _cc65_cos
	jsr     _tgi_imulround
	jsr     tosaddax
	ldy     #$08
	jsr     staxysp
	ldy     #$13
	jsr     pushwysp
	ldy     #$10
	lda     (sp),y
	jsr     pusha0
	ldy     #$11
	jsr     ldaxysp
	jsr     _cc65_sin
	jsr     _tgi_imulround
	jsr     tossubax
	ldy     #$06
	jsr     staxysp
L0030:	ldy     #$01
	lda     (sp),y
	ldx     #$00
	ldy     #$0C
	jsr     addeqysp
	ldy     #$0D
	jsr     ldaxysp
	ldy     #$0A
	cmp     (sp),y
	txa
	iny
	sbc     (sp),y
	bcc     L0035
	jsr     ldaxysp
	ldy     #$0C
	jsr     staxysp
	lda     #$01
	sta     (sp)
L0035:	ldy     #$15
	jsr     pushwysp
	ldy     #$11
	lda     (sp),y
	jsr     pusha0
	ldy     #$11
	jsr     ldaxysp
	jsr     _cc65_cos
	jsr     _tgi_imulround
	jsr     tosaddax
	ldy     #$04
	jsr     staxysp
	ldy     #$13
	jsr     pushwysp
	ldy     #$10
	lda     (sp),y
	jsr     pusha0
	ldy     #$11
	jsr     ldaxysp
	jsr     _cc65_sin
	jsr     _tgi_imulround
	jsr     tossubax
	ldy     #$02
	jsr     staxysp
	ldy     #$0B
	jsr     pushwysp
	ldy     #$0B
	jsr     pushwysp
	ldy     #$0B
	jsr     pushwysp
	ldy     #$09
	jsr     ldaxysp
	jsr     _tgi_line
	ldy     #$05
	jsr     ldaxysp
	ldy     #$08
	jsr     staxysp
	ldy     #$03
	jsr     ldaxysp
	ldy     #$06
	jsr     staxysp
	lda     (sp)
	jeq     L0030
L0031:	ldy     #$14
	jmp     addysp

.endproc
