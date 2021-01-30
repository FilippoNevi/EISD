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
	.import		_memcmp
	.import		_open
	.import		_close
	.import		_read
	.export		_tgi_load_vectorfont
	.import		_tgi_error

; ---------------------------------------------------------------
; __near__ const struct tgi_vectorfont * __near__ __fastcall__ tgi_load_vectorfont (__near__ const unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_tgi_load_vectorfont: near

.segment	"RODATA"

L0012:
	.byte	$54
	.byte	$43
	.byte	$48
	.byte	$00
L0021:
	.word	$0000
L002A:
	.word	$0000
L0032:
	.word	$0000
L003B:
	.word	$0000
L0043:
	.word	$0000

.segment	"CODE"

	jsr     pushax
	jsr     decsp8
	jsr     push0
	jsr     decsp3
	lda     #$02
	sta     _tgi_error
	ldy     #$10
	jsr     pushwysp
	lda     #$01
	jsr     pusha0
	ldy     #$04
	jsr     _open
	ldy     #$05
	jsr     staxysp
	cpx     #$80
	jcs     L0020
	ldy     #$08
	jsr     pushwysp
	lda     #$09
	jsr     leaa0sp
	jsr     pushax
	ldx     #$00
	lda     #$06
	jsr     _read
	cpx     #$00
	jne     L0020
	cmp     #$06
	jne     L0020
	lda     #$07
	jsr     leaa0sp
	jsr     pushax
	lda     #<(L0012)
	ldx     #>(L0012)
	jsr     pushax
	ldx     #$00
	lda     #$04
	jsr     _memcmp
	cpx     #$00
	jne     L0020
	cmp     #$00
	jne     L0020
	ldy     #$0C
	jsr     ldaxysp
	jsr     _malloc
	ldy     #$03
	jsr     staxysp
	cpx     #$00
	bne     L0036
	cmp     #$00
	bne     L0036
	lda     #$08
	sta     _tgi_error
	jmp     L0020
L0036:	ldy     #$08
	jsr     pushwysp
	ldy     #$08
	jsr     pushwysp
	ldy     #$10
	jsr     ldaxysp
	jsr     _read
	ldy     #$0B
	cmp     (sp),y
	bne     L0062
	txa
	iny
	cmp     (sp),y
	beq     L003C
L0062:	ldy     #$04
	jsr     ldaxysp
	jsr     _free
	jmp     L0020
L003C:	ldy     #$06
	jsr     ldaxysp
	jsr     _close
	lda     #$20
	clc
	ldy     #$03
	adc     (sp),y
	pha
	lda     #$01
	iny
	adc     (sp),y
	tax
	pla
	ldy     #$01
	jsr     staxysp
	lda     #$00
	tay
L005F:	sta     (sp),y
	cmp     #$5F
	bcs     L0061
	ldy     #$04
	jsr     ldaxysp
	ldy     #$62
	jsr     incaxy
	sta     ptr1
	stx     ptr1+1
	ldx     #$00
	lda     (sp,x)
	asl     a
	bcc     L0060
	inx
	clc
L0060:	adc     ptr1
	pha
	txa
	adc     ptr1+1
	tax
	pla
	jsr     pushax
	jsr     ldaxi
	sta     ptr1
	stx     ptr1+1
	ldy     #$04
	jsr     ldaxysp
	clc
	adc     ptr1
	pha
	txa
	adc     ptr1+1
	tax
	pla
	ldy     #$00
	jsr     staxspidx
	clc
	lda     #$01
	adc     (sp),y
	jmp     L005F
L0061:	sty     _tgi_error
	ldy     #$04
	jsr     ldaxysp
	jmp     L0010
L0020:	ldy     #$06
	jsr     ldaxysp
	txa
	bmi     L0058
	ldy     #$06
	jsr     ldaxysp
	jsr     _close
L0058:	ldx     #$00
	txa
L0010:	ldy     #$0F
	jmp     addysp

.endproc

