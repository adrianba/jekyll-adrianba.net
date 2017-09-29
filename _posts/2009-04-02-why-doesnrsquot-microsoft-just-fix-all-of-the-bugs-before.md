---
comments: false
date: 2009-04-02T22:20:44.000Z
layout: single
slug: why-doesnrsquot-microsoft-just-fix-all-of-the-bugs-before
title: Why doesn’t Microsoft just fix all of the bugs before they ship?
wordpress_id: 445
old_link: >-
  https://adrianba.net/2009/04/02/why-doesnrsquot-microsoft-just-fix-all-of-the-bugs-before/
---
Back in December, the Office Sustained Engineering team wrote a blog attempting to answer the question, a€oe[Why doesna€™t Office just fix all of the bugs before they ship?](http://blogs.technet.com/office_sustained_engineering/archive/2008/12/12/why-doesn-t-office-just-fix-all-of-the-bugs-before-they-ship-it.aspx)a€. In fact there description applies to any product from Microsoft and in fact products from many companies.

 

The truth is, even for a project working on a quality driven release, at a certain point someone needs to decide on the ship date and figure out working back from that how to lock down and stop making code changes. If you dona€™t do that then youa€™ll never ship anything. This reminds me of a conversation I had with a friend when we went snowboarding earlier in the year. The ski lifts have a closing time displayed on them after which time nobody else will be allowed to get on the lift and anybody already on will be allowed to reach the top. We discussed how the staff would have to be pretty strict on closing at exactly the time displayed or else theya€™d never be able to close. If they let through a€oejust one more persona€ then, given that new people arrive back at the lift all the time, at what point would you say a€oeenough is enougha€. How would you explain to the person that you stopped that you really shouldna€™t have let the previous person go either because, after all, ita€™s now well past closing time.

 

And so it goes with bugs. On any product of reasonable complexity, we receive a steady stream of incoming bug reports all the time, every day. Many of the reports relate to bugs that have already been fixed. Some of them relate to issues that are hotly debated where there are disagreements about if the product is supposed to work that way by design or not. And of course some of them relate to previously unknown defects. At some point you have to say a€oeenough is enougha€ and after that point only really critical issues (such as security vulnerabilities) are serious enough to get fixed. This is a really difficult time for the engineering team. Most developers are at least partly perfectionists and no one wants to ship a product with a defect that could be fixed. Might even be easily fixed. At some point, the tough decisions have to be taken though.

 

The Office SE blog goes into more detail on this and other areas.

 

What about the bugs that were in the last release and the one before? They keep getting reported and you keep shipping without fixing them. Ita€™s true that there are some bugs that survive past multiple releases. Sometimes they are things that where therea€™s a disagreement about what the correct behaviour is. Sometimes, though, they are just seen as low priority and a decision is taken not to fix them. Of course, every bug is the most important bug in the product to the person that reported it, but if there are common workarounds and perhaps the bug is only cosmetic and easy for a user to ignore then it may never make the cut and get fixed. Most customers would be disappointed if they bought a new version of a product and the only difference was a large number of fixes for minor issues theya€™d never personally run into. There is always a balance between working on new features/functionality and going back and fixing the gripes that a few customers have in less common scenarios.

 
