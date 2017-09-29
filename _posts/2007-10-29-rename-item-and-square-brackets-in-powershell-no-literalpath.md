---
comments: false
date: 2007-10-29T15:04:06.000Z
layout: single
slug: rename-item-and-square-brackets-in-powershell-no-literalpath
title: Rename-Item and square brackets in PowerShell (no -LiteralPath)
wordpress_id: 414
old_link: >-
  https://adrianba.net/2007/10/29/rename-item-and-square-brackets-in-powershell-no-literalpath/
---
In the [Managing wildcards in paths](http://www.microsoft.com/technet/scriptcenter/topics/winpsh/payette2.mspx#E2AAC) section of Windows PowerShell in Action (Part 2) on MSDN, it says:

 

<blockquote>_What happens when you want to access a path that contains one of the wildcard meta-characters: "?", "*", "[", and "]"? In the Windows filesystem, "*" and "?" aren't a problem because we can't use these characters in a file or directory name. But we can use "[" and "]". In fact, they are used quite a bit for temporary internet files. Working with files whose names contain "[" or "]" can be a challenge because of the way wildcards and quoting work._</blockquote>

 

The solution, it says, is the -LiteralPath parameter:

 

<blockquote>_We don't want trial and error when we know the exact name of the file and want to suppress all pattern matching behavior. This is done using the â€“LiteralPath parameter on the core cmdlets._</blockquote>

 

Unfortunately, rename-item doesn't have the -LiteralPath parameter so it looks like renaming items with square brackets in their name is a problem.

 

After a little searching, I came across a [forum post](http://sandbox.manning.com/thread.jspa?messageID=62599) by Bruce Payette, Technical Lead in the PowerShell team, that explains the situation:

 

<blockquote>_Here's what happened. There was a push just before the release of version 1 where we went through and cleaned up most of the wildcard quoting bugs. This was done right at the end so the work was triaged pretty heavily. Only the most important things got fixed since we were locking done for RTM/RTW. We fixed all of the *-Item commands except for Rename-Item, the rational being that the Rename-Item cmdlet isn't necessary since you can use Move-Item instead and Move-Item does support the -LiteralPath parameter._</blockquote>

 

The bottom line is to use Move-Item instead of Rename-Item.
