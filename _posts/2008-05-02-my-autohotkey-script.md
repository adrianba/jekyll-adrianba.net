---
comments: false
date: 2008-05-02T05:28:18.000Z
layout: single
slug: my-autohotkey-script
title: My AutoHotkey Script
wordpress_id: 425
old_link: 'https://adrianba.net/2008/05/01/my-autohotkey-script/'
---
[James asked](/2008/04/30/elevated-command-prompt-from-a-hotkey) for the script I use. It's actually very simple and doesn't take advantage of any advanced features of AutoHotkey at present. Here it is:

 

#w::Run iexplore        
       
#h::Run "C:Program FilesCommon Filesmicrosoft sharedHelp 9dexplore.exe" /helpcol ms-help://ms.vscc.v90 /LaunchNamedUrlTopic DefaultPage /usehelpsettings VisualStudio.9.0         
       
#p::Run %comspec% /k ""C:Program FilesMicrosoft Visual Studio 9.0VCvcvarsall.bat"" x86,C:         
       
#y::Run "C:Program FilesTextPad 5TextPad.exe"         
       
#z::Run "C:Program FilesWindows LiveWriterWindowsLiveWriter.exe"         
       
#x::Run "C:Program FilesMicrosoft Visual Studio 9.0Common7IDEdevenv.exe"         
       
#a::Run "C:Program FilesWinampwinamp.exe"         
       
#o::Run "%SystemRoot%system32WindowsPowerShellv1.0powershell.exe",C:         
       
^#p::Run "C:UtilsBINelevate" -k %comspec% "C:Program FilesMicrosoft Visual Studio 9.0VCvcvarsall.bat"         
       
#Left::WinMinimize A         
       
#Right::WinMaximize A         
       
#Up::WinRestore A

 
