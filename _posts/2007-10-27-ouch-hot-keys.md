---
comments: false
date: 2007-10-27T22:39:56.000Z
layout: single
slug: ouch-hot-keys
title: 'Ouch, hot keys!'
wordpress_id: 411
old_link: 'https://adrianba.net/2007/10/27/ouch-hot-keys/'
---
I used to use [WinKey](http://www.copernic.com/winkey/) to bind the Windows key on the keyboard together with another key to use as a shortcut. By default, the Windows shell has some "hotkeys". For example, Win+R gives the run dialog and Win+E opens an Explorer window. I wanted some extras for common tasks and that's what WinKey did. Unfortunately, as you can see if you follow the link, WinKey hasn't been supported by Copernic since 2005. In the past, I noted that it didn't work completely without [admin rights](/2003/02/14/c6a52dd56eb44837a9935c8f53b4064d) and under Vista that becomes common with UAC but I've struggled on nevertheless.

 

This weekend, I've built a new installation of Vista on my new desktop and wanted to find a solution to the UAC+WinKey issues. I'd considered writing my own version in the past but time being what it is never actually got around to it. It crossed my mind again today and in searching around for some clues to assess how hard it was going to be, I stumbled upon a solution that's already been written.

 

Enter [AutoHotkey](http://www.autohotkey.com/). This sophisticated utility allows you not only to bind keys to actions but includes a clever scripting syntax that allows you to re-map keys and take different actions based on what it happening on your system. As a simple example, you could bind a key so that it runs an application but if that application is already running it just brings the window to the front.

 

So far, I've only created some simple key bindings but I suspect that as things crop up that I want to automate, I'll be building upon the simple script I'm using now. Definitely recommended.
