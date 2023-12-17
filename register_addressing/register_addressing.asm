#include 	<p16Lf1826.inc>		; Include file locate at defult directory
;

temp		equ	0x25
;***************************************
;           Program start              *
;***************************************
			org 	0x00		; reset vector
			
			clrf	temp
			clrw
			movlw	28
			movwf	temp
			asrf	temp,1
			rlf		temp,0
			lsrf	temp,1
			lsrf 	temp,0
			rrf		temp,1
			swapf 	temp,0
			goto	$
			end