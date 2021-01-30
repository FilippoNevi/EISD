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
	.import		_stderr
	.import		_fputc
	.import		_fputs
	.import		_strchr
	.export		_optarg
	.export		_optind
	.export		_opterr
	.export		_optopt
	.export		_getopt

.segment	"DATA"

_opterr:
	.word	$0001
_optind:
	.word	$0001

.segment	"RODATA"

L004E:
	.byte	$3A,$20,$6F,$70,$74,$69,$6F,$6E,$20,$72,$65,$71,$75,$69,$72,$65
	.byte	$73,$20,$61,$6E,$20,$61,$72,$67,$75,$6D,$65,$6E,$74,$20,$2D,$2D
	.byte	$20,$00
L002A:
	.byte	$3A,$20,$69,$6C,$6C,$65,$67,$61,$6C,$20,$6F,$70,$74,$69,$6F,$6E
	.byte	$20,$2D,$2D,$20,$00
L0048	:=	L004E+33
L005E	:=	L004E+33
L0004	:=	L004E+33

.segment	"BSS"

_optarg:
	.res	2,$00
_optopt:
	.res	2,$00

; ---------------------------------------------------------------
; int __near__ __fastcall__ getopt (int, __near__ const __near__ unsigned char * *, __near__ const unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_getopt: near

.segment	"DATA"

L0005:
	.addr	L0004

.segment	"CODE"

	jsr     pushax
	lda     regbank+4
	ldx     regbank+5
	jsr     pushax
	lda     L0005+1
	sta     ptr1+1
	lda     L0005
	sta     ptr1
	ldy     #$00
	lda     (ptr1),y
	bne     L0012
	lda     _optind
	ldy     #$06
	cmp     (sp),y
	lda     _optind+1
	iny
	sbc     (sp),y
	bvs     L0064
	eor     #$80
L0064:	bmi     L0067
	lda     _optind
	ldx     _optind+1
	jsr     aslax1
	clc
	ldy     #$04
	adc     (sp),y
	pha
	txa
	iny
	adc     (sp),y
	tax
	pla
	jsr     ldaxi
	sta     L0005
	stx     L0005+1
	sta     ptr1
	stx     ptr1+1
	ldy     #$00
	lda     (ptr1),y
	cmp     #$2D
	bne     L0067
	inc     L0005
	bne     L000E
	inc     L0005+1
L000E:	lda     L0005+1
	sta     ptr1+1
	lda     L0005
	sta     ptr1
	lda     (ptr1),y
	bne     L0009
L0067:	ldx     #$FF
	txa
	jmp     L0003
L0009:	lda     L0005+1
	sta     ptr1+1
	lda     L0005
	sta     ptr1
	lda     (ptr1),y
	cmp     #$2D
	bne     L0012
	inc     _optind
	bne     L0015
	inc     _optind+1
L0015:	ldx     #$FF
	txa
	jmp     L0003
L0012:	lda     L0005
	ldx     L0005+1
	sta     regsave
	stx     regsave+1
	jsr     incax1
	sta     L0005
	stx     L0005+1
	sty     _optopt+1
	lda     (regsave),y
	sta     _optopt
	cmp     #$3A
	beq     L0068
	ldy     #$05
	jsr     pushwysp
	lda     _optopt
	ldx     _optopt+1
	jsr     _strchr
	sta     regbank+4
	stx     regbank+4+1
	jsr     bnegax
	beq     L0018
L0068:	lda     L0005+1
	sta     ptr1+1
	lda     L0005
	sta     ptr1
	ldy     #$00
	lda     (ptr1),y
	bne     L0022
	inc     _optind
	bne     L0022
	inc     _optind+1
L0022:	ldy     #$05
	jsr     ldaxysp
	jsr     pushw
	lda     _stderr
	ldx     _stderr+1
	jsr     _fputs
	lda     #<(L002A)
	ldx     #>(L002A)
	jsr     pushax
	lda     _stderr
	ldx     _stderr+1
	jsr     _fputs
	lda     _optopt
	ldx     _optopt+1
	jsr     pushax
	lda     _stderr
	ldx     _stderr+1
	jsr     _fputc
	lda     #$9B
	jsr     pusha0
	lda     _stderr
	ldx     _stderr+1
	jsr     _fputc
	ldx     #$00
	lda     #$3F
	jmp     L0003
L0018:	inc     regbank+4
	bne     L0037
	inc     regbank+4+1
L0037:	ldy     #$00
	lda     (regbank+4),y
	cmp     #$3A
	beq     L0035
	tya
	sta     _optarg
	sta     _optarg+1
	lda     L0005+1
	sta     ptr1+1
	lda     L0005
	sta     ptr1
	lda     (ptr1),y
	jne     L003E
	jmp     L006B
L0035:	lda     L0005+1
	sta     ptr1+1
	lda     L0005
	sta     ptr1
	lda     (ptr1),y
	beq     L003F
	lda     L0005+1
	sta     _optarg+1
	lda     L0005
	sta     _optarg
	jmp     L0059
L003F:	ldy     #$09
	jsr     pushwysp
	inc     _optind
	bne     L0046
	inc     _optind+1
L0046:	lda     _optind
	ldx     _optind+1
	jsr     tosicmp
	beq     L0066
	bpl     L0044
L0066:	lda     #>(L0048)
	sta     L0005+1
	lda     #<(L0048)
	sta     L0005
	ldy     #$05
	jsr     ldaxysp
	jsr     pushw
	lda     _stderr
	ldx     _stderr+1
	jsr     _fputs
	lda     #<(L004E)
	ldx     #>(L004E)
	jsr     pushax
	lda     _stderr
	ldx     _stderr+1
	jsr     _fputs
	lda     _optopt
	ldx     _optopt+1
	jsr     pushax
	lda     _stderr
	ldx     _stderr+1
	jsr     _fputc
	lda     #$9B
	jsr     pusha0
	lda     _stderr
	ldx     _stderr+1
	jsr     _fputc
	ldx     #$00
	lda     #$3F
	jmp     L0003
L0044:	lda     _optind
	ldx     _optind+1
	jsr     aslax1
	clc
	ldy     #$04
	adc     (sp),y
	pha
	txa
	iny
	adc     (sp),y
	tax
	pla
	jsr     ldaxi
	sta     _optarg
	stx     _optarg+1
L0059:	lda     #>(L005E)
	sta     L0005+1
	lda     #<(L005E)
	sta     L0005
L006B:	inc     _optind
	bne     L003E
	inc     _optind+1
L003E:	lda     _optopt
	ldx     _optopt+1
L0003:	pha
	ldy     #$00
	lda     (sp),y
	sta     regbank+4
	iny
	lda     (sp),y
	sta     regbank+5
	pla
	jmp     incsp8

.endproc

