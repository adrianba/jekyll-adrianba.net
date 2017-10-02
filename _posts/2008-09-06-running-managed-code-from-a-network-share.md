---
slug: running-managed-code-from-a-network-share
title: Running managed code from a network share
wordpress_id: 432
old_link: 'https://adrianba.net/2008/09/06/running-managed-code-from-a-network-share/'
last_modified_at: 2008-09-07T01:01:37.000Z
---

Since the launch of .NET all those years ago now, one issue keeps coming up for me. You create a quick proof-of-concept and stick it on a network share so that you can either run it on another PC (or get someone to try it for you) so that you can avoid those a€oewell, it runs on my PCa€ conversations. Unfortunately, running a managed .EXE from a network share puts it in the Intranet zone and suddenly imposes a host of CAS policies that you probably forgot about (again). You have to copy the file locally to make it run. This has always seemed like a chore especially since the same doesna€™t apply to unmanaged programs.

 

Well, this is no longer the case as of .NET 3.5 SP1. [Vance Morrison posted](http://blogs.msdn.com/vancem/archive/2008/08/13/net-framework-3-5-sp1-allows-managed-code-to-be-launched-from-a-network-share.aspx) about this a couple of weeks ago. In the comments, Vance explains the rationale for the change:

 

<blockquote>  
> 
> _The simple answer is that we made a mistake.Â In 2001 we believed we are the avant-guard in making things 'secure by default' and thus biased our decisions believing that we would eventually 'plug' the hole of unmanaged code running from a network share.Â Â We also did not appreciate the pain this decision would cause. _
> 
>    
> 
> _However over time, we realized that we were naive.Â Â Â The cost/benefit of changing the behavior of unmanaged code is simply too high.Â Â Moreover it also become clear that for security to work, it must be simple, which means treating cases uniformly.Â Â Thus if you want to disallow launching exes off the network you should not have one way of doing it for managed code, and a completely different way for unmanage code.Â _
> 
>    
> 
> _In fact there IS a way of locking down exe launch uniformly (see Security Policies above), so really it became abundantly clear that really the 'right' approach is to treat security wholisitically (not just the managed case) and make managed code and unmanaged code as simmilar as possible (after all from an end user's perspective, who cares if code is managed or not?) _
> 
>    
> 
> _So to sum up, we made a mistake (frankly we make lots of them), and sadly it is VERY difficult to fix mistakes when you have millions of users to break, and even more so when security is involved.Â Â Thankfully, in this case we were able to convince ourselves that we couldÂ fix this one after the fact._
> 
> </blockquote>

 

The change is important and useful but I think what is more significant is the honesty with which it is published. Sure, we made a mistake, everyone makes mistakes, we learned from it and (though it sometimes takes a while) we fixed it. The naysayers will always disagree but ita€™s my experience that this is the culture at Microsoft. We admit our mistakes, put them right and learn from then, and then move on (and hope not to make the same ones again).

 

 
