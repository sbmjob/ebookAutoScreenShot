display dialog "スクショする回数を入力してください。" default answer "5" with title "Kindle Version"
set screenShotNumber to text returned of result

display dialog "保存ファイル名の開始番号を入力してください。" default answer "0"
set startFileNumber to text returned of result

display dialog "右開き？左開き？" buttons {"左", "右"} default button 2 with title "Kindle Version"
set temp to result
set btn to button returned of temp

set dFolder to "~/Desktop/screencapture/" --デスクトップに画像保存用フォルダを事前準備しておく

repeat with p from 1 to screenShotNumber
	
	tell application "Kindle"
		
		activate
		
		tell application "System Events"
			
			
			if p = 1 then
				delay 1
				do shell script ("screencapture " & dFolder & startFileNumber & ".png")
				set startFileNumber to startFileNumber + 1
			end if
			
			--key code 123
			if btn = "右" then
				keystroke (ASCII character 29) -- ページ右送り (カーソルキー)
			else --左
				keystroke (ASCII character 28) -- ページ左送り (カーソルキー)
			end if
			
			delay 1
			do shell script ("screencapture " & dFolder & startFileNumber & ".png")
			set startFileNumber to startFileNumber + 1
			delay (random number from 1 to 2)
			
		end tell
		
	end tell
	
end repeat

tell me
	activate
	display alert "処理が終了しました。"
end tell

