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
	.export		_gmtime
	.import		_mktime

; ---------------------------------------------------------------
; __near__ struct tm * __near__ __fastcall__ gmtime (__near__ const unsigned long *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_gmtime: near

.segment	"BSS"

L0004:
	.res	18,$00

.segment	"CODE"

	jsr     pushax
	jsr     decsp4
	ldy     #$04
	lda     (sp),y
	iny
	ora     (sp),y
	beq     L001E
	jsr     ldaxysp
	jsr     ldeaxi
	jsr     steax0sp
	lda     sreg+1
	asl     a
	bcc     L0005
L001E:	ldx     #$00
	txa
	jmp     incsp6
L0005:	jsr     ldeax0sp
	jsr     pusheax
	ldx     #$0E
	lda     #$10
	jsr     tosumod0ax
	sta     L0004
	stx     L0004+1
	stz     L0004+2
	stz     L0004+2+1
	jsr     ldeax0sp
	jsr     pusheax
	ldx     #$0E
	lda     #$10
	jsr     tosudiv0ax
	jsr     pusheax
	ldx     #$00
	lda     #$18
	jsr     tosumod0ax
	sta     L0004+4
	stx     L0004+4+1
	jsr     ldeax0sp
	jsr     pusheax
	ldx     #$51
	lda     #$01
	sta     sreg
	stz     sreg+1
	lda     #$80
	jsr     tosudiveax
	ldy     #$01
	jsr     inceaxy
	sta     L0004+6
	stx     L0004+6+1
	stz     L0004+8
	stz     L0004+8+1
	lda     #$46
	sta     L0004+10
	stz     L0004+10+1
	lda     #<(L0004)
	ldx     #>(L0004)
	jsr     _mktime
	lda     #<(L0004)
	ldx     #>(L0004)
	jmp     incsp6

.endproc

