---
comments: false
date: 2007-10-29T14:47:00.000Z
layout: single
slug: updating-file-timestamps-with-powershell
title: Updating file timestamps with PowerShell
wordpress_id: 413
old_link: 'https://adrianba.net/2007/10/29/updating-file-timestamps-with-powershell/'
---
I've recently copied over some [Audible](http://www.audible.com/) files from one PC to another. Had I used robocopy, I could have preserved all the timestamps but I just copied them in Explorer so I ended up with the situation where the last modified time was the same as the original but the created time has very recent. When you import files into your Audible Manager library it shows the created date. Since I usually sort by date so that my recent purchases are at the top of the list, this was something of a problem.

 

Having been used to the power of Unix shells bash and tcsh years ago, I was really looking forward to the promise of [PowerShell](http://www.microsoft.com/windowsserver2003/technologies/management/powershell/download.mspx). The problem was getting used to its syntax, which as with most powerful shells is a little arcane. Time being the scarce resource it is, I'd seen a few demos from team mates but never really taken the plunge. Returning to what I've known for years, that you learn something new best when you've actually got a need for it, I'm looking for opportunities where PowerShell will help me out. This timestamp situation is one.

 

I don't know if this is the best or easiest way to accomplish modifying the created time to be the same as the last modified time but it's pretty simple. I'm sure someone will tell me if it can be made simpler still.

 

dir | foreach { $_.CreationTime = $_.LastWriteTime }

 

In PowerShell, the dir command (actually an alias for Get-ChildItem) returns a stream of FileInfo objects. Piping them into foreach allows you to execute an action against each. $_ refers to the current object in the pipeline and PowerShell gives you direct access to the properties of objects.
