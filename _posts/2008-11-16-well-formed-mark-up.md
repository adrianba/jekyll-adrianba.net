---
slug: well-formed-mark-up
title: Well-formed mark-up?
wordpress_id: 438
old_link: 'https://adrianba.net/2008/11/16/well-formed-mark-up/'
last_modified_at: 2008-11-17T02:44:49.000Z
---

Therea€™s an interesting debate going on in the W3C HTML working group about whether well-formed HTML is important in the specification process for HTML5. It feels to me somehow intellectually that well-formedness is a valuable goal but when it comes down to explaining why it matters Ia€™m finding it hard.

 

Which of the following is a€oebettera€:

 

normal<b>**bold**<i>_**bolditalic**_</b>_italic_</i>normal

 

or

 

normal<b>**bold**<i>_**bolditalic**_</i></b><i>_italic_</i>normal

 

The first is shorter (and works in all the popular web browsers) while the second is well-formed. Well-formedness isna€™t about being smaller. Ita€™s also not about performance: it turns out that the parsers in browsers often process certain non-well-formed mark-up faster than if it had been well-formed.

 

Since browsers have to parse both alternatives and the HTML5 process is about ensuring that they do so in a predictable and interoperable way then should there be any weight behind well-formed documents? After all, the spec doesna€™t prevent you from choosing to be well-formed if you want to.

 

The analogy Ia€™ve been considering is about indentation in C++ source code: few people would probably write C++ without a sensible indentation strategy to help make the code readable. Yet the C++ spec doesna€™t need to say anything about indentation a€" ita€™s a best practice but not a formal part of the language definition. Could writing well-formed HTML be a best practice thata€™s not a formal part of the language definition?

 
