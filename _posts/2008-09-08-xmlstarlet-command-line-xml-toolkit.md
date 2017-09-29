---
comments: false
date: 2008-09-08T12:15:00.000Z
layout: single
slug: xmlstarlet-command-line-xml-toolkit
title: XMLStarlet Command Line XML Toolkit
wordpress_id: 434
old_link: 'https://adrianba.net/2008/09/08/xmlstarlet-command-line-xml-toolkit/'
---
 

I've recently been writing some scripts to automate a test harness. The test harness takes in an XML file as it's input. It turns out that most of the tests we want a slight variations of the same scenario and this means small tweaks to the XML file. When I started, I ended up with a new XML file for each scenario. This was okay for 2 variations of 3 scenarios (6 files) but as the test space grew so did the number of XML files. I wanted to find an easier way of keeping all the files in sync but I didn't want a heavyweight solution such as some kind of database or input file that I would somehow have to find a way to parse.

 

I ran across [XMLStarlet](http://xmlstar.sourceforge.net/), which is "..._a set of command line utilities (tools) which can be used to transform, query, validate, and edit XML documents and files using simple set of shell commands in similar way it is done for plain text files using UNIX grep, sed, awk, diff, patch, join, etc commands._"

 

There is a pre-built Win32 binary distribution so I can just copy the xml.exe program into the same folder as my test harness. This allows me to take my template input file and update it and the output squirts out of stdout. For example, take the following file:

 

<?xml version="1.0" encoding="utf-8" ?>        
<Data>    
   <Transaction ID="Step1">    
       <Action Name="Navigate" Url="URL" />    
   </Transaction>         
</Data>

 

I want to update the URL based on my test case. So I can use the following command:

 

xml ed -u "/Data/Transaction[@ID='Step1']/Action[@Name='Navigate']/@Url" -v "http://adrianba.net" input.xml

 

This command says, edit (ed) the xml file (input.xml) and update the node specified in the XPath (-u) and replace its value (-v). Obviously for such a simple input file I wouldn't need such a complex XPath but you can see how it ensures I only select the node I am interested in even if the file was larger.

 

The following output is what you'd expect and it's sent to stdout so you can pipe it into another command or redirect to a file.

 

<?xml version="1.0" encoding="utf-8"?>        
<Data>         
 <Transaction ID="Step1">         
   <Action Name="Navigate" Url="http://adrianba.net"/>         
 </Transaction>         
</Data>

 

There are other flags that can influence how the formatting of the output is handled.

 
