---
slug: asp-net-__dopostback-problems-and-ie10
title: ASP.NET __doPostBack problems and IE10
wordpress_id: 466
old_link: 'https://adrianba.net/2011/09/12/asp-net-__dopostback-problems-and-ie10/'
last_modified_at: 2011-09-12T23:54:59.000Z
---

Scott Hanselman describes the [ASP.NET fix need to make the browser definition files work with IE10](http://www.hanselman.com/blog/BugAndFixASPNETFailsToDetectIE10CausingDoPostBackIsUndefinedJavaScriptErrorOrMaintainFF5ScrollbarPosition.aspx). In general we encourage developers to use [feature detection](http://blogs.msdn.com/b/ie/archive/2010/04/14/same-markup-writing-cross-browser-code.aspx) when switching their mark-up but the ASP.NET infrastructure has been around for a long time. One thing to watch out for if you are doing custom browser detection is the two digit version number with IE10. We've seen a few sites have issues because they only expect a single digit and end up thinking IE10 is IE1.
