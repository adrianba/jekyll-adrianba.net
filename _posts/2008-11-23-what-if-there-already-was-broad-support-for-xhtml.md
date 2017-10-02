---
slug: what-if-there-already-was-broad-support-for-xhtml
title: What if there already was broad support for XHTML?
wordpress_id: 440
old_link: >-
  https://adrianba.net/2008/11/23/what-if-there-already-was-broad-support-for-xhtml/
last_modified_at: 2008-11-24T05:43:21.000Z
---

[W3C XHTML 1.0 Appendix C](http://www.w3.org/TR/2002/REC-xhtml1-20020801/#guidelines): _This appendix summarizes design guidelines for authors who wish their XHTML documents to render on existing HTML user agents._

 

[W3C XHTML Media Types](http://www.w3.org/TR/xhtml-media-types/#text-html): _The use of 'text/html' for XHTML SHOULD be limited for the purpose of rendering on existing HTML user agents, and SHOULD be limited to XHTML1 documents which follow the HTML Compatibility Guidelines. In particular, 'text/html' is NOT suitable for XHTML Family document types that adds elements and attributes from foreign namespaces, such as XHTML+MathML._

 

[Mark Pilgrim](http://blog.whatwg.org/this-week-in-html-5-episode-9): _Despite _[_Chris Wilson's assertion_](http://lists.w3.org/Archives/Public/public-html/2008Aug/0046.html)_ that "we cannot definitively say why XHTML has not been successful on the Web," I think it's pretty clear that Internet Explorer's complete lack of support for the application/xhtml+xml MIME type has something to do with it._

 

[Sam Ruby](http://intertwingly.net/blog/2008/10/23/Misdirection): _what is wrong with using XML for this?Â Come on.Â I can answer that with two words: IE, and Postel._

 

[Chris Wilson](http://blogs.msdn.com/ie/archive/2005/09/15/467901.aspx) (back in 2005): _I made the decision to not try to support the MIME type in IE7 simply because I personally want XHTML to be successful in the long run.Â I love XHTML (go look, my name is in the _[_credits_](http://www.w3.org/TR/xhtml1/#acks)_ for XML 1.0); ita€™s capable of being truly interoperable if done right._

 

Internet Explorer doesna€™t support XHTML served with the application/xhtml+xml MIME type and IE8 wona€™t add that support either. I wasna€™t around when the feature decisions were taken for IE8 but I do know that the wish list is long and it only makes sense to implement a reasonable number of features in each release of any software product. It also makes sense to focus your resources on things that will have the most impact for the most customers.

 

Internet Explorer is an interesting product because it has many different audiences with each with different priorities. People browsing the web want it to be fast, easy-to-use, and safe. Web developers want good tools and a consistent experience across browsers. Enterprise IT managers want reliability, ease-of-deployment, and most-of-all compatibility with the applications that worked with previous versions and that run their business. Application developers want compatibility and also extensibility/customisation either of the browser itself or of the browser control they include in their applications. Ita€™s hard to please all of the people all of the time, especially when you have hundreds of millions of users.

 

At the PDC in October, [Alex Mogilevsky presented on the new rendering engine in IE8](http://mschnlnine.vo.llnwd.net/d1/pdc08/WMV-HQ/PC12.wmv) that provides interoperable support for CSS 2.1. The IE team decided that CSS 2.1 support was a a€oemust havea€ feature for IE8 and Alex describes the huge amount of work involved in making that happen (of interest, he also covers some of the history of the way IE worked in previous versions). With everything else that was a priority for IE8 XHTML wasna€™t high enough up on the list and it didna€™t make it into IE8. Will it make it into the next version of IE? Who knows. Those decisions certainly havena€™t been taken yet.

 

With all the recent discussion about well-formedness I was wondering about what the web would be like if there __were__ broad support for XHTML. What percentage of new content would be served with application/xhtml+xml? Would all the Classic ASP and PHP developers try to use XHTML but then get frustrated at the fragility of pages that have to be perfectly marked-up? Would there be a gradual move of applications towards XHTML or would it be reserved for the elite minority? Is showing nothing for a slightly incorrect page the right answer for most web developers?

 

[Jonas Sicking](http://lists.w3.org/Archives/Public/public-html/2008Nov/0136.html): _When Netscape decided to rewrite their browser engine and use what has        
become gecko (the engine used by firefox), one of the biggest problem with taking marketshare was compatibility with existing pages, even though the new engine was perfectly able to parse HTML 4 by spec. _

 

_In fact, we can still see this today. While firefox now has a worldwide marketshare of about 20%, our marketshare in many countries in Asia is tiny. Our market research data has shown that the main reason for that is website compatibility. Even though Firefox parses valid HTML4 very well._

 

Compatibility is extremely important and the W3C HTML 5 working group is putting a huge amount of effort into describing the interoperable way to process HTML documents that are not well-formed. Meanwhile, XHTML guarantees that pages will only be displayed if they are well-formed a€" there is no error recovery. I ask the question again: what valuable properties does a well-formed document have?

 

Of course, XHTML isna€™t just about well-formedness. The documents are truly XML and have the ability to embed mark-up from other namespaces such as SVG and MathML and to be processed with standard XML tools. There is also work underway in the HTML 5 WG to define the mechanisms for these languages to be embedded in HTML. What value is there in XHTML if it only differs from HTML in which type of parser I instantiate to read a document?

 
