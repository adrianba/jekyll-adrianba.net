---
comments: false
date: 2014-05-20T15:25:00.000Z
layout: single
slug: using-c-to-access-the-twitter-api
title: 'Using C# to access the Twitter API'
wordpress_id: 476
old_link: 'https://adrianba.net/2014/05/20/using-c-to-access-the-twitter-api/'
---
 

My last post described [how to acquire Twitter OAuth keys and tokens](/2014/05/19/accessing-the-twitter-api-using-oauth) to allow you to use Twitter's API to access Twitter feeds. I showed how to use the [request module](https://www.npmjs.org/package/request) with node.js, which has built-in support for OAuth, to request and process data.

 

In this blog post I will show how to do the same thing using C# and .NET using the [OAuthBase class](http://oauth.googlecode.com/svn/code/csharp/) linked to from [oauth.net](http://oauth.net/code/).

 

Let's start with the code to call the Twitter API:

 
    
    <span class="kwrd">using</span> System;
    <span class="kwrd">using</span> System.IO;
    <span class="kwrd">using</span> System.Net;
    <span class="kwrd">using</span> System.Text;
    <span class="kwrd">using</span> OAuth;
    
    <span class="kwrd">class</span> App {
        <span class="kwrd">static</span> <span class="kwrd">void</span> Main() {
            <span class="rem">// URL for the API to call</span>
            <span class="kwrd">string</span> url = <span class="str">"https://api.twitter.com/1.1/statuses/user_timeline.json"</span>
                + <span class="str">"?screen_name=adrianba&count=5"</span>;
    
            <span class="rem">// Create a http request for the API</span>
            var webReq = (HttpWebRequest)WebRequest.Create(url);
    
            <span class="rem">// Set the OAuth header</span>
            var auth = <span class="kwrd">new</span> OAuthHeader();
            webReq.Headers.Add(<span class="str">"Authorization"</span>,auth.getHeader(url,<span class="str">"GET"</span>));
    
            <span class="rem">// Echo the response to the console</span>
            <span class="kwrd">using</span>(WebResponse webResp = webReq.GetResponse()) {
                <span class="kwrd">using</span>(StreamReader sr = <span class="kwrd">new</span> StreamReader(
                        webResp.GetResponseStream(),Encoding.GetEncoding(<span class="str">"utf-8"</span>)
                        )) {
                    Console.WriteLine(sr.ReadToEnd());
                }
            }
        }    
    }





The code here is similar to the previous [post](/2014/05/19/accessing-the-twitter-api-using-oauth). It creates a HTTP request to the API endpoint and this time simply writes the response to the console. The difference here is that we need to add the OAuth Authorization header. The magic takes place in the getHeader() method:




    
    <span class="kwrd">class</span> OAuthHeader : OAuthBase {
        <span class="kwrd">public</span> <span class="kwrd">string</span> getHeader(<span class="kwrd">string</span> url,<span class="kwrd">string</span> method) {
            <span class="kwrd">string</span> normalizedUri;
            <span class="kwrd">string</span> normalizedParameters;
    
            <span class="rem">// OAuth keys - FILL IN YOUR VALUES HERE (see this <a href="/2014/05/19/accessing-the-twitter-api-using-oauth">post</a>)</span>
            <span class="kwrd">const</span> <span class="kwrd">string</span> consumerKey = <span class="str">"..."</span>;
            <span class="kwrd">const</span> <span class="kwrd">string</span> consumerSecret = <span class="str">"..."</span>;
            <span class="kwrd">const</span> <span class="kwrd">string</span> token = <span class="str">"..."</span>;
            <span class="kwrd">const</span> <span class="kwrd">string</span> tokenSecret = <span class="str">"..."</span>;
    
            <span class="rem">// Create timestamp and nonce for this request</span>
            <span class="kwrd">string</span> timeStamp = GenerateTimeStamp();
            <span class="kwrd">string</span> nonce = GenerateNonce();
    
            <span class="rem">// Generate signature for the header</span>
            <span class="kwrd">string</span> signature = GenerateSignature(
                <span class="kwrd">new</span> Uri(url), consumerKey, consumerSecret, token, tokenSecret,
                method, timeStamp, nonce, <span class="kwrd">out</span> normalizedUri, <span class="kwrd">out</span> normalizedParameters);
    
            <span class="rem">// Compose the authorization header value</span>
            <span class="rem">// See http://tools.ietf.org/html/rfc5849#section-3.5.1</span>
            StringBuilder auth = <span class="kwrd">new</span> StringBuilder();
            auth.Append(<span class="str">"OAuth "</span>);
            auth.AppendFormat(<span class="str">"{0}="{1}", "</span>, OAuthConsumerKeyKey, UrlEncode(consumerKey));
            auth.AppendFormat(<span class="str">"{0}="{1}", "</span>, OAuthNonceKey, UrlEncode(nonce));
            auth.AppendFormat(<span class="str">"{0}="{1}", "</span>, OAuthSignatureKey, UrlEncode(signature));
            auth.AppendFormat(<span class="str">"{0}="{1}", "</span>, OAuthSignatureMethodKey, <span class="str">"HMAC-SHA1"</span>);
            auth.AppendFormat(<span class="str">"{0}="{1}", "</span>, OAuthTimestampKey, timeStamp);
            auth.AppendFormat(<span class="str">"{0}="{1}", "</span>, OAuthTokenKey, UrlEncode(token));
            auth.AppendFormat(<span class="str">"{0}="{1}""</span>, OAuthVersionKey, <span class="str">"1.0"</span>);
            <span class="kwrd">return</span> auth.ToString();    
        }
    }





The OAuthHeader class inherits from the OAuthBase class mentioned above. This provides the GenerateTimeStamp, GenerateNonce, and GenerateSignature methods. [Twitter uses the OAuth 1.0a protocol](https://dev.twitter.com/docs/auth/authorizing-request), defined in [RFC5849](http://tools.ietf.org/html/rfc5849). This specification outlines the Authorization header value that is constructed at the end of the getHeader() method.





You can keep the OAuthHeader class around for easy access to resources needing OAuth authorization such as Twitter.
