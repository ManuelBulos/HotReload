tell application "Safari"activatetell application "System Events"tell process "Safari"keystroke "r" using {command down, shift down}end tellend tellend tell-- Save that in a text file somewhere and run it from terminal with:-- osascript name_of_file.applescript-- I usually want to refocus Visual Studio Code after reloading Chrome, so I tack-- this onto the end of the script:tell application "Visual Studio Code" to activate