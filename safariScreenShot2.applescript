display dialog "�X�N�V������񐔂���͂��Ă��������B" default answer "5" with title "Safari Version"
set screenShotNumber to text returned of result

display dialog "�E�J���H���J���H" buttons {"��", "�E"} default button 2
set temp to result
set btn to button returned of temp

set dFolder to "~/Desktop/screencapture/" --�f�X�N�g�b�v�ɉ摜�ۑ��p�t�H���_�����O�������Ă���

repeat with p from 1 to screenShotNumber
	
	tell application "Safari"
		
		activate
		
		tell application "System Events"
			
			
			if p = 1 then
				delay 1
				do shell script ("screencapture " & dFolder & "0.png")
			end if
			
			--key code 123
			if btn = "�E" then
				keystroke (ASCII character 29) -- �y�[�W�E���� (�J�[�\���L�[)
			else --��
				keystroke (ASCII character 28) -- �y�[�W������ (�J�[�\���L�[)
			end if
			
			delay 1
			do shell script ("screencapture " & dFolder & p & ".png")
			delay 1
			
		end tell
		
	end tell
	
end repeat

tell me
	activate
	display alert "�������I�����܂����B"
end tell

