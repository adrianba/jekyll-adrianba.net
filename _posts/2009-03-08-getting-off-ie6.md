---
comments: false
date: 2009-03-09T05:34:10.000Z
layout: single
slug: getting-off-ie6
title: Getting off IE6?
wordpress_id: 444
old_link: 'https://adrianba.net/2009/03/08/getting-off-ie6/'
---
Scott Hanselman has a post talking about [how to encourage users to upgrade their browser from IE6](http://www.hanselman.com/blog/IE6WarningStopLivingInThePastGetOffOfIE6.aspx) to something newer. Ita€™s true that there are still a large number of people using IE6. Previous versions of IE are the biggest competitor to new releases and in the past it has often taken around 18 months before the number of users of a new release surpasses the number of users of the previous release.

 

As it turns out, adding conditional messages to pages asking people to upgrade their browser has limited success. Many of the users still with IE6 installed are on corporate desktops who cana€™t upgrade to a newer version. Unfortunately, in trying to make IE7 more compliant with web standards, many internal corporate sites coded to work with IE6 behaviour werena€™t compatible with the new IE7 rendering. Instead of spending the resources to upgrade those sites, many corporate customers had remained with IE6.

 

We learned many lessons during the IE7 product cycle and wea€™ve incorporate this learning into IE8 through the many [compatibility mechanisms](http://blogs.msdn.com/ie/archive/2009/02/16/just-the-facts-recap-of-compatibility-view.aspx). By forcing IE8 to render pages in the new CSS2.1 standards based rendering engine by default, we had the potential to break sites within corporate customers in similar ways to their experience with IE7 and this isna€™t the best way to endear yourself to your customers. While being in standards mode by default is the right choice for the long term, many customers in the short term just want their sites to continue working and so we have to strike a balance.

 

Unfortunately, it wasna€™t feasible to incorporate IE6 compatibility into IE8 and so customers who havena€™t upgraded from IE6 to IE7 because of internal compatibility restrictions will still need to do the same work to move to IE8. On the positive side, customers who moved to IE7 already will have a much smoother transition as they look at deploying IE8.

 
