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
	.import		_malloc
	.import		_free
	.export		_posix_memalign

; ---------------------------------------------------------------
; int __near__ __fastcall__ posix_memalign (__near__ __near__ void * *, unsigned int, unsigned int)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_posix_memalign: near

.segment	"CODE"

	jsr     pushax
	jsr     decsp6
	lda     regbank+4
	ldx     regbank+5
	jsr     pushax
	lda     regbank+2
	ldx     regbank+3
	jsr     pushax
	lda     regbank+0
	ldx     regbank+1
	jsr     pushax
	ldy     #$0C
	lda     (sp),y
	iny
	ora     (sp),y
	bne     L0002
	ldy     #$11
	jsr     ldaxysp
	sta     ptr1
	stx     ptr1+1
	lda     #$00
	tay
	sta     (ptr1),y
	iny
	sta     (ptr1),y
	tax
	lda     #$07
	jmp     L0001
L0002:	iny
	lda     (sp),y
	iny
	ora     (sp),y
	beq     L0009
	ldy     #$11
	jsr     pushwysp
	ldx     #$00
	lda     #$01
	ldy     #$10
	jsr     subeqysp
	jsr     tosandax
	cpx     #$00
	bne     L0009
	cmp     #$00
	beq     L0008
L0009:	ldy     #$11
	jsr     ldaxysp
	sta     ptr1
	stx     ptr1+1
	lda     #$00
	tay
	sta     (ptr1),y
	iny
	sta     (ptr1),y
	tax
	lda     #$07
	jmp     L0001
L0008:	ldy     #$0F
	jsr     ldaxysp
	clc
	ldy     #$0C
	adc     (sp),y
	pha
	txa
	iny
	adc     (sp),y
	tax
	pla
	jsr     _malloc
	sta     regbank+4
	stx     regbank+4+1
	cpx     #$00
	bne     L0014
	cmp     #$00
	bne     L0014
	ldy     #$11
	jsr     ldaxysp
	sta     ptr1
	stx     ptr1+1
	lda     #$00
	tay
	sta     (ptr1),y
	iny
	sta     (ptr1),y
	tax
	lda     #$02
	jmp     L0001
L0014:	ldy     #$13
	jsr     pushwysp
	ldy     #$11
	jsr     ldaxysp
	clc
	adc     regbank+4
	sta     ptr1
	txa
	adc     regbank+4+1
	sta     ptr1+1
	ldy     #$11
	jsr     ldaxysp
	jsr     complax
	and     ptr1
	pha
	txa
	and     ptr1+1
	tax
	pla
	ldy     #$00
	jsr     staxspidx
	sta     regbank+2
	stx     regbank+2+1
	sta     ptr1
	stx     ptr1+1
	ldy     #$0D
	jsr     ldaxysp
	clc
	adc     ptr1
	sta     regbank+0
	txa
	adc     ptr1+1
	sta     regbank+0+1
	lda     regbank+4
	ldx     regbank+4+1
	jsr     decax4
	ldy     #$03
	jsr     ldaxidx
	sta     regbank+4
	stx     regbank+4+1
	ldy     #$01
	lda     (regbank+4),y
	tax
	dey
	lda     (regbank+4),y
	ldy     #$0A
	jsr     staxysp
	jsr     pushax
	lda     regbank+0
	sec
	sbc     regbank+4
	pha
	lda     regbank+0+1
	sbc     regbank+4+1
	tax
	pla
	ldy     #$08
	jsr     staxysp
	jsr     tossubax
	ldy     #$08
	jsr     staxysp
	cmp     #$06
	txa
	sbc     #$00
	bcc     L002B
	ldy     #$07
	jsr     ldaxysp
	cmp     #$06
	txa
	sbc     #$00
	bcc     L002B
	ldy     #$09
	jsr     ldaxysp
	ldy     #$00
	sta     (regbank+0),y
	iny
	txa
	sta     (regbank+0),y
	lda     regbank+0
	ldx     regbank+0+1
	iny
	sta     (regbank+0),y
	iny
	txa
	sta     (regbank+0),y
	lda     regbank+0
	ldx     regbank+0+1
	jsr     incax4
	jsr     _free
	ldy     #$07
	jsr     ldaxysp
	ldy     #$0A
	jsr     staxysp
L002B:	lda     regbank+2
	sec
	sbc     regbank+4
	pha
	lda     regbank+2+1
	sbc     regbank+4+1
	tax
	pla
	jsr     decax4
	ldy     #$06
	jsr     staxysp
	cmp     #$06
	txa
	sbc     #$00
	bcc     L003A
	ldy     #$0B
	jsr     ldaxysp
	sec
	ldy     #$06
	sbc     (sp),y
	pha
	txa
	iny
	sbc     (sp),y
	tax
	pla
	cmp     #$06
	txa
	sbc     #$00
	bcc     L003A
	jsr     ldaxysp
	ldy     #$00
	sta     (regbank+4),y
	iny
	txa
	sta     (regbank+4),y
	lda     regbank+4
	ldx     regbank+4+1
	iny
	sta     (regbank+4),y
	iny
	txa
	sta     (regbank+4),y
	lda     regbank+4
	ldx     regbank+4+1
	jsr     incax4
	jsr     _free
	ldy     #$07
	jsr     ldaxysp
	ldy     #$0A
	jsr     subeqysp
	lda     regbank+2
	ldx     regbank+2+1
	jsr     decax4
	sta     regbank+4
	stx     regbank+4+1
L003A:	ldy     #$0B
	jsr     ldaxysp
	ldy     #$00
	sta     (regbank+4),y
	iny
	txa
	sta     (regbank+4),y
	lda     regbank+2
	ldx     regbank+2+1
	jsr     decax4
	sta     ptr1
	stx     ptr1+1
	lda     regbank+4
	iny
	sta     (ptr1),y
	iny
	lda     regbank+4+1
	sta     (ptr1),y
	ldx     #$00
	txa
L0001:	pha
	ldy     #$00
L004F:	lda     (sp),y
	sta     regbank+0,y
	iny
	cpy     #$06
	bne     L004F
	pla
	ldy     #$12
	jmp     addysp

.endproc

