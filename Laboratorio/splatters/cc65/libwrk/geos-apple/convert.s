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
	.forceimport	__STARTUP__
	.forceimport	initmainargs
	.import		_strlen
	.import		_strrchr
	.import		_memcpy
	.import		_memmove
	.import		_strncasecmp
	.import		__stroserror
	.import		_exit
	.import		_stderr
	.import		_fprintf
	.import		_getchar
	.import		_gets
	.import		_printf
	.import		__oserror
	.import		__mappederrno
	.import		_opendir
	.import		_readdir
	.import		_getcurrentdevice
	.import		_dio_open
	.import		_dio_close
	.import		_dio_read
	.import		_dio_write
	.export		_info_signature
	.export		_dhandle
	.export		_dir_entry
	.export		_dir_block
	.export		_index_block
	.export		_master_block
	.export		_vlir_block
	.export		_header_block
	.export		_main

.segment	"DATA"

_info_signature:
	.byte	$03
	.byte	$15
	.byte	$BF

.segment	"RODATA"

L00A6:
	.byte	$0A,$41,$70,$70,$6C,$65,$20,$47,$45,$4F,$53,$20,$43,$6F,$6E,$76
	.byte	$65,$72,$74,$20,$31,$2E,$30,$0A,$2D,$2D,$2D,$2D,$2D,$2D,$2D,$2D
	.byte	$2D,$2D,$2D,$2D,$2D,$2D,$2D,$2D,$2D,$2D,$2D,$2D,$2D,$2D,$0A,$0A
	.byte	$50,$61,$74,$68,$6E,$61,$6D,$65,$3A,$00
L01AA:
	.byte	$43,$6F,$6E,$76,$65,$72,$74,$20,$74,$6F,$20,$27,$25,$2E,$2A,$73
	.byte	$27,$20,$73,$75,$63,$63,$65,$73,$73,$66,$75,$6C,$00
L0138:
	.byte	$56,$4C,$49,$52,$20,$25,$75,$20,$73,$69,$7A,$65,$20,$25,$6C,$75
	.byte	$20,$62,$79,$74,$65,$73,$0A,$00
L00D4:
	.byte	$66,$69,$6C,$65,$20,$73,$69,$67,$6E,$61,$74,$75,$72,$65,$20,$6D
	.byte	$69,$73,$6D,$61,$74,$63,$68,$00
L015E:
	.byte	$46,$69,$6C,$65,$20,$73,$69,$7A,$65,$20,$25,$6C,$75,$20,$62,$79
	.byte	$74,$65,$73,$0A,$0A,$00
L001F:
	.byte	$25,$73,$20,$2D,$20,$65,$72,$72,$3A,$25,$30,$32,$78,$20,$2D,$20
	.byte	$25,$73,$00
L00DB:
	.byte	$0A,$53,$65,$71,$75,$65,$6E,$74,$69,$61,$6C,$20,$66,$69,$6C,$65
	.byte	$0A,$00
L00F6:
	.byte	$0A,$56,$4C,$49,$52,$20,$66,$69,$6C,$65,$0A,$00
L019F:
	.byte	$64,$69,$6F,$5F,$77,$72,$69,$74,$65,$2E,$33,$00
L0177:
	.byte	$64,$69,$6F,$5F,$77,$72,$69,$74,$65,$2E,$32,$00
L0156:
	.byte	$64,$69,$6F,$5F,$77,$72,$69,$74,$65,$2E,$31,$00
L00B4:
	.byte	$64,$69,$6F,$5F,$72,$65,$61,$64,$2E,$34,$00
L008B:
	.byte	$64,$69,$6F,$5F,$72,$65,$61,$64,$2E,$33,$00
L0082:
	.byte	$64,$69,$6F,$5F,$72,$65,$61,$64,$2E,$32,$00
L012A:
	.byte	$64,$69,$6F,$5F,$72,$65,$61,$64,$2E,$36,$00
L00C1:
	.byte	$64,$69,$6F,$5F,$72,$65,$61,$64,$2E,$35,$00
L0068:
	.byte	$64,$69,$6F,$5F,$72,$65,$61,$64,$2E,$31,$00
L01A6:
	.byte	$64,$69,$6F,$5F,$63,$6C,$6F,$73,$65,$00
L005F:
	.byte	$64,$69,$6F,$5F,$6F,$70,$65,$6E,$00
L0052:
	.byte	$72,$65,$61,$64,$64,$69,$72,$00
L0049:
	.byte	$6F,$70,$65,$6E,$64,$69,$72,$00
L0028	:=	L001F+16
L003C:
	.byte	$2E,$00

.segment	"BSS"

_dhandle:
	.res	2,$00
_dir_entry:
	.res	2,$00
_dir_block:
	.res	512,$00
_index_block:
	.res	512,$00
_master_block:
	.res	512,$00
_vlir_block:
	.res	512,$00
_header_block:
	.res	512,$00

; ---------------------------------------------------------------
; void __near__ err_exit (__near__ unsigned char *, unsigned char)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_err_exit: near

.segment	"CODE"

	jsr     pusha
	lda     (sp)
	beq     L001B
	lda     _stderr
	ldx     _stderr+1
	jsr     pushax
	lda     #<(L001F)
	ldx     #>(L001F)
	jsr     pushax
	ldy     #$08
	jsr     pushwysp
	lda     __oserror
	jsr     pusha0
	lda     __oserror
	jsr     __stroserror
	jsr     pushax
	ldy     #$0A
	bra     L01B1
L001B:	lda     _stderr
	ldx     _stderr+1
	jsr     pushax
	lda     #<(L0028)
	ldx     #>(L0028)
	jsr     pushax
	ldy     #$08
	jsr     pushwysp
	ldy     #$06
L01B1:	jsr     _fprintf
	jsr     _getchar
	ldx     #$00
	lda     #$01
	jsr     _exit
	jmp     incsp3

.endproc

; ---------------------------------------------------------------
; unsigned int __near__ get_dir_entry (__near__ unsigned char *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_get_dir_entry: near

.segment	"CODE"

	jsr     pushax
	ldy     #$0F
	jsr     subysp
	ldy     #$12
	jsr     pushwysp
	ldx     #$00
	lda     #$2F
	jsr     _strrchr
	ldy     #$0B
	jsr     staxysp
	ldy     #$0C
	lda     (sp),y
	dey
	ora     (sp),y
	beq     L0033
	ldy     #$10
	jsr     ldaxysp
	ldy     #$0D
	jsr     staxysp
	ldy     #$0C
	jsr     ldaxysp
	sta     regsave
	stx     regsave+1
	ina
	bne     L0038
	inx
L0038:	ldy     #$0B
	jsr     staxysp
	lda     #$00
	sta     (regsave)
	bra     L003A
L0033:	lda     #<(L003C)
	ldx     #>(L003C)
	ldy     #$0D
	jsr     staxysp
	ldy     #$10
	jsr     ldaxysp
	ldy     #$0B
	jsr     staxysp
L003A:	ldy     #$0C
	jsr     ldaxysp
	jsr     _strlen
	ldy     #$09
	jsr     staxysp
	ldy     #$0E
	jsr     ldaxysp
	jsr     _opendir
	ldy     #$07
	jsr     staxysp
	ldy     #$08
	lda     (sp),y
	dey
	ora     (sp),y
	bne     L0046
	lda     #<(L0049)
	ldx     #>(L0049)
	jsr     pushax
	lda     #$01
	jsr     _err_exit
L0046:	ldy     #$08
	jsr     ldaxysp
	jsr     _readdir
	ldy     #$05
	jsr     staxysp
	ldy     #$06
	lda     (sp),y
	dey
	ora     (sp),y
	bne     L004F
	lda     #<(L0052)
	ldx     #>(L0052)
	jsr     pushax
	lda     #$01
	jsr     _err_exit
L004F:	ldy     #$06
	jsr     ldaxysp
	ldy     #$23
	jsr     incaxy
	ina
	bne     L0058
	inx
L0058:	jsr     ldaxi
	ldy     #$03
	jsr     staxysp
	jsr     _getcurrentdevice
	jsr     _dio_open
	sta     _dhandle
	stx     _dhandle+1
	lda     _dhandle
	ora     _dhandle+1
	bne     L005C
	lda     #<(L005F)
	ldx     #>(L005F)
	jsr     pushax
	lda     #$01
	jsr     _err_exit
L005C:	lda     _dhandle
	ldx     _dhandle+1
	jsr     pushax
	ldy     #$08
	jsr     pushwysp
	lda     #<(_dir_block)
	ldx     #>(_dir_block)
	jsr     _dio_read
	tax
	beq     L01B5
	lda     #<(L0068)
	ldx     #>(L0068)
	jsr     pushax
	lda     #$01
	jsr     _err_exit
L01B5:	lda     _dir_block+35
	ldy     #$02
	sta     (sp),y
	lda     _dir_block+36
	dey
	sta     (sp),y
	tya
	sta     (sp)
L01B7:	lda     (sp)
	ldy     #$01
	cmp     (sp),y
	bne     L0079
	lda     _dir_block+2
	ldx     _dir_block+2+1
	ldy     #$03
	jsr     staxysp
	ldy     #$04
	lda     (sp),y
	dey
	ora     (sp),y
	bne     L007D
	lda     #$46
	jsr     __mappederrno
	lda     #<(L0082)
	ldx     #>(L0082)
	jsr     pushax
	lda     #$01
	jsr     _err_exit
L007D:	lda     _dhandle
	ldx     _dhandle+1
	jsr     pushax
	ldy     #$08
	jsr     pushwysp
	lda     #<(_dir_block)
	ldx     #>(_dir_block)
	jsr     _dio_read
	tax
	beq     L01B9
	lda     #<(L008B)
	ldx     #>(L008B)
	jsr     pushax
	lda     #$01
	jsr     _err_exit
	lda     #$00
L01B9:	sta     (sp)
L0079:	lda     (sp)
	jsr     pusha0
	ldy     #$04
	lda     (sp),y
	jsr     tosumula0
	clc
	adc     #<(_dir_block+4)
	sta     _dir_entry
	txa
	adc     #>(_dir_block+4)
	sta     _dir_entry+1
	clc
	lda     #$01
	adc     (sp)
	sta     (sp)
	lda     _dir_entry+1
	sta     ptr1+1
	lda     _dir_entry
	sta     ptr1
	ldx     #$00
	lda     (ptr1)
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	jeq     L01B7
	lda     _dir_entry+1
	sta     ptr1+1
	lda     _dir_entry
	sta     ptr1
	lda     (ptr1)
	and     #$0F
	ldy     #$09
	cmp     (sp),y
	jne     L01B7
	txa
	iny
	cmp     (sp),y
	jne     L01B7
	lda     _dir_entry
	ldx     _dir_entry+1
	ina
	bne     L0097
	inx
L0097:	jsr     pushax
	ldy     #$10
	jsr     pushwysp
	ldy     #$0E
	jsr     ldaxysp
	jsr     _strncasecmp
	stx     tmp1
	ora     tmp1
	jne     L01B7
	ldy     #$04
	jsr     ldaxysp
	ldy     #$11
	jmp     addysp

.endproc

; ---------------------------------------------------------------
; int __near__ __cdecl__ main (int, __near__ unsigned char * *)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

	ldy     #$5B
	jsr     subysp
	ldy     #$5E
	jsr     ldaxysp
	cmp     #$02
	txa
	sbc     #$00
	bvs     L00A0
	eor     #$80
L00A0:	bpl     L009E
	ldy     #$5C
	jsr     ldaxysp
	ldy     #$03
	jsr     ldaxidx
	bra     L01C2
L009E:	lda     #<(L00A6)
	ldx     #>(L00A6)
	jsr     pushax
	ldy     #$02
	jsr     _printf
	lda     #$0B
	jsr     leaa0sp
	jsr     _gets
L01C2:	ldy     #$09
	jsr     staxysp
	jsr     _get_dir_entry
	ldy     #$07
	jsr     staxysp
	lda     _dhandle
	ldx     _dhandle+1
	jsr     pushax
	lda     _dir_entry
	ldx     _dir_entry+1
	ldy     #$12
	jsr     pushwidx
	lda     #<(_index_block)
	ldx     #>(_index_block)
	jsr     _dio_read
	tax
	beq     L01BD
	lda     #<(L00B4)
	ldx     #>(L00B4)
	jsr     pushax
	lda     #$01
	jsr     _err_exit
L01BD:	stz     ptr1+1
	lda     _index_block
	pha
	lda     _index_block+256
	ora     ptr1+1
	tax
	pla
	ldy     #$05
	jsr     staxysp
	lda     _dhandle
	ldx     _dhandle+1
	jsr     pushax
	ldy     #$0A
	jsr     pushwysp
	lda     #<(_header_block)
	ldx     #>(_header_block)
	jsr     _dio_read
	tax
	beq     L01BF
	lda     #<(L00C1)
	ldx     #>(L00C1)
	jsr     pushax
	lda     #$01
	jsr     _err_exit
	lda     #$00
L01BF:	ldy     #$04
L01BC:	sta     (sp),y
	cmp     #$03
	bcs     L01C0
	lda     (sp),y
	tay
	lda     _header_block+2,y
	jsr     pusha0
	ldy     #$06
	lda     (sp),y
	tay
	lda     _info_signature,y
	jsr     tosicmp0
	beq     L00C6
	lda     #<(L00D4)
	ldx     #>(L00D4)
	jsr     pushax
	lda     #$00
	jsr     _err_exit
L00C6:	ldy     #$04
	clc
	lda     #$01
	adc     (sp),y
	bra     L01BC
L01C0:	lda     _header_block+384
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	cmp     #$02
	bne     L00D7
	lda     #<(L00DB)
	ldx     #>(L00DB)
	jsr     pushax
	ldy     #$02
	jsr     _printf
	lda     #<(_index_block)
	ldx     #>(_index_block)
	jsr     pushax
	lda     #<(_index_block+1)
	ldx     #>(_index_block+1)
	jsr     pushax
	ldx     #$00
	lda     #$FD
	jsr     _memmove
	lda     #<(_index_block+256)
	ldx     #>(_index_block+256)
	jsr     pushax
	lda     #<(_index_block+257)
	ldx     #>(_index_block+257)
	jsr     pushax
	ldx     #$00
	lda     #$FD
	jsr     _memmove
	ldx     #$00
	lda     _header_block+405
	jsr     aulong
	jsr     axulong
	jsr     pusheax
	ldx     #$00
	lda     _header_block+406
	jsr     aulong
	jsr     axulong
	ldy     sreg
	sty     sreg+1
	stx     sreg
	tax
	lda     #$00
	jsr     tosoreax
	jsr     pusheax
	ldx     #$00
	lda     _header_block+407
	jsr     aulong
	jsr     axulong
	stx     sreg+1
	sta     sreg
	lda     #$00
	tax
	jsr     tosoreax
	jsr     steax0sp
	jmp     L00F3
L00D7:	jsr     decsp7
	lda     #$00
	jsr     pusha
	lda     #<(L00F6)
	ldx     #>(L00F6)
	jsr     pushax
	ldy     #$02
	jsr     _printf
	lda     #$01
	ldy     #$0C
	sta     (sp),y
	ldx     #$00
	stz     sreg
	stz     sreg+1
	txa
	ldy     #$08
	jsr     steaxysp
L00FC:	ldy     #$0C
	lda     (sp),y
	tay
	lda     _index_block,y
	jsr     pusha0
	ldy     #$0E
	lda     (sp),y
	tay
	ldx     _index_block+256,y
	lda     #$00
	jsr     tosorax
	ldy     #$06
	jsr     staxysp
	ldy     #$0C
	clc
	lda     #$01
	adc     (sp),y
	sta     (sp),y
	ldy     #$06
	lda     (sp),y
	iny
	ora     (sp),y
	bne     L010C
	jmp     L00FD
L010A:	lda     (sp)
	tay
	lda     #$FF
	sta     _master_block,y
	lda     (sp)
	tay
	lda     #$FF
	sta     _master_block+256,y
	clc
	lda     #$01
	adc     (sp)
	sta     (sp)
L010C:	lda     (sp)
	tay
	lda     _header_block+256,y
	cmp     #$FF
	beq     L010A
	lda     (sp)
	tax
	ldy     #$06
	lda     (sp),y
	sta     _master_block,x
	lda     #<(_master_block+256)
	ldx     #>(_master_block+256)
	clc
	adc     (sp)
	bcc     L0120
	inx
L0120:	sta     ptr1
	stx     ptr1+1
	iny
	lda     (sp),y
	sta     (ptr1)
	clc
	lda     #$01
	adc     (sp)
	sta     (sp)
	lda     _dhandle
	ldx     _dhandle+1
	jsr     pushax
	ldy     #$0B
	jsr     pushwysp
	lda     #<(_vlir_block)
	ldx     #>(_vlir_block)
	jsr     _dio_read
	tax
	beq     L01C1
	lda     #<(L012A)
	ldx     #>(L012A)
	jsr     pushax
	lda     #$01
	jsr     _err_exit
	ldx     #$00
L01C1:	lda     _vlir_block+255
	jsr     aulong
	jsr     axulong
	jsr     pusheax
	ldx     #$00
	lda     _vlir_block+511
	jsr     aulong
	jsr     axulong
	ldy     sreg
	sty     sreg+1
	stx     sreg
	tax
	lda     #$00
	jsr     tosoreax
	jsr     pusheax
	ldx     #$00
	lda     _vlir_block+254
	jsr     aulong
	jsr     axulong
	stx     sreg+1
	sta     sreg
	lda     #$00
	tax
	jsr     tosoreax
	jsr     pusheax
	ldx     #$00
	lda     _vlir_block+510
	jsr     aulong
	jsr     axulong
	sta     sreg+1
	lda     #$00
	tax
	stz     sreg
	jsr     tosoreax
	ldy     #$02
	jsr     steaxysp
	lda     #<(L0138)
	ldx     #>(L0138)
	jsr     pushax
	ldy     #$02
	ldx     #$00
	lda     (sp),y
	jsr     decax1
	jsr     pushax
	ldy     #$09
	jsr     ldeaxysp
	jsr     pusheax
	ldy     #$08
	jsr     _printf
	ldy     #$05
	jsr     ldeaxysp
	jsr     pusheax
	ldx     #$01
	lda     #$FF
	jsr     tosadd0ax
	txa
	ldx     sreg
	ldy     sreg+1
	sty     sreg
	stz     sreg+1
	jsr     shreax1
	ldy     #$01
	sta     (sp),y
	lda     #<(_vlir_block)
	ldx     #>(_vlir_block)
	jsr     pushax
	lda     #<(_index_block)
	ldx     #>(_index_block)
	ldy     #$0E
	clc
	adc     (sp),y
	bcc     L0145
	inx
L0145:	jsr     pushax
	ldy     #$05
	lda     (sp),y
	ldx     #$00
	jsr     _memcpy
	lda     #<(_vlir_block+256)
	ldx     #>(_vlir_block+256)
	jsr     pushax
	lda     #<(_index_block+256)
	ldx     #>(_index_block+256)
	ldy     #$0E
	clc
	adc     (sp),y
	bcc     L014C
	inx
L014C:	jsr     pushax
	ldy     #$05
	lda     (sp),y
	ldx     #$00
	jsr     _memcpy
	ldy     #$01
	lda     (sp),y
	ldy     #$0C
	clc
	adc     (sp),y
	sta     (sp),y
	lda     _dhandle
	ldx     _dhandle+1
	jsr     pushax
	ldy     #$0B
	jsr     pushwysp
	lda     #<(_vlir_block)
	ldx     #>(_vlir_block)
	jsr     _dio_write
	tax
	beq     L0150
	lda     #<(L0156)
	ldx     #>(L0156)
	jsr     pushax
	lda     #$01
	jsr     _err_exit
L0150:	ldy     #$05
	jsr     ldeaxysp
	ldy     #$08
	jsr     laddeqysp
	jmp     L00FC
L00FD:	lda     #<(_index_block)
	ldx     #>(_index_block)
	jsr     pushax
	lda     #<(_master_block)
	ldx     #>(_master_block)
	jsr     pushax
	ldx     #$02
	lda     #$00
	jsr     _memcpy
	jsr     incsp8
L00F3:	lda     #<(L015E)
	ldx     #>(L015E)
	jsr     pushax
	ldy     #$05
	jsr     ldeaxysp
	jsr     pusheax
	ldy     #$06
	jsr     _printf
	lda     (sp)
	sta     _index_block+255
	jsr     ldeax0sp
	stx     _index_block+511
	jsr     ldeax0sp
	lda     sreg
	sta     _index_block+254
	jsr     ldeax0sp
	lda     sreg+1
	sta     _index_block+510
	lda     _dhandle
	ldx     _dhandle+1
	jsr     pushax
	lda     _dir_entry
	ldx     _dir_entry+1
	ldy     #$12
	jsr     pushwidx
	lda     #<(_index_block)
	ldx     #>(_index_block)
	jsr     _dio_write
	tax
	beq     L0171
	lda     #<(L0177)
	ldx     #>(L0177)
	jsr     pushax
	lda     #$01
	jsr     _err_exit
L0171:	lda     _dir_entry+1
	sta     ptr1+1
	lda     _dir_entry
	sta     ptr1
	lda     _header_block+384
	sta     (ptr1)
	lda     _dir_entry
	ldx     _dir_entry+1
	ina
	bne     L017E
	inx
L017E:	jsr     pushax
	lda     #<(_header_block+385)
	ldx     #>(_header_block+385)
	jsr     pushax
	ldx     #$00
	lda     #$0F
	jsr     _memcpy
	lda     _dir_entry+1
	sta     ptr1+1
	lda     _dir_entry
	sta     ptr1
	lda     _header_block+400
	ldy     #$10
	sta     (ptr1),y
	lda     _dir_entry+1
	sta     ptr1+1
	lda     _dir_entry
	sta     ptr1
	lda     (sp)
	ldy     #$15
	sta     (ptr1),y
	lda     _dir_entry
	ldx     _dir_entry+1
	jsr     pushax
	ldy     #$05
	jsr     ldeaxysp
	txa
	ldy     #$16
	jsr     staspidx
	lda     _dir_entry
	ldx     _dir_entry+1
	jsr     pushax
	ldy     #$05
	jsr     ldeaxysp
	lda     sreg
	ldy     #$17
	jsr     staspidx
	lda     _dir_entry
	ldx     _dir_entry+1
	jsr     pushax
	lda     _header_block+408+3
	sta     sreg+1
	lda     _header_block+408+2
	sta     sreg
	ldx     _header_block+408+1
	lda     _header_block+408
	ldy     #$18
	jsr     steaxspidx
	lda     _dir_entry+1
	sta     ptr1+1
	lda     _dir_entry
	sta     ptr1
	lda     _header_block+412
	ldy     #$1C
	sta     (ptr1),y
	lda     _dir_entry+1
	sta     ptr1+1
	lda     _dir_entry
	sta     ptr1
	lda     _header_block+413
	iny
	sta     (ptr1),y
	lda     _dir_entry+1
	sta     sreg+1
	lda     _dir_entry
	sta     sreg
	ldy     #$06
	jsr     ldaxysp
	ldy     #$1F
	sta     (sreg),y
	iny
	txa
	sta     (sreg),y
	lda     _dir_entry
	ldx     _dir_entry+1
	jsr     pushax
	lda     _header_block+417+3
	sta     sreg+1
	lda     _header_block+417+2
	sta     sreg
	ldx     _header_block+417+1
	lda     _header_block+417
	ldy     #$21
	jsr     steaxspidx
	lda     _dhandle
	ldx     _dhandle+1
	jsr     pushax
	ldy     #$0C
	jsr     pushwysp
	lda     #<(_dir_block)
	ldx     #>(_dir_block)
	jsr     _dio_write
	tax
	beq     L0199
	lda     #<(L019F)
	ldx     #>(L019F)
	jsr     pushax
	lda     #$01
	jsr     _err_exit
L0199:	lda     _dhandle
	ldx     _dhandle+1
	jsr     _dio_close
	tax
	beq     L01A2
	lda     #<(L01A6)
	ldx     #>(L01A6)
	jsr     pushax
	lda     #$01
	jsr     _err_exit
L01A2:	lda     #<(L01AA)
	ldx     #>(L01AA)
	jsr     pushax
	lda     _dir_entry+1
	sta     ptr1+1
	lda     _dir_entry
	sta     ptr1
	lda     (ptr1)
	and     #$0F
	jsr     pusha0
	lda     _dir_entry
	ldx     _dir_entry+1
	ina
	bne     L01AE
	inx
L01AE:	jsr     pushax
	ldy     #$06
	jsr     _printf
	jsr     _getchar
	ldx     #$00
	txa
	ldy     #$5F
	jmp     addysp

.endproc

