#z::
	; Initialize the id and class of the simulator
	WinGet, target_id, ID, A
	WinGetClass, target_class, ahk_id %target_id%
	WinGetPos, , , Width, Height, ahk_id %target_id%
	;MsgBox, The active window's ID is "%target_id%"`n Class is "%target_class%`n Width is %Width%`n Height is %Height%.

	Rate_x := Width  / 360
	Rate_y := Height / 670
Return


getColor(x, y)
{
	global Rate_x
	global Rate_y
	tmp_x := Rate_x * x
	tmp_y := Rate_y * y
	PixelGetColor, return_color, %tmp_x%, %tmp_y%, RGB
	return return_color
}
	

; check whether the class exists.
#If WinExist("ahk_class" . target_class)
{
	#s::
		InputBox, Var, Quest Selection, Enter the which quest you want to choose.
		Sleep, 2000
			
		outer:
		Loop
		{	
			tmp_x := 275*Rate_x
			if Var = 1
				tmp_y := 568*Rate_y	
			if Var = 2
				tmp_y := 488*Rate_y
			if Var = 3
				tmp_y := 411*Rate_y
			if Var = 4
				tmp_y := 329*Rate_y
			if Var = 5
				tmp_y := 250*Rate_y
			ControlClick, x%tmp_x% y%tmp_y%
			Sleep 5000
				
			
			tmp_x := Rate_x*170
			tmp_y := Rate_y*580
			ControlClick, x%tmp_x% y%tmp_y%		; click play button
			Sleep 5000 
			WinActivate, ahk_id %target_id%
			center_color := getColor(180, 356)
				
			if (center_color = 0x000000)
			{
				; MsgBox No Energy!
				; break
				tmp_x := Rate_x*232
				tmp_y := Rate_y*445
				ControlClick, x%tmp_x% y%tmp_y%		; click NO button
				Sleep 5000
				tmp_x := Rate_x*34
				tmp_y := Rate_y*640
				ControlClick, x%tmp_x% y%tmp_y%		; click BACK button
				Sleep 5000
					
				Sleep 3600000		; wait one hour
				; Sleep 330000		; wait until energy is full
				Continue
			}
				
			Sleep 20000 ; wait until the game begin
				
			Loop
			{	
				tmp_x := Rate_x*182
				tmp_y := Rate_y*576
				ControlClick, x%tmp_x% y%tmp_y%		; click AI button
				Sleep 3000
				
				WinActivate, ahk_id %target_id%
				blackbox_color := getColor(70, 530)
				gray_box_color := getColor(23, 517) 
					
				rewind_black   := getColor(60, 445)
				rewind_gray    := getColor(40, 448)
					
				if (rewind_black = 0x000000 and rewind_gray = 0x212425) ; Rewind Message
				{	
					sleep 5000
					tmp_x := Rate_x*232
					tmp_y := Rate_y*445
					ControlClick, x%tmp_x% y%tmp_y%	; click NO button
					sleep 40000						; since here is a long connection time 
					tmp_x := Rate_x*180
					tmp_y := Rate_y*611
					ControlClick, x%tmp_x% y%tmp_y%	; click Next button	
					Sleep 15000	
					break
				}
					
				; result win interface: result is white while the bottom box is black
				if (blackbox_color = 0x000000 and gray_box_color = 0x212425)
				{	
					sleep 40000 ; since here is a long connection time 
					Loop, 5 ; one more time because of possible chance of having a larger blue
					{	
						tmp_x := Rate_x*180
						tmp_y := Rate_y*611
						ControlClick, x%tmp_x% y%tmp_y%	; click button respectively
						Sleep, 15000	
					}
					break
				}
			}
				
			Sleep, 20000
		}

	Return
	
}



#p::Pause

#r::Reload

#e::Exitapp




