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
	.export		_ftell
	.import		__seterrno
	.import		_lseek

; ---------------------------------------------------------------
; long __near__ __fastcall__ ftell (register __near__ struct _FILE *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_ftell: near

.segment	"CODE"

	jsr     pushax
	ldy     #$00
	ldx     #$04
	jsr     regswap2
	jsr     decsp4
	ldy     #$01
	lda     (regbank+4),y
	and     #$01
	bne     L0003
	lda     #$07
	jsr     __seterrno
	ldx     #$FF
	stx     sreg
	stx     sreg+1
	txa
	jmp     L0002
L0003:	dey
	lda     (regbank+4),y
	jsr     pusha0
	jsr     pushl0
	jsr     _lseek
	jsr     steax0sp
	jsr     ldeax0sp
	jsr     pusheax
	ldx     #$00
	stx     sreg
	stx     sreg+1
	lda     #$01
	jsr     tosgeeax
	beq     L000F
	ldy     #$01
	lda     (regbank+4),y
	and     #$08
	beq     L000F
	ldx     #$00
	tya
	jsr     lsubeq0sp
L000F:	jsr     ldeax0sp
L0002:	pha
	ldy     #$04
	lda     (sp),y
	sta     regbank+4
	iny
	lda     (sp),y
	sta     regbank+5
	pla
	jmp     incsp6

.endproc

