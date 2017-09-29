---
comments: false
date: 2016-09-24T19:01:17.000Z
layout: single
slug: using-microsoft-flow-to-publish-medium-com-recommendations
title: Using Microsoft Flow to publish medium.com recommendations
wordpress_id: 535
old_link: >-
  https://adrianba.net/2016/09/24/using-microsoft-flow-to-publish-medium-com-recommendations/
---
Like a growing number of people, I read a lot of content on [medium.com](https://medium.com/). I wanted to find a way to share the posts that I find most interesting.

Over the last couple of weeks I've been playing with [Microsoft Flow](https://flow.microsoft.com/), which allows you to create automated workflows between different apps and services. I'm not on the Flow team - I just think the service is interesting, especially now that it is [available for everyone](https://flow.microsoft.com/en-us/blog/available-for-everyone/) to use. It reminds me of [Yahoo Pipes](https://en.wikipedia.org/wiki/Yahoo!_Pipes).

[![Screenshot of Microsoft Flow editor](/assets/uploads/2016/09/microsoft-flow-300x284.png)](/assets/uploads/2016/09/microsoft-flow.png)

Tweeting out recommended reading from medium.com is very simple using Flow. Medium has an RSS feed with a list of your recommendations at `https://medium.com/feed/@_your-medium-id_/has-recommended`. You can create a new Flow trigger from this RSS feed so that new entries cause the flow to run. By adding Post a tweet action, you can cause the new entry to post to Twitter. You can use data from the RSS field to populate the tweet. I post the URL and the title of the recommendation.

That's it. I saved the flow with my Twitter credentials and now whenever I click the recommended button on a medium.com post, I tweet about it within a few minutes.
