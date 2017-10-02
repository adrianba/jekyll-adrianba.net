---
comments: false
date: 2015-03-15T05:27:51.000Z
layout: single
slug: using-yeoman-to-start-writing-technical-specifications-with-respec
title: Using Yeoman to start writing technical specifications with ReSpec
wordpress_id: 478
old_link: >-
  https://adrianba.net/2015/03/14/using-yeoman-to-start-writing-technical-specifications-with-respec/
---
[Yeoman](http://yeoman.io/) is a tool that provides a scaffolding system to begin new projects. The genius thing about Yeoman is that, by itself, it doesn’t know how to do anything. This flexibility comes from a modular approach that relies on separate generator modules. Each [generator](http://yeoman.io/generators/) knows how to create a particular kind of project (e.g. an Backbone.js app or a Chrome extension).

 

[ReSpec](http://www.w3.org/respec/) is a JS library written by [Robin Berjon](https://twitter.com/robinberjon) that makes it easier to write technical specifications, or documents that tend to be technical in nature in general. It was originally designed for the purpose of writing W3C specifications, but has since grown to be able to support other outputs as well. On of the best things about ReSpec is its intrinsic understanding of [WebIDL](http://www.w3.org/respec/guide.html#webidl-support). You can outline the design for a new API and it makes it very easy to fill in the description of what the methods and properties do. It also makes it easy to refer to other specs using the [SpecRef database](http://www.specref.org/).

 

Bringing these two together, I have create a [Yeoman generator called generator-respec](https://www.npmjs.com/package/generator-respec) that outputs a basic ReSpec document.

 

Assuming you already have `node` and `npm` installed, you can install Yeoman with the command `npm install –g yo`. After that you should install the ReSpec generator with `npm install –g generator-respec`.

 

Now you have the tools installed, create a new folder to hold your specification and from the command prompt in that directory run `yo respec`. This will prompt you for a title, short-name, spec status, and author information and then create a new index.html document with an outline specification using ReSpec. From here you can edit your spec using the [ReSpec documentation](http://www.w3.org/respec/guide.html) as a guide.

 

The current implementation of generator-respec is very basic. I’m sure there are some obvious things that can be added. One idea I have is to support a subgenerator that creates related specs in the same folder. What else should be added? The [generator-respec project is available on GitHub](https://github.com/adrianba/generator-respec).
