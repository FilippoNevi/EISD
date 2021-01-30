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
	.import		_PutString
	.import		_UseSystemFont
	.import		_DoDlgBox
	.import		_RstrFrmDialogue
	.export		_MessageBox
	.import		_vsprintf
	.export		__mbprintout

.segment	"RODATA"

__mbdlg_EMPTY:
	.byte	$81
	.byte	$11
	.addr	_RstrFrmDialogue
	.byte	$13
	.addr	__mbprintout
	.byte	$00
__mbdlg_OK:
	.byte	$81
	.byte	$13
	.addr	__mbprintout
	.byte	$01
	.byte	$09
	.byte	$48
	.byte	$00
__mbdlg_OKCANCEL:
	.byte	$81
	.byte	$13
	.addr	__mbprintout
	.byte	$01
	.byte	$01
	.byte	$48
	.byte	$02
	.byte	$11
	.byte	$48
	.byte	$00
__mbdlg_YESNO:
	.byte	$81
	.byte	$13
	.addr	__mbprintout
	.byte	$03
	.byte	$01
	.byte	$48
	.byte	$04
	.byte	$11
	.byte	$48
	.byte	$00
__mbboxes:
	.addr	__mbdlg_EMPTY
	.addr	__mbdlg_OK
	.addr	__mbdlg_OKCANCEL
	.addr	__mbdlg_YESNO

.segment	"BSS"

__mbbuffer:
	.res	256,$00

; ---------------------------------------------------------------
; unsigned char __near__ MessageBox (unsigned char, __near__ const unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_MessageBox: near

.segment	"CODE"

	jsr     enter
	lda     regbank+4
	ldx     regbank+5
	jsr     pushax
	jsr     decsp2
	ldy     #$04
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax2
	jsr     stax0sp
	lda     #<(__mbbuffer)
	ldx     #>(__mbbuffer)
	jsr     pushax
	ldy     #$06
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax4
	jsr     pushw
	ldy     #$05
	jsr     ldaxysp
	jsr     _vsprintf
	lda     #>(__mbbuffer)
	sta     regbank+4+1
	lda     #<(__mbbuffer)
	sta     regbank+4
	bra     L005E
L0083:	lda     (regbank+4),y
	cmp     #$0A
	bne     L0060
	lda     #$0D
	sta     (regbank+4),y
L0060:	inc     regbank+4
	bne     L005E
	inc     regbank+4+1
L005E:	ldy     #$00
	lda     (regbank+4)
	bne     L0083
	ldy     #$04
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax4
	sta     ptr1
	stx     ptr1+1
	lda     (ptr1)
	cmp     #$04
	bcc     L0066
	ldy     #$04
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax4
	sta     ptr1
	stx     ptr1+1
	lda     #$00
	sta     (ptr1)
L0066:	ldy     #$04
	lda     (sp),y
	jsr     leaa0sp
	jsr     incax4
	sta     ptr1
	stx     ptr1+1
	ldx     #$00
	lda     (ptr1)
	asl     a
	bcc     L0081
	inx
	clc
L0081:	adc     #<(__mbboxes)
	tay
	txa
	adc     #>(__mbboxes)
	tax
	tya
	jsr     ldaxi
	jsr     _DoDlgBox
	pha
	ldy     #$02
	lda     (sp),y
	sta     regbank+4
	iny
	lda     (sp),y
	sta     regbank+5
	pla
	iny
	jmp     leavey

.endproc

; ---------------------------------------------------------------
; void __near__ _mbprintout (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	__mbprintout: near

.segment	"CODE"

	jsr     _UseSystemFont
	lda     #$20
	sta     $021E
	lda     #$4A
	sta     $0220
	stz     $0220+1
	lda     #$F5
	sta     $0222
	stz     $0222+1
	lda     #$7F
	sta     $021F
	lda     #<(__mbbuffer)
	ldx     #>(__mbbuffer)
	jsr     pushax
	ldx     #$00
	lda     $021A
	ldy     #$2A
	jsr     incaxy
	jsr     pusha
	ldx     #$00
	lda     #$4A
	jmp     _PutString

.endproc

