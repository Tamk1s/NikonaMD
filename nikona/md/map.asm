; ===========================================================================
; ----------------------------------------------------------------
; Genesis / Pico 68000 map
; ----------------------------------------------------------------

sys_sram	equ	$200000		; Second half of 4MB rom or external RAM, Normal or Save data
z80_cpu		equ	$A00000		; Z80 CPU area, size: $2000
ym_ctrl_1	equ	$A04000		; YM2612 reg 1
ym_data_1	equ	$A04001		; YM2612 reg 2
ym_ctrl_2	equ	$A04002		; YM2612 reg 1
ym_data_2	equ	$A04003		; YM2612 reg 2
sys_io		equ	$A10001		; bits: OVRSEAS(7)|PAL(6)|DISK(5)|VER(3-0)
sys_data_1	equ	$A10003		; Port 1 DATA
sys_data_2	equ	$A10005		; Port 2 DATA
sys_data_3	equ	$A10007		; Modem DATA
sys_ctrl_1	equ	$A10009		; Port 1 CTRL
sys_ctrl_2	equ	$A1000B		; Port 2 CTRL
sys_ctrl_3	equ	$A1000D		; Modem CTRL
z80_bus 	equ	$A11100		; only use bit 0 (bit 8 as WORD)
z80_reset	equ	$A11200		; WRITE only ($0000 reset/$0100 cancel)
md_bank_sram	equ	$A130F1		; Make SRAM visible at $200000
sys_tmss	equ	$A14000		; write "SEGA" here for ver > 0


; !@ PICO addresses
pico_START:			equ $800000
pico_ver:			equ	$800001	;1 byte
pico_btn:			equ	$800003	;~
pico_penX_hi:		equ	$800005	;~
pico_penX_lo:		equ	$800007	;~
pico_penY_hi:		equ	$800009	;~
pico_penY_lo:		equ	$80000B	;~
pico_BookPage:		equ	$80000D	;~
pico_copType:		equ	$80000F	;~
pico_pcm_data:		equ	$800010	;1 word
pico_pcm_ctrl:		equ	$800012	;~
pico_port_1_data:	equ	$800015	;~
pico_port_1_ctrl:	equ	$800017	;~
pico_security_addr:	equ	$800019	;2 odd words

; !@ Copera addresses
copr_ymz263b_a0:	equ	$BFF801	;1 word
copr_ymz263b_d0:	equ	$BFF803	;~
copr_ymz263b_a1:	equ	$BFF805	;~
copr_ymz263b_d1:	equ	$BFF807	;~

copr_ymf262_a0:		equ	$BFF824
copr_ymf262_d0:		equ	$BFF828
copr_ymf262_a1:		equ	$BFF834

copr_ym712b_a0:		equ	$BFF840


;VDP/PSG
vdp_data	equ	$C00000		; video data port
vdp_ctrl	equ	$C00004		; video control port
psg_ctrl	equ	$C00011		; PSG control

; ----------------------------------------------------------------
; Genesis / Mega drive Z80 map
; ----------------------------------------------------------------

zym_ctrl_1	equ	$4000		; YM2612 reg 1
zym_data_1	equ	$4001		; YM2612 reg 2
zym_ctrl_2	equ	$4002		; YM2612 reg 1
zym_data_2	equ	$4003		; YM2612 reg 2
zbank		equ	$6000		; Z80 ROM BANK: %XXXXXXXX X0000000 00000000 (write 9 times)
; zvdp_data	equ	$7F00		; VDP data port
; zvdp_ctrl	equ	$7F04		; VDP control port
zpsg_ctrl	equ	$7F11		; PSG control
