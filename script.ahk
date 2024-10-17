#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

; Caps Lock - Escape
; CapsLock::Escape

; Remap the Menu key to Right Windows key (Super_R)
AppsKey::RWin

; Super + Shift + h - Edit script.ahk
#+h::
{
    Run, C:\Program Files\Alacritty\alacritty.exe

    WinWaitActive, ahk_exe alacritty.exe

    Send, nvim "C:\Users\Anonymous\Documents\AutoHotkey\script.ahk"{Enter}
    return
}

; Super + Shift + z - Edit match.txt
#+z::
{
    Run, C:\Program Files\Alacritty\alacritty.exe

    WinWaitActive, ahk_exe alacritty.exe

    Send, nvim "D:\Documents\match.txt"{Enter}
    return
}

; Super + Shift + w - Open WSL
#+w::
{
    Run, C:\Program Files\Alacritty\alacritty.exe, C:\Users\Matei Poștoacă

    WinWaitActive, ahk_exe alacritty.exe

    Send, wsl ~{Enter}
    return
}

; Super + Alt + a - Open Emacs Org-mode
#+a::
{
    ; Run, wsl emacs /mnt/d/Documents/Personal/Notes/Index.org --fullscreen,, Hide
    Run, wsl emacs /mnt/d/Documents/Personal/Notes/Index.org,, Hide
    return
}

; Super + Shift + q - Close window
#+q::Send !{F4}

; Super + Shift + Enter - Run Alacritty
#+Enter::Run, C:\Program Files\Alacritty\alacritty.exe, C:\Users\Anonymous

; Super + Alt + Enter - Run Alacritty as Administrator
#!Enter::Run *RunAs C:\Program Files\Alacritty\alacritty.exe, C:\WINDOWS\system32

; Super + Shift + f - Run Anki
#+f::Run, C:\Users\Anonymous\AppData\Local\Programs\Anki\anki.exe

; Super + Shift + m - Run AIMP
#+m::Run, C:\Program Files\AIMP\AIMP.exe

; Super + Shift + d - Run Paint.net
#+d::Run, C:\Program Files\paint.net\paintdotnet.exe

; Super + Shift + e - Run Visual Studio 2022
#+e::Run, C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe

; Super + Alt + e - Run Visual Studio Installer
#!e::Run, C:\Program Files (x86)\Microsoft Visual Studio\Installer\setup.exe

; Super + Alt + a - Reset todos
#!a::
{
    filePaths := ["D:\Documents\Personal\Notes\Struct\Plans\Morning.org", "D:\Documents\Personal\Notes\Struct\Plans\Afternoon.org", "D:\Documents\Personal\Notes\Struct\Plans\Evening.org", "D:\Documents\Personal\Notes\Struct\Plans\Night.org"]

    Loop, % filePaths.MaxIndex()
    {
        filePath := filePaths[A_Index]
        FileRead, fileContent, %filePath%

        fileContent := RegExReplace(fileContent, "\[(X|-)\]", "[ ]")
        fileContent := RegExReplace(fileContent, "\[(\d+)/(\d+)\]", "[0/$2]")
        fileContent := StrReplace(fileContent, "DONE", "TODO")

        FileDelete, %filePath%  ; Delete the original file
        FileAppend, %fileContent%, %filePath%  ; Write the modified content back
    }
    return
}
