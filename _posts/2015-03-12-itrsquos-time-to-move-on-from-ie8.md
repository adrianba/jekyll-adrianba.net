---
comments: false
date: 2015-03-12T20:23:27.000Z
layout: single
slug: itrsquos-time-to-move-on-from-ie8
title: It’s time to move on from IE8
wordpress_id: 477
old_link: 'https://adrianba.net/2015/03/12/itrsquos-time-to-move-on-from-ie8/'
---
Yesterday, [my esteemed (new) colleague Aaron Gustafson wrote a piece](http://www.aaron-gustafson.com/notebook/lines-in-the-sand/) about his reaction to the “[Break Up with Internet Explorer 8](http://breakupwithie8.com/)” site currently doing the rounds in the Twittersphere. He argues for support of older browsers and optimisation for newer, better browsers. I disagree.

 

Some people don’t have control over their browsing environment. Some people can’t afford to upgrade to a more recent version of Windows because of business software that is expensive to move forward. This is true but being stuck on IE8 isn’t the common case any longer.

 

Even [Microsoft isn’t going to support IE8 customers after January 2016](http://blogs.msdn.com/b/ie/archive/2014/08/07/stay-up-to-date-with-internet-explorer.aspx) and you shouldn’t either. There will be no more security updates for IE8 after that[1]. We all need to move on and we need to continue to encourage organisations to [get to IE11 and deploy Enterprise Mode for their legacy applications](http://blogs.msdn.com/b/ie/archive/2015/03/02/making-it-easier-for-enterprise-customers-to-upgrade-to-internet-explorer-11-and-windows-10.aspx).

 

Progressive enhancement is a good goal and something that we should aim for with today’s modern browsers. IE11 has good feature coverage and the new Microsoft EdgeHTML rendering engine that will be used by “Project Spartan” goes considerably further. All the popular browsers are adding lots of new features (track the IE ones at [https://status.modern.ie/](https://status.modern.ie/)) and we should make our apps light up in the face of new capabilities. Feature detection is king.

 

But IE8 is old. It didn’t have support for the old old DOM standards like Core, HTML, Style, Events, etc. You even have to polyfill addEventListener, for goodness sake. Yes, this is all possible (maybe using abstractions like [jQuery 1.x](http://jquery.com/browser-support/)) but why should we continue to do this for new work? Why continue to bloat the web for an audience that is shrinking ever faster? Most enterprises we engage with are rushing to get to IE11 before the support policy change comes into effect.

 

There are two types of web developers in the world. Those that are building and maintaining legacy systems for enterprises that may well have to support IE8 and probably don’t have to worry to much about modern browsers. And those who are targeting Chrome, Firefox, Safari, Opera, and modern IE. This latter category should target nothing older than IE9 and, given that [IE11 share has been bigger than IE9 and IE10 combined](http://thenextweb.com/insider/2014/05/01/ie11-market-share-passes-ie10-ie9-combined-chrome-cements-lead-firefox/) for almost a year, I argue that you might just support IE11.

 

Does this apply to everyone? No, of course not. Is this too simplistic? Yes. Should you just cut people off tomorrow? No, again, of course not. But having a transition plan, letting customers know what it is, and then moving to a world where you don’t worry about old legacy IE. That’s the kind of web developer I want to be. Despite helping to bring IE8 to life, I’ve broken up with it.

   

* * *

[1] Unless you have a commercial relationship with Microsoft to provide these, and you are required to be executing on your plan to get off IE8.     
