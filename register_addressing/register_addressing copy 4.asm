#include 	<p16Lf1826.inc>		; Include file locate at defult directory
;

temp		equ	0x25
count1		equ h'20'
count2		equ h'21'
count3		equ h'22'
;***************************************
;           Program start              *
;***************************************
			org 	0x00		; reset vector
			
			clrf	temp
			clrw
			movlw	1
			movwf	temp
			movwf	PORTB
loop1		lslf	temp,1
			movf	temp,0
			movwf	PORTB
			call	delay
			btfss	temp,7
			goto	loop1
loop2		lsrf	temp,1
			movf	temp,0
			movwf	PORTB
			call	delay
			btfss	temp,0
			goto	loop2
			goto	loop1

delay		movlw	.3
			movwf	count1
delay1		clrf	count2
delay2		clrf	count3
delay3		decfsz	count3,1
			goto	delay3
			decfsz	count2,1
			goto	delay2
			decfsz	count1,1
			goto	delay1
			return

			end









			
			
	