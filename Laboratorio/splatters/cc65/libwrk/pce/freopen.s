;
; File generated by cc65 v 2.17 - Git 582aa41
;
	.fopt		compiler,"cc65 v 2.17 - Git 582aa41"
	.setcpu		"HUC6280"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.export		_freopen
	.import		_close
	.import		__seterrno
	.import		__fopen

; ---------------------------------------------------------------
; __near__ struct _FILE * __near__ __fastcall__ freopen (__near__ const unsigned char *, __near__ const unsigned char *, __near__ struct _FILE *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_freopen: near

.segment	"CODE"

	jsr     pushax
	jsr     ldax0sp
	sta     ptr1
	stx     ptr1+1
	ldy     #$01
	lda     (ptr1),y
	and     #$01
	bne     L0011
	lda     #$07
	jsr     __seterrno
	ldx     #$00
	jmp     incsp6
L0011:	jsr     ldax0sp
	sta     ptr1
	stx     ptr1+1
	lda     (ptr1)
	ldx     #$00
	jsr     _close
	cpx     #$80
	bcc     L0009
	ldx     #$00
	txa
	jmp     incsp6
L0009:	ldy     #$07
	jsr     pushwysp
	ldy     #$07
	jsr     pushwysp
	ldy     #$05
	jsr     ldaxysp
	jsr     __fopen
	jmp     incsp6

.endproc

