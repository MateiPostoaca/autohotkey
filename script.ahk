#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

; Caps Lock - Escape
; CapsLock::Escape

; Remap the Menu key to Right Windows key (Super_R)
AppsKey::RWin

; Super + Shift + a - Open Neorg index file
#+a::
{
    Run, C:\Program Files\Alacritty\alacritty.exe

    WinWaitActive, ahk_exe alacritty.exe

    Send, nvim -c "Neorg workspace Notes"{Enter}
    return
}

; Super + Shift + j - Open new Neorg journal
#+j::
{
    Run, C:\Program Files\Alacritty\alacritty.exe

    WinWaitActive, ahk_exe alacritty.exe

    Send, nvim -c "Neorg journal today"{Enter}
    return
}

; Super + Shift + h - Edit script.ahk
#+h::
{
    Run, C:\Program Files\Alacritty\alacritty.exe

    WinWaitActive, ahk_exe alacritty.exe

    Send, nvim "C:\Users\Matei Poștoacă\Documents\AutoHotkey\script.ahk"{Enter}
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

    Send, wsl{Enter}
    return
}

; Super + Shift + q - Close window
#+q::Send !{F4}

; Super + Shift + Enter - Run Alacritty
#+Enter::Run, C:\Program Files\Alacritty\alacritty.exe, C:\Users\Matei Poștoacă

; Super + Alt + Enter - Run Alacritty as Administrator
#!Enter::Run *RunAs C:\Program Files\Alacritty\alacritty.exe, C:\WINDOWS\system32

; Super + Shift + f - Run Anki
#+f::Run, C:\Users\Matei Poștoacă\AppData\Local\Programs\Anki\anki.exe

; Super + Shift + m - Run AIMP
#+m::Run, C:\Program Files\AIMP\AIMP.exe

; Super + Shift + d - Run Paint.net
#+d::Run, C:\Program Files\paint.net\paintdotnet.exe

; Super + Shift + e - Run Visual Studio 2022
#+e::Run, C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe

; Super + Alt + e - Run Visual Studio Installer
#!e::Run, C:\Program Files (x86)\Microsoft Visual Studio\Installer\setup.exe

; Super + Shift + n - Run OneNote
#+n::Run, C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE

; Super + Shift + t - Reset todos
#+t::
{
    files := ["C:\Users\Matei Poștoacă\Documents\Notes\Todo\morning.norg", "C:\Users\Matei Poștoacă\Documents\Notes\Todo\midday.norg", "C:\Users\Matei Poștoacă\Documents\Notes\Todo\evening.norg"]

    for index, file in files {
        FileRead, content, %file%

        StringReplace, content, content, (x), ( ), All
        StringReplace, content, content, (-), ( ), All

        FileDelete, %file% ; Delete the original file
        FileAppend, %content%, %file% ; Write the new content to the file
    }
    return
}
