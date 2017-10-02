---
slug: elevated-command-prompt-from-a-hotkey
title: Elevated command prompt from a hotkey
wordpress_id: 424
old_link: 'https://adrianba.net/2008/04/30/elevated-command-prompt-from-a-hotkey/'
last_modified_at: 2008-04-30T22:05:07.000Z
---

While I think UAC is a good thing, it gets pretty annoying when running lots of commands at the command line that just turn around and say "sorry, I need to be elevated". I've blogged before about using [AutoHotkey](/2007/10/27/ouch-hot-keys) to run commands bound to keyboard shortcuts and I use Win+P to pull up a command prompt with all the environment variables set so that I can access developer tools like devenv and csc. Finally I started to look around at a way to bind an elevated command prompt to a keystroke.

 

The problem is that the runas command allows you to run as a different user but not as the same user but elevated. [John Robbins obviously had this problem too](http://www.wintellect.com/cs/blogs/jrobbins/archive/2007/03/27/elevate-a-process-at-the-command-line-in-vista.aspx) and he wrote a blog article just over a year ago with his elevate command line app to overcome this.

 

Using elevate, I now can press Ctrl+Win+P when I want an elevated command line and then just hit Alt+C to continue past the UAC dialog.

 
