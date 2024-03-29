;; sprite drawing routine.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; For horizontal scrolling games, extra attention has to be taken to draw 
;;; sprites off screen if they are no longer in the camera render area.


    ;; Don't use camX on screen 8 (except for the eye)
    LDA screenType
    CMP #$08
    BEQ +
        LDA camX
        JMP +gotCamOffset
    +
    
    ;; Draw the eye of the boss in the right spot on the x-axis.
    LDA Object_type,x
    CMP #$18
    BNE +skipEye
        LDA camX
        CMP #$45
        BCS +
            LDA #$F7
            STA Object_x_hi,x
            LDA #$F7
            STA Object_y_hi,x
            JMP +skipEye
        +
        
        LDA #$60
        STA Object_y_hi,x

        
        LDA bossPhase
        CMP #$01
        BEQ +phase1
        CMP #$0C
        BEQ +phaseC
        
        +defaultPhase:
            LDA #$3D
            JMP +gotOffset
        +phase1:
            LDA #$3C
            JMP +gotOffset
        +phaseC:
            LDA #$3E
        +gotOffset:
        
        SEC
        SBC camX
        BMI +
            LDA #$F7
            STA Object_y_hi,x
            LDA #$00
        +
        STA Object_x_hi,x
    +skipEye:

    LDA #$00
    
    +gotCamOffset:
    STA tempCamX


	LDA gameHandler
	AND #%01000000
	BEQ +
        JMP doneDrawingThisSprite
    +
	
    
    ;; If player, draw face
    CPX player1_object
    BEQ +
        JMP +faceDone
    +
    
    GetActionStep player1_object
    CMP #$06
    BEQ +faceDone
    
        ;; Check (player and global) sprite drawing bit
        LDA ScreenFlags00
        AND #$81
        BEQ +
            JMP doneDrawingThisSprite
        +


        LDA Object_direction,x
        AND #%00000100
        BNE +
            ;; facing right
            LDA #$01
            STA temp
            LDA Object_x_hi,x
            CLC
            ADC #$0A
            JMP +storeTempX
        +

        ;facing left
        LDA #$41
        STA temp
        LDA Object_x_hi,x
        SEC
        SBC #$02
        
        +storeTempX:
        SEC
        SBC tempCamX
        STA tempx

        LDA Object_frame,x
        CLC
        ADC #$01
        AND #%00000010
        BEQ +
            ;; high frame
            LDA Object_y_hi,x
            CLC
            ADC #$04
            JMP +storeTempY
        +

        ;; low frame
        LDA Object_y_hi,x
        CLC
        ADC #$05
        
        +storeTempY:
        STA tempy
        DrawSprite tempx, tempy, #$10, temp

    +faceDone:


;; This routine will work together with the luts created by the old object animation tool.
;; Due to that, it must be included in the same bank with luts. 

	;; We will use tempA to track the x value of a tile.
	;; We will use tempB to track the y value of a tile.
	;; X is the index of the object.
	;; Y is the index of the object type.
	
	;; ObjectSize,y is the size in tiles for this version of drawing.
	;; 00xxxyyy
	;; where x = the width in tiles (1-7)
	;; where y = the height in tiles (1-7)
	;; for both, zero is an impossible value.
	
	;; Object_frame,x keeps track of actions and animations.
	;; 00xxxyyy
	;; where x = animation frame
	;; where y = action frame

	LDA Object_type,x
	STA tempD
	
	LDA #$00
	STA animationFrameHolder ;; reset the animation frame holder.


	LDY Object_type,x ;; for lut lookups.
	
	LDA Object_x_hi,x
	SEC
	SBC tempCamX ;; is using scrolling
	STA tempA
	LDA Object_y_hi,x
	sec
	SBC camY
	STA tempB
	LDY Object_type,x
	
	LDA ObjectSize,y
	AND #%00000111
	STA tempy ;; used for keeping track of draw width in tiles
	
	; LDA ObjectSize,y
	; LSR
	; LSR
	; ;LSR  - remove one division by two (add one multiply *2)
		; ;; to allow for the fact each tile value is
		; ;; two bytes...tile + attributes.
	; AND #%00000111
	; STA tempx ;; used for keeping track of draw height in tiles
	
	; LDA ObjectSize,y
	; LSR
	; LSR
	; STA tempx ;;; used for row count.
	
	LDA ObjectSize,y
	LSR
	LSR
	LSR
	AND #%00000111
	;STA tempx
	
	ASL
	STA tempx ;;; used for row count.
	
	LDA Object_frame,x
	AND #%00000111
	STA temp ;; used to hold animation frame.
	LDA Object_frame,x
	LSR
	LSR
	LSR
	AND #%00000111
	STA temp1 ;; used to hold action frame.
	
	LDA Object_direction,x
	AND #%00000111 
	STA temp2 ;; facing direction.
	
		;;; So now, for each object, we get the type of object, the type of animation currently displayed (indexed)
		;;; and the direction that it is facing.  That address gives us our tile table.
		
		;; How to minimize the indirectly addressed reads here...
			
		TXA
		PHA
		LDA #$00
		STA tempC
		LDY tempy
		LDX tempx
		getTotalTileNumberLoop:
			INC tempC
			DEX
			DEX
			BEQ nowCheckHeightForTileNumber
			JMP getTotalTileNumberLoop
		nowCheckHeightForTileNumber:
			LDX tempx
			DEY
			BNE getTotalTileNumberLoop
	
		;;; done.  Number of tiles is in tempC
		;;; this is needed for the frame offset.
		;;; now tempc multiplied by the current animation frame number (plus 1, which holds "number of frames")
		;;; will give the starting position of this animation array.
		
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;; Next, we have to check to see what action state we are on, and what animation should be attached.
		;; This is stored in the high nibble of the animSpeedTable.
		;; So, you take the object type number and multiply it by 8 (since each object has 8 states)
		;; Then the current animation settings for that object are lain out, so you find
		;; a position *action number* steps forward from that.
		;; The high nibble of that value gives you which animation number you should look at.
		
		;; Take that animation number and multiply it by 8 (for all 8 potential directions), and that is the index passed
		;; the ObjectPointer (in ObjectPointers.pnt) we should use.
		
		;; temp holds the animation frame
		;; temp1 holds the action frame.
		LDY tempD ;; Object type
			;;; x is corrupted by the last loop, and isn't restored until below.

		LDA ObjectAnimationSpeedTableLo,y
		STA temp16
		LDA ObjectAnimationSpeedTableHi,y
		STA temp16+1
		
		
		
		LDY temp1 ;; the current action number.

		LDA (temp16),y ;; this now points to the proper spot on the anim speed table.
						;; we need to capture that number.
						;; Its high nibble is the "animation type"
			
		LSR
		LSR
		LSR
		LSR
		
		STA tempz ;; no longer used for anything, so we can use it to
				;; hold the animation type number.
		
		
		LDA temp
		PHA 
		
		
		LDX temp ;; the animation frame.
		LDA tempC
		ASL
		STA temp
		LDA #$00
		loop_doGetAnimTileIndex:
			CPX #$00
			BEQ skipGetAnimTileIndex
			;LDA tempC
			CLC
			ADC temp
			STA tempC
			DEX
			JMP loop_doGetAnimTileIndex
		skipGetAnimTileIndex:
		CLC
		ADC #$01
		STA tempC
			;;; NOW we have the full offset value for where this object should currently start drawing its sprite.
		PLA
		STA temp
		
		PLA
		TAX
		
		;; Next, we have to do a few indirect look ups to get the actual correct table read.
		LDY Object_type,x
		LDA ObjectLoSpriteAddressLo,y
		STA tempPointer_lo
		LDA ObjectLoSpriteAddressHi,y
		STA tempPointer_lo+1
		
		LDA ObjectHiSpriteAddressLo,y
		STA tempPointer_hi
		LDA ObjectHiSpriteAddressHi,y
		STA tempPointer_hi+1
		
		;;;; use the direction (temp2) to get the right starting point.
		;;;; add it to 8*the animation number.
		LDA tempz
	
		ASL
		ASL
		ASL ;; the animation number offset.
		CLC
		ADC temp2 ;; the direction.
		TAY
		
		LDA (tempPointer_lo),y
		STA temp16
		LDA (tempPointer_hi),y
		STA temp16+1
		
		
		LDY #$00
		LDA (temp16),y
		STA animationFrameHolder ;; holds the total number of animation frames for this type of animation.
		
		
		LDA Object_type,x
		CMP #$10
		BCC dontAddTilesetOffset
			;; this offset is added for monsters.
			LDA #$80
			JMP gotTilesetOffset
		dontAddTilesetOffset:
			LDA #$00	
		gotTilesetOffset:
			STA temp3 ;; tile offset - add this to the tile value, for now.
		
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;; ACTUALLY DRAW THE SPRITES.
		LDY tempC ;; right now, this is the offset to find the right sprite index to draw from 
					; the tile table.
		
		LDA tempx ;; right now, this is the x value of the object.
		STA temp1 ;; store it into temp1, so that we can
					; restore the left most position 
					; when we're done drawing a row. 
		LDA tempy ;; right now, this is the y value of the object.
		STA temp2 ;; store it to temp2, so that we can 
					; use it to count the drawn columns.
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;; DRAW!
	;; temp A will be the x value of the sprite being drawn.
	;; we will need to factor where A is compared to camX,
	;; and skip the drawing if off screen.

	doDrawSpritesLoop:
	
			LDA (temp16),y
			clc
			ADC temp3
			STA tempC ;; the calculated table position, with offest.
						;; tempC becomes the "tile to draw".
			INY
			LDA (temp16),y 
			STA tempD ;; the next value is the attribute to draw.
            
            LDA screenType
            CMP #$05
            BNE +
                LDA tempD
                ORA #%00100000
                STA tempD
            +
            
			INY 		;; increasing again sets us up for the next sprite.
						;; now we can use tempA-D to draw our sprite using the macro.
						
            ;; If sprite is blank, do not draw
            LDA tempC
            BEQ thisTileIsOffScreen
            CMP #$80
            BEQ thisTileIsOffScreen

			;;;;;;;;;;;; Here, we need to evaluate if this tile should be drawn
			;;;;;;;;;;;; based on the comparison to camX.
			JSR evaluateTileAgainstCameraPosition
			BEQ thisTileIsInCamRange
				JMP thisTileIsOffScreen
			thisTileIsInCamRange	
			DrawSprite tempA, tempB, tempC, tempD
		
		thisTileIsOffScreen:
		;;;;;;;;;;; check to see if the row is finished.
		DEC temp1
		DEC temp1
		LDA temp1
		BEQ doneWithSpriteRow
			;;;; if the row is not finished, add 8 and loop.
			LDA tempA
			CLC
			ADC #$08
			STA tempA
			JMP doDrawSpritesLoop
		doneWithSpriteRow
			;;;; reset the draw position to the left 
			;;;; and the row counter to width again.
			LDA tempx
			STA temp1
			LDA Object_x_hi,x
			sec
			SBC tempCamX
			STA tempA
			;;; check to see if the column is finished.
			DEC temp2
			LDA temp2
			BEQ doneWithSpriteColumn
			;;; if the column is not finished, add 8 and loop.
			LDA tempB
			CLC
			ADC #$08
			STA tempB
			JMP doDrawSpritesLoop
			
		doneWithSpriteColumn:
	doneDrawingThisSprite:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	RTS
	
	
	
	
	
	
		
evaluateTileAgainstCameraPosition:

    ;; Do not evaluate on boss screen
    LDA screenType
    CMP #$08
    BNE +
        LDA #$00
        RTS
    +

	LDA Object_x_hi,x
	STA pointer
	LDA Object_screen,x
	AND #%00001111
	STA pointer+1
	
	LDA pointer
	
				
	Compare16 pointer+1, pointer, camX_hi, camX
	; arg0 = high byte of first value
	; arg1 = low byte of first value
	; arg2 = high byte of second value
	; arg3 = low byte of second value

	+
	JMP checkRightForDrawingOffCamera
	
	++		
		LDA #$01		
		RTS
checkRightForDrawingOffCamera
	LDA Object_x_hi,x
	CLC
	ADC self_right
	STA pointer
	LDA Object_screen,x
	ADC #$00
	AND #%00001111
	STA pointer+1

	LDA camX
			
	STA pointer5
	LDA camX+1
	clc
	ADC #$01
	STA temp
	Compare16 pointer+1, pointer, temp, pointer5; camX
	+
	LDA #$01
	rts
	++
	LDA #$00
	rts
	