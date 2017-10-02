---
slug: node-and-xml-stream
title: Node and xml-stream
wordpress_id: 473
old_link: 'https://adrianba.net/2014/04/20/node-and-xml-stream/'
last_modified_at: 2014-04-20T18:53:46.000Z
---

 

For the last couple of months, I've been experimenting more and more with [node.js](http://nodejs.org/). My impression is that most people who have heard of node but not really used it think of it as a server technology for building web applications using JavaScript. Of course, it does that and there is [good support for node.js hosted on Microsoft Azure Web Sites](http://azure.microsoft.com/en-us/develop/nodejs/). But you can also use node as a scripting language for local tasks. There are lots of popular scripting languages like [Python](https://www.python.org/) and [Ruby](https://www.ruby-lang.org/) but if you're already a JavaScript developer then node is a convenient choice.

 

I guess most scripting environments have a package management framework and node's is called [npm](https://www.npmjs.org/). I recently wanted to do some scripting against an XML file and discovered the [xml-stream module](https://www.npmjs.org/package/xml-stream) by searching on [npmjs.org](https://www.npmjs.org/search?q=xml+stream). One of the helpful things about npmjs.org is that it tells you how often a particular package has been downloaded, which gives you an idea of whether it is a main stream module or just someone's hobby module that might not work so well yet.

 

# Installing xml-stream on Windows

 

Installing modules is easy and the command `npm install xml-stream` should take care of installing the module into the `node_modules` folder below the current directory.

 

However. When I first tried this I ran into some problems. First of all, this module needs Python to be available. I installed the latest version of [Python (v3.4.0)](https://www.python.org/download/releases/3.4.0) and tried again. This time it complained because Python 2.7 was needed. I installed [Python 2.7.6](https://www.python.org/download/releases/2.7.6) too but now there was a problem - how would npm know which version of Python to use? You can specify this each time or you can use the `npm config` command to tell npm where to look:

 

`npm config set python "C:Python27python.exe"`

 

You can also configure the version of Visual Studio tools you have installed so that npm knows how to use the compilers:

 

`npm config set msvs_version 2013`

 

You can check that this is configured correctly by typing:

 

`npm config list`

 

With this configuration in place, issuing the command `npm install xml-stream` successfully downloaded a built the xml-stream module.

 

# Using xml-stream

 

Now that I had xml-stream installed, I could try it out. The [W3C publishes a list of all of their published documents](http://www.w3.org/2002/01/tr-automation/tr.rdf) in an RDF/XML file. I wanted to parse this file and identify the latest version of each document.

 

The first thing to do is to import the http and xml-stream modules and to download the XML file:

 
    
    <span class="str">"use strict"</span>;
    
    <span class="kwrd">var</span> http = require(<span class="str">'http'</span>);
    <span class="kwrd">var</span> XmlStream = require(<span class="str">'xml-stream'</span>);
    <span class="kwrd">var</span> url = <span class="str">"http://www.w3.org/2002/01/tr-automation/tr.rdf"</span>;
    
    <span class="kwrd">var</span> request = http.get(url).on(<span class="str">'response'</span>, <span class="kwrd">function</span> (response) {
        <span class="rem">//TODO: process response here</span>
    });





The xml-stream module allows you to set-up event listeners for different elements in the document. The W3C file has different elements for Working Draft (WD), Last Call (LastCall), Candidate Recommendation (CR), etc. Here is the code that listens for each document type.




    
    <span class="str">"use strict"</span>;
    
    <span class="kwrd">var</span> http = require(<span class="str">'http'</span>);
    <span class="kwrd">var</span> XmlStream = require(<span class="str">'xml-stream'</span>);
    <span class="kwrd">var</span> url = <span class="str">"http://www.w3.org/2002/01/tr-automation/tr.rdf"</span>;
    
    <span class="kwrd">var</span> request = http.get(url).on(<span class="str">'response'</span>, <span class="kwrd">function</span> (response) {
        <span class="rem">// Collection to store documents in</span>
        <span class="kwrd">var</span> documents = {};
    
        <span class="kwrd">var</span> processDocument = <span class="kwrd">function</span> (item) {
            <span class="rem">//TODO: process document</span>
        };
    
        <span class="kwrd">var</span> xml = <span class="kwrd">new</span> XmlStream(response, <span class="str">'utf8'</span>);
    
        <span class="rem">// Process each type of document</span>
        xml.on(<span class="str">'updateElement: WD'</span>, processDocument);
        xml.on(<span class="str">'updateElement: LastCall'</span>, processDocument);
        xml.on(<span class="str">'updateElement: CR'</span>, processDocument);
        xml.on(<span class="str">'updateElement: PR'</span>, processDocument);
        xml.on(<span class="str">'updateElement: REC'</span>, processDocument);
        xml.on(<span class="str">'updateElement: NOTE'</span>, processDocument);
    
        xml.on(<span class="str">'end'</span>, <span class="kwrd">function</span> () {
            <span class="rem">// Write out JSON data of documents collection</span>
            console.log(JSON.stringify(documents));
        });
    });





Finally, we can add in a definition for the `processDocument` function, which will gather together all the documents into the documents collection:




    
        <span class="kwrd">var</span> processDocument = <span class="kwrd">function</span> (item) {
            <span class="rem">// Collect document properties</span>
            <span class="kwrd">var</span> document = {};
            document.type = item.$name;
            document.title = item[<span class="str">'dc:title'</span>];
            document.date = item[<span class="str">'dc:date'</span>];
            document.verURL = item.$[<span class="str">'rdf:about'</span>];
            document.trURL = item[<span class="str">'doc:versionOf'</span>].$[<span class="str">'rdf:resource'</span>];
    
            <span class="rem">// If we have already seen a version of this document</span>
            <span class="kwrd">if</span> (documents[document.trURL]) {
                <span class="rem">// Check to see if this one is newer and if so overwrite it</span>
                <span class="kwrd">var</span> old = documents[document.trURL];
                <span class="kwrd">if</span> (old.date < document.date) {
                    documents[document.trURL] = document;
                }
            } <span class="kwrd">else</span> {
                <span class="rem">// Store the new entry</span>
                documents[document.trURL] = document;
            }
        };





At the end, the script writes out the JSON data to the console.





Of course, this script is a little fragile because it doesn't map any of the namespace prefixes based on their declarations but it does the job I needed and is a good example of having a powerful JavaScript scripting environment coupled to a wide array of different packages to help you get tasks completed.
