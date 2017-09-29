---
comments: false
date: 2012-12-20T18:46:15.000Z
layout: single
slug: pretending-browser-detection-isnt-browser-detection
title: Pretending browser detection isn't browser detection
wordpress_id: 470
old_link: >-
  https://adrianba.net/2012/12/20/pretending-browser-detection-isnt-browser-detection/
---
From time to time I see [posts like this describing "CSS Hacks" to detect a particular version of IE](http://www.impressivewebs.com/ie10-css-hacks/). This post describes how [removing conditional comments support in IE10](http://msdn.microsoft.com/en-us/library/ie/hh801214(v=vs.85).aspx) might be a problem for targeting workarounds to IE10. Specifically it says:

 

<blockquote>_"But without conditional comments in IE10, the only options we’re left with to target CSS problems are hacks or browser sniffing — and we certainly don’t want to resort to the latter."_</blockquote>

 

It goes on to describe a set of hacks that amount to browser sniffing using JavaScript (`if (/*@cc_on!@*/false && document.documentMode === 10)`) or some combination of media queries that some developers will only fire for IE10. Just because you don't use the user agent string doesn't mean you're not browser sniffing.

 

The whole point of [feature detection](http://blogs.msdn.com/b/ie/archive/2010/04/14/same-markup-writing-cross-browser-code.aspx) is to look for the feature you want to use and if it is missing do something else. If the issue really is a bug in a specific version of a browser and you can't find a way to detect the correct vs. the errant behaviour then consider browser detection explicitly, not hidden in code made to look like something else.

 

The main issue is one that [David Storey notes in the comments](http://www.impressivewebs.com/ie10-css-hacks/#comment-27944): this kind of hack is unreliable as bugs are fixed or new features introduced. Today we find that most sites that don't work correctly in IE10 by default are broken because they made this kind of assumption. They either expect that if they detect IE then a specific feature isn't present or will work a specific way or the assume that if feature A is supported then feature B must also be supported, often when there is no connection between the two. When a new version of IE comes along that fixes the bug or maybe implements feature A but not B then the site is broken because of these incorrect assumptions.

 

All browsers prioritise the order in which they deliver new features according to their own goals. In IE10 we invested a lot in new CSS3 layout support like [grid](http://www.w3.org/TR/css3-grid/) and [regions](http://www.w3.org/TR/css3-regions/), for example. There are other things that we didn't get to though we always wish we could have done more. Use feature detection in your site for the things you use that we didn't get to yet so that as soon as we include support your site should simply light up that part in IE.
