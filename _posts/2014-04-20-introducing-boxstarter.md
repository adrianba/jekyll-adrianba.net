---
comments: false
date: 2014-04-20T01:19:13.000Z
layout: single
slug: introducing-boxstarter
title: Introducing Boxstarter
wordpress_id: 471
old_link: 'https://adrianba.net/2014/04/19/introducing-boxstarter/'
---
Every year, Scott Hanselman publishes his [Ultimate Developer and Power Users Tool List for Windows](http://www.hanselman.com/tools/). I usually take a look through it, pat myself on the back when I see things I’ve been using for a while, and spend some time investigating some of the new ones. Sometimes a tool that I’ve looked at before but haven’t been using gets another mention and it prompts me to take a look (this year it was [Clink](http://mridgers.github.io/clink/), a tool that adds readline-style editing to the Windows command line).

 

I recently discovered that I’d missed an important recommendation – it’s right there at the beginning of the list. A while ago, someone on my [old team at Microsoft UK](http://www.microsoft.com/en-us/microsoftservices/premier_support_developers.aspx) had recommended [Chocolatey](http://www.chocolatey.org/). This is a command line tool that works like [apt-get](http://en.wikipedia.org/wiki/Advanced_Packaging_Tool) but it installs Windows tools and applications. What I really wanted was a way to script installation of tools through Chocolatey, say after deploying a clean installation of Windows.

 

Introducing [Boxstarter](http://boxstarter.org/). Boxstarter, as recommended by Scott, is a fantastic tool that allows you to configure the installation of a set of Chocolatey packages. It also allows you to configure key Windows settings. Even better, the [WebLauncher](http://boxstarter.org/WebLauncher) installs everything from a simple URL.

 

For simple installations, you can list the packages you want in the URL and BoxStarter will take care of the rest. Say I want to install node.js, git, and Visual Studio Express for Windows. Easy. I just press Win+R to bring up the run dialog and type

 

<blockquote>`http://boxstarter.org/package/nr/nodejs.install,git.install,VisualStudioExpress2013WindowsDesktop`</blockquote>

 

Here is a video (don’t worry – most of the Visual Studio installation is edited out) that shows what happens when you launch this on a clean installation of Windows 8.1:
