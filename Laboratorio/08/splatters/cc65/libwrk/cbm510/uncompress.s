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
	.import		_inflatemem
	.export		_uncompress
	.import		_adler32

; ---------------------------------------------------------------
; int __near__ __fastcall__ uncompress (__near__ unsigned char *, __near__ unsigned int *, __near__ const unsigned char *, unsigned int)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_uncompress: near

.segment	"CODE"

	jsr     pushax
	jsr     decsp8
	ldy     #$0B
	jsr     ldaxysp
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	and     #$8F
	cmp     #$08
	jne     L0023
	ldy     #$0B
	jsr     ldaxysp
	sta     ptr1
	stx     ptr1+1
	ldy     #$01
	lda     (ptr1),y
	and     #$20
	jne     L0023
	ldy     #$0B
	jsr     ldaxysp
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	tax
	tya
	jsr     pushax
	ldy     #$0D
	jsr     ldaxysp
	sta     ptr1
	stx     ptr1+1
	ldy     #$01
	lda     (ptr1),y
	jsr     tosora0
	jsr     pushax
	lda     #$1F
	jsr     tosumoda0
	stx     tmp1
	ora     tmp1
	jne     L0023
	ldy     #$0F
	jsr     pushwysp
	ldy     #$13
	jsr     pushwysp
	ldy     #$0F
	jsr     ldaxysp
	jsr     incax2
	jsr     _inflatemem
	ldy     #$08
	jsr     staxysp
	ldy     #$00
	jsr     staxspidx
	ldy     #$09
	jsr     ldaxysp
	clc
	ldy     #$0A
	adc     (sp),y
	pha
	txa
	iny
	adc     (sp),y
	tax
	pla
	jsr     decax4
	ldy     #$04
	jsr     staxysp
	jsr     pushl0
	jsr     push0
	jsr     _adler32
	jsr     pusheax
	ldy     #$15
	jsr     pushwysp
	ldy     #$0D
	jsr     ldaxysp
	jsr     _adler32
	jsr     steax0sp
	ldx     #$00
	lda     (sp,x)
	jsr     pusha0
	ldy     #$07
	jsr     ldaxysp
	sta     ptr1
	stx     ptr1+1
	ldy     #$03
	lda     (ptr1),y
	jsr     tosicmp0
	bne     L0023
	jsr     ldeax0sp
	txa
	jsr     pusha0
	ldy     #$07
	jsr     ldaxysp
	sta     ptr1
	stx     ptr1+1
	ldy     #$02
	lda     (ptr1),y
	jsr     tosicmp0
	bne     L0023
	jsr     ldeax0sp
	lda     sreg
	jsr     pusha0
	ldy     #$07
	jsr     ldaxysp
	sta     ptr1
	stx     ptr1+1
	ldy     #$01
	lda     (ptr1),y
	jsr     tosicmp0
	bne     L0023
	jsr     ldeax0sp
	lda     sreg+1
	jsr     pusha0
	ldy     #$07
	jsr     ldaxysp
	sta     ptr1
	stx     ptr1+1
	ldx     #$00
	lda     (ptr1,x)
	jsr     tosicmp0
	bne     L0023
	ldx     #$00
	txa
	jmp     L0001
L0023:	ldx     #$FF
	lda     #$FD
L0001:	ldy     #$10
	jmp     addysp

.endproc

