---
slug: blogging-with-subtext
title: Blogging with Subtext
wordpress_id: 410
old_link: 'https://adrianba.net/2007/10/05/blogging-with-subtext/'
last_modified_at: 2007-10-06T04:15:37.000Z
---

Once I'd made the decision to begin blogging again, I had a look around to see whether I should change the engine used to host my blog.




3 or 4 years ago, when I made the decision to move away from Radio Userland, I wrote my own engine using ASP.NET and SQL Server. What I created was very basic but the implementation taught me a lot about developing with ASP.NET. I focused on writing a scalable, reusable core that could readily be customised and made appropriate use of caching for commonly used data, such as the RSS feed. I was pleased with what I created and I had planned to extend it and add new functionality maybe even getting to a point where I might share the source code. In the end, I never simultaneously had both the time and the inclination to move things forward and that never happened.




These days my motivation is a little different. While I will likely always dabble in writing code and playing with new technology my passion isn't for spending every day in a development environment. There are so many things that occupy me both at work and in my own time that I really don't want to spend it building something that other people have spent enough time on already. For this reason, I decided to review the available blogging systems and to select one for my blog moving forward. I didn't have many criteria for the selection with the primary one being that I'd be able to import all my previous posts relatively easily. I quickly discounted Community Server as being overkill for what I wanted. I took a long hard look at [dasBlog](http://www.dasblog.info/) and was almost convinced. It didn't take much, in the end though, to persuade me to go with [Subtext](http://www.subtextproject.com/). I like the way the data is stored in SQL Server - I figured I may want to do some manipulation with that in future. I liked the way it was so easy to set-up - there were very few configuration settings before I was led through most of the settings through the browser. Finally, I liked the simple BlogML import feature that I could use to import my old posts.




One of my current interests is F# and so I wrote a small F# script that exported my old posts from SQL into a BlogML file. It only took me an hour or so and a large part of that was really learning about the F# features I wanted to use. I'll likely post about that in more detail in the near future.




I've written a simple redirect script that should map the old URL format to the new with a permanent (301) redirect. This should push search engines and aggregators to update their links. If you spot any broken links, please let me know.




All in all, I'm happy with the decision so far. Time will tell if I remain content with that decision but at the present time I would recommend Subtext if you're looking for a straightforward .NET blog engine.
