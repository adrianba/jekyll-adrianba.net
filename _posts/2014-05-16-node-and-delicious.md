---
slug: node-and-delicious
title: Node and Delicious
wordpress_id: 474
old_link: 'https://adrianba.net/2014/05/16/node-and-delicious/'
last_modified_at: 2014-05-16T18:32:46.000Z
---

In my last post, I wrote about [using node.js as a scripting tool](/2014/04/20/node-and-xml-stream). Node has lots of good libraries for making network requests and processing the results. [request](https://www.npmjs.org/package/request) is one of the most popular HTTP clients. It is easier to work with than the built-in [http](http://nodejs.org/api/http.html) module that is designed to provide basic http client/server primitives.

 

Despite its [chequered history](http://en.wikipedia.org/wiki/Delicious_(website)#History), I recently started using [delicious.com](https://delicious.com/) again for managing and sharing bookmarks for sites I want to remember. Modern browsers like Internet Explorer support [synchronising bookmarks or favourites amongst your devices](http://msdn.microsoft.com/en-us/library/ie/hh771832#roaming) but I like the ability to store interesting sites in a public place so other people can see what I'm looking at (should they be interested!). This also allows me to find things that I stored from someone else's device.

 

Delicious provides a variety of interesting [APIs for developers](https://delicious.com/developers) but also some [simple RSS or JSON data feeds](https://delicious.com/rss).

 

Here is a simple node script that uses the [request](https://github.com/mikeal/request) and [querystring](https://www.npmjs.org/package/querystring) modules to retrieve the last 10 public bookmarks and creates a simple JSON output.

 
    
    <span class="kwrd">var</span> request = require(<span class="str">'request'</span>);
    <span class="kwrd">var</span> qs = require(<span class="str">'querystring'</span>);
    
    <span class="kwrd">var</span> url = <span class="str">"http://feeds.delicious.com/v2/json/adrianba?"</span>;
    <span class="kwrd">var</span> <span class="kwrd">params</span> = { count: 10 };
    url += qs.stringify(<span class="kwrd">params</span>);
    console.log(url);
    
    request.get({url:url, json:<span class="kwrd">true</span> }, <span class="kwrd">function</span> (e, r, data) {
      <span class="kwrd">var</span> bookmarks = [];
      data.forEach(<span class="kwrd">function</span>(item) {
        <span class="kwrd">var</span> bookmark = {};
        bookmark.url = item.u;
        bookmark.text = item.d;
        bookmark.created = item.dt;
        bookmarks.push(bookmark);
      });
      console.log(JSON.stringify(bookmarks));
    });






The important parts here are the use of [request.get()](https://github.com/mikeal/request#requestget) which calls a callback when the response is retrieved and setting the [json](https://github.com/mikeal/request#requestoptions-callback) option to true so that the response JSON is already parsed when it is returned.





With just a few lines of code you can retrieve data with node and then do whatever processing you want on it.
