#z::
	; Initialize the id and class of the simulator
	WinGet, target_id, ID, A
	WinGetClass, target_class, ahk_id %target_id%
	WinGetPos, , , Width, Height, ahk_id %target_id%
	;MsgBox, The active window's ID is "%target_id%"`n Class is "%target_class%`n Width is %Width%`n Height is %Height%.
Return
	
	
#If WinExist("ahk_class" . target_class)
{
	#s::
		InputBox, Var, Quest Selection, Enter the which quest you want to choose.
			
		outer:
		Loop
		{	
			;WinActivate, ahk_id %target_id%
				
			if Var = 1
				ControlClick, x275 y568
			if Var = 2
				ControlClick, x275 y488
			if Var = 3
				ControlClick, x275 y411
			if Var = 4
				ControlClick, x275 y329
			if Var = 5
				ControlClick, x275 y250
			Sleep 5000
				
			ControlClick, x170 y580		; click play button
			Sleep 5000 
			PixelGetColor, center_color, 180, 356, RGB
				
			if (center_color = 0x000000)
			{
				; MsgBox No Energy!
				; break
				ControlClick, x232 y445 	; click NO button
				Sleep 5000
				ControlClick, x34 y640 		; click BACK button
				Sleep 5000
					
				Sleep 3600000		; wait one hour
				; Sleep 330000		; wait until energy is full
				Continue
			}
				
			Sleep 20000 ; wait until the game begin
				
			Loop
			{	ControlClick, x182 y576 ; click AI button
				Sleep 3000
					
				PixelGetColor, blackbox_color, 70, 530, RGB
				PixelGetColor, gray_box_color, 21, 517, RGB
				PixelGetColor, result_color, 148, 71, RGB
					
				PixelGetColor, rewind_black, 60, 445, RGB
				PixelGetColor, rewind_gray, 40, 448, RGB
					
				if (rewind_black = 0x000000 and rewind_gray = 0x212425) ; Rewind Message
				{	
					sleep 5000
					ControlClick, x232 y445 		; click NO button
					sleep 40000						; since here is a long connection time 
					ControlClick, x180 y611 		; click Next button
					Sleep 15000	
					break
				}
					
				; result win interface: result is white while the bottom box is black
				if (blackbox_color = 0x000000 and result_color = 0xEBEBEB and gray_box_color = 0x212425)
				{	
					sleep 40000 ; since here is a long connection time 
					Loop, 5 ; one more time because of possible chance of having a larger blue
					{	
						ControlClick, x180 y611 	; click button respectively
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




