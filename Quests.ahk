; 夜神模拟器 width:360 height:670
#IfWinActive ahk_class Qt5QWindowIcon
^z::
	InputBox, Var, Quest Selection, Enter the which quest you want to choose.
	outer:
	Loop
	{	
		if Var = 1
			Click 275, 568
		if Var = 2
			Click 275, 488
		if Var = 3
			Click 275, 411
		if Var = 4
			Click 275, 329
		if Var = 5
			Click 275, 250
			
			
		Sleep 10000  	
		Click 170, 580	; click play button
		Sleep 30000 
		PixelGetColor, center_color, 180, 356, RGB
		;MsgBox %center_color%
		if (center_color = 0x000000)
		{
			MsgBox No Energy!
			break
		}
		
		
		Loop
		{	Click 182, 576 ; click AI button
			Sleep 5000
			PixelGetColor, blackbox_color, 70, 530, RGB
			PixelGetColor, gray_box_color, 21, 517, RGB
			PixelGetColor, result_color, 148, 71, RGB
			
			PixelGetColor, rewind_black, 60, 445, RGB
			PixelGetColor, rewind_gray, 40, 448, RGB
			
			if (rewind_black = 0x000000 and rewind_gray = 0x212425) ; Use Rewind Box
			{	
				sleep 10000
				Click 232, 445 ; click no button
				sleep 30000
				Click 180, 611 		; click Next button
				Sleep, 15000	
				break
			}
			
			; result win interface: result is white while the bottom box is black
			if (blackbox_color = 0x000000 and result_color = 0xEBEBEB and gray_box_color = 0x212425)
			{	
				sleep 30000
				Loop, 5 ; one more time because of possible chance of having a large blue
				{	
					Click 180, 611 		; click Next button
					Sleep, 15000	
				}
				break
			}
		}
		Sleep, 30000
	}
Return

#IfWinActive


^s::Exitapp



