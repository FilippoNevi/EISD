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
	.import		_stdin
	.import		_fgetc
	.export		_gets

; ---------------------------------------------------------------
; __near__ unsigned char * __near__ __fastcall__ gets (__near__ unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_gets: near

.segment	"CODE"

	jsr     pushax
	lda     regbank+4
	ldx     regbank+5
	jsr     pushax
	ldy     #$03
	jsr     ldaxysp
	sta     regbank+4
	stx     regbank+4+1
	jsr     decsp2
	jsr     push0
L0005:	lda     _stdin
	ldx     _stdin+1
	jsr     _fgetc
	ldy     #$02
	jsr     staxysp
	cpx     #$FF
	bne     L0018
	cmp     #$FF
	bne     L0018
	ina
	sta     (regbank+4)
	lda     _stdin+1
	sta     ptr1+1
	lda     _stdin
	sta     ptr1
	ldy     #$01
	lda     (ptr1),y
	inx
	and     #$04
	beq     L0026
	txa
	bra     L0002
L0026:	lda     (sp),y
	ora     (sp)
	beq     L0002
	bra     L0006
L0018:	ldy     #$02
	lda     (sp),y
	cmp     #$0A
	bne     L001A
	lda     #$00
	sta     (regbank+4)
	bra     L0006
L001A:	lda     (sp),y
	sta     (regbank+4)
	inc     regbank+4
	bne     L0022
	inc     regbank+4+1
L0022:	ldx     #$00
	lda     #$01
	jsr     addeq0sp
	bra     L0005
L0006:	ldy     #$07
	jsr     ldaxysp
L0002:	pha
	ldy     #$04
	lda     (sp),y
	sta     regbank+4
	iny
	lda     (sp),y
	sta     regbank+5
	pla
	jmp     incsp8

.endproc

