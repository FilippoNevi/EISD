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
	.import		_strchr
	.export		_strqtok

.segment	"RODATA"

L0044:
	.byte	$00
L0004	:=	L0044+0

; ---------------------------------------------------------------
; __near__ unsigned char * __near__ __fastcall__ strqtok (register __near__ unsigned char *, __near__ const unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_strqtok: near

.segment	"DATA"

L0005:
	.addr	L0004

.segment	"RODATA"

L001F:
	.word	$0000
L000F:
	.word	$0000
L0033:
	.word	$0000
L0031:
	.word	$0000

.segment	"BSS"

L0002:
	.res	1,$00
L0003:
	.res	2,$00

.segment	"CODE"

	jsr     pushax
	ldy     #$02
	ldx     #$04
	jsr     regswap2
	lda     regbank+4
	ora     regbank+4+1
	bne     L0012
	lda     L0005+1
	sta     regbank+4+1
	lda     L0005
	sta     regbank+4
	lda     L0002
	cmp     #$22
	bne     L0012
	bra     L0054
L0010:	lda     L0002
	bne     L0017
	tax
	jmp     L0001
L0017:	inc     regbank+4
	bne     L0012
	inc     regbank+4+1
L0012:	jsr     pushw0sp
	lda     (regbank+4)
	sta     L0002
	ldx     #$00
	jsr     _strchr
	stx     tmp1
	ora     tmp1
	bne     L0010
	lda     L0002
	cmp     #$22
	beq     L001E
	lda     regbank+4+1
	sta     L0003+1
	lda     regbank+4
	sta     L0003
	bra     L0024
L0022:	inc     regbank+4
	bne     L0024
	inc     regbank+4+1
L0024:	lda     (regbank+4)
	sta     L0002
	cmp     #$22
	beq     L0053
	jsr     pushw0sp
	lda     L0002
	ldx     #$00
	jsr     _strchr
	stx     tmp1
	ora     tmp1
	beq     L0022
L0053:	lda     L0002
	bne     L003C
	bra     L0030
L001E:	inc     regbank+4
	bne     L0054
	inc     regbank+4+1
L0054:	stz     L0002
	lda     regbank+4+1
	sta     L0003+1
	lda     regbank+4
	sta     L0003
	lda     regbank+4
	ldx     regbank+4+1
	jsr     pushax
	ldx     #$00
	lda     #$22
	jsr     _strchr
	sta     regbank+4
	stx     regbank+4+1
	cpx     #$00
	bne     L003C
	cmp     #$00
	bne     L003C
	lda     #>(L0044)
	sta     L0005+1
	lda     #<(L0044)
	bra     L0056
L003C:	lda     #$00
	sta     (regbank+4)
	inc     regbank+4
	bne     L0030
	inc     regbank+4+1
L0030:	lda     regbank+4+1
	sta     L0005+1
	lda     regbank+4
L0056:	sta     L0005
	lda     L0003
	ldx     L0003+1
L0001:	pha
	ldy     #$02
	lda     (sp),y
	sta     regbank+4
	iny
	lda     (sp),y
	sta     regbank+5
	pla
	jmp     incsp4

.endproc

