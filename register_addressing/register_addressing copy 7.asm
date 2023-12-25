#include 	<p16Lf1826.inc>		; Include file locate at defult directory
;

temp		equ	0x25
;***************************************
;           Program start              *
;***************************************
			org 	0x00		; reset vector
			movlw	03
			clrf	temp
			brw
			movwf	temp
			movlw	01
			movwf	temp
loop		movf	temp, w
			movwf	PORTB
			decfsz	temp, f
			bra		loop
			end