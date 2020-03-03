display dialog "スクショする回数を入力してください。" default answer "5" with title "Safari Version"
set screenShotNumber to text returned of result

display dialog "右開き？左開き？" buttons {"左", "右"} default button 2
set temp to result
set btn to button returned of temp

set dFolder to "~/Desktop/screencapture/" --デスクトップに画像保存用フォルダを事前準備しておく

repeat with p from 1 to screenShotNumber
	
	tell application "Safari"
		
		activate
		
		tell application "System Events"
			
			
			if p = 1 then
				delay 1
				do shell script ("screencapture " & dFolder & "0.png")
			end if
			
			--key code 123
			if btn = "右" then
				keystroke (ASCII character 29) -- ページ右送り (カーソルキー)
			else --左
				keystroke (ASCII character 28) -- ページ左送り (カーソルキー)
			end if
			
			delay 1
			do shell script ("screencapture " & dFolder & p & ".png")
			delay 1
			
		end tell
		
	end tell
	
end repeat

tell me
	activate
	display alert "処理が終了しました。"
end tell

