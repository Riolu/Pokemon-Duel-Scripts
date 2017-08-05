; 夜神模拟器 width:360 height:670
#IfWinActive ahk_class Qt5QWindowIcon
^z::
	outer:
	Loop
	{
		Click 270, 250 	; select the level
		Sleep, 10000  	
		Click 170, 580	; click play button
		Sleep, 30000 
		PixelGetColor, center_color, 180, 356, RGB
		;MsgBox %center_color%
		if (center_color = 0x000000)
		{
			MsgBox No Energy!
			break
		}
		
		
		Loop
		{	Click 182, 576 ; click AI button
			Sleep, 5000
			PixelGetColor, blackbox_color, 70, 530, RGB
			PixelGetColor, gray_box_color, 21, 517, RGB
			PixelGetColor, result_color, 148, 71, RGB
			
			; result win interface: result is white while the bottom box is black
			if (blackbox_color = 0x000000 and result_color = 0xEBEBEB and gray_box_color = 0x212425)
			{	
				sleep 30000
				Loop, 4
				{	
					Click 182, 627 		; click Next button
					Sleep, 10000	
				}
				break
			}
		}
		Sleep, 30000
	}
Return

^s::Pause

#IfWinActive



