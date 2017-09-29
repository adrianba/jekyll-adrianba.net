---
comments: false
date: 2014-05-19T15:30:00.000Z
layout: single
slug: accessing-the-twitter-api-using-oauth
title: Accessing the Twitter API using OAuth
wordpress_id: 475
old_link: 'https://adrianba.net/2014/05/19/accessing-the-twitter-api-using-oauth/'
---
Following on from my last post that described [using Node to access feeds from Delicious](/2014/05/16/node-and-delicious), I’ve also been investigating how to access my Twitter feed. This adds a little more complexity because Twitter requires that your app or script [authenticate to Twitter](https://dev.twitter.com/docs/auth) using [OAuth](http://oauth.net/).

Per [Wikipedia](http://en.wikipedia.org/wiki/OAuth), "_OAuth provides client applications a 'secure delegated access' to server resources on behalf of a resource owner. It specifies a process for resource owners to authorize third-party access to their server resources without sharing their credentials._" What this means is that your app can access the Twitter API in an authenticated way using OAuth without having to embed your username and password into the script.

The node.js [request](https://www.npmjs.org/package/request) library that I mentioned last time has built in support for [OAuth authentication](https://github.com/mikeal/request#oauth-signing). It requires that you populate a JavaScript object as follows:

    
    <span class="kwrd">var</span> oauth = {
       consumer_key: CONSUMER_KEY
      , consumer_secret: CONSUMER_SECRET
      , token: OAUTH_TOKEN
      , token_secret: OAUTH_TOKEN_SECRET
    };


Each of CONSUMER_KEY, CONSUMER_SECRET, OAUTH_TOKEN and OAUTH_TOKEN_SECRET are strings that we must supply as part of the OAuth handshake.

There are two ways to think about using OAuth to authenticate against a service such as Twitter depending upon the type of app that you are building. The first scenario is where, for example, you are building a Twitter client. You will distribute this application and each user of the application will authenticate using their own credentials so that they can access information from the service as themselves. In the second scenario you are building an application or service that you want to access the service as you and you never need to send a variety of credentials. For example, say you are building a widget on your web site that will indicate how long it has been since you last tweeted. This will always be about you and need to use only your credentials.

The CONSUMER_KEY and CONSUMER_SECRET values are provided by the service to identify your application. The OAUTH_TOKEN and OAUTH_TOKEN_SECRET represent the credentials of the user accessing the service. They may be determined and stored by your app in the first scenario above or they may be part of your application in the second.

This all sounds a little complicated so an example will help. Before we get to that we need to get the values. Twitter provides a portal for this at [https://apps.twitter.com/](https://apps.twitter.com/). If you login and select Create New App you will see a screen that looks like this:

[![image](/wp-content/uploads/2014/05/img475-1.png)](/wp-content/uploads/2014/05/img475-1.png)

Here you provide the name of you application, a description, and a link to your web site. For our initial scripting purposes the values here don’t matter too much. There is a Callback URL value but we also don’t need this now and can leave this blank. Finally there are some terms and conditions to read and agree to. Once you have completed this form, press the Create your Twitter application button and you will see a screen that looks like this:

[![image](/wp-content/uploads/2014/05/img475-2.png)](=)

If you click on the API Keys tab you will see something like this:

[![image](/wp-content/uploads/2014/05/img475-3.png)](/wp-content/uploads/2014/05/img475-3.png)

Since we want our script to access Twitter using our account, we can click on the Create my access token button to generate the appropriate token values. You should see something like this:

[![image](/wp-content/uploads/2014/05/img475-4.png)](/wp-content/uploads/2014/05/img475-4.png)

You may need to refresh to see your new access token.

So now you have four strings: API key, API secret, Access token, and Access token secret. These map to the four values needed in the OAuth structure described in the code above.

There are lots of different ways to access the [Twitter API](https://dev.twitter.com/docs/api/1.1). Here I am simply going to use the [user_timeline](https://dev.twitter.com/docs/api/1.1/get/statuses/user_timeline) API to retrieve the 5 most recent tweets from my timeline. You can use this API to retrieve any user’s timeline that you have access to from your Twitter account (including, of course, all the public timelines).

So here is the code to make a request to this API:

    
    <span class="kwrd">var</span> request = require(<span class="str">'request'</span>);
    <span class="kwrd">var</span> url = <span class="str">"https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=adrianba&count=5"</span>;
    
    <span class="kwrd">var</span> CONSUMER_KEY = <span class="str">"..."</span>;
    <span class="kwrd">var</span> CONSUMER_SECRET = <span class="str">"..."</span>;
    <span class="kwrd">var</span> OAUTH_TOKEN = <span class="str">"..."</span>;
    <span class="kwrd">var</span> OAUTH_TOKEN_SECRET = <span class="str">"..."</span>;
    
    <span class="kwrd">var</span> oauth = {
        consumer_key: CONSUMER_KEY
      , consumer_secret: CONSUMER_SECRET
      , token: OAUTH_TOKEN
      , token_secret: OAUTH_TOKEN_SECRET
    };
    
    request.get({url:url, oauth:oauth, json:<span class="kwrd">true</span>}, <span class="kwrd">function</span> (e, r, data) {
      <span class="kwrd">var</span> tweets = [];
      data.forEach(<span class="kwrd">function</span>(item) {
        <span class="kwrd">var</span> tweet = {};
        tweet.id = item.id.toString();
        tweet.text = item.text;
        tweet.created = item.created_at;
        tweets.push(tweet);
      });
      console.log(JSON.stringify(tweets));
    });


You obviously need to replace the "..." strings with the values copied from your API Keys page.

The important addition in this code is passing the oauth option into the get() method. After this, the request module takes care of the rest. In general, all services that require OAuth authentication follow this pattern although they will differ in how the keys and tokens are issued to you.
