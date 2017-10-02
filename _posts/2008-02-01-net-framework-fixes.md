---
slug: net-framework-fixes
title: .NET Framework Fixes
wordpress_id: 421
old_link: 'https://adrianba.net/2008/02/01/net-framework-fixes/'
last_modified_at: 2008-02-02T06:37:41.000Z
---

There's a big long list of problems that are fixed in the .NET Framework Service Pack 1 in this [knowledge base article (945757)](http://support.microsoft.com/kb/945757). Some of these have very generic names such as "FIX: You may receive an exception when you browse a .NET Framework 2.0 ASP.NET Web application" but if you click through into the underlying articles you can see more information about the specific scenarios that are covered.

 

Some of the improvements have also been around improving performance, such as the [ADO.NET performance improvements](http://blogs.msdn.com/adonet/archive/2008/01/28/ado-net-performance-improvements-with-the-net-framework-2-0-sp1.aspx) (via [Sam Gentile](http://samgentile.com/blogs/samgentile/archive/2008/01/31/new-and-notable-221.aspx)). These changes have the potential to make current applications perform better with no code changes.

 

One of the questions that I'm often asked by customers, though, is for a definitive list of every change that might affect their applications. One particular customer said that they needed this list so that if something didn't work as expected, they could check off against the list to see if it was a Microsoft change or something in their environment. Unfortunately, life isn't quite this simple. There are some situations where the framework (or any product) works in a particular way by accident more than by design. The behaviour observed happens as a consequence of the way something was implemented but it wasn't by design. We never expected someone to rely on this behaviour and when we add new functionality or fix a bug it may change this behaviour (that we never intended in the first place). Nobody records that this is changed because we never recognised that it was a change - it wasn't a design change. In the end we can't keep lists of this sort of thing - when you're writing code in your projects do you keep a list of all the things you changed that your customers will never see? :-)
