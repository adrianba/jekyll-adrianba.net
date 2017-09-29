---
comments: false
date: 2014-04-20T02:45:00.000Z
layout: single
slug: installing-squid-web-proxy-for-windows
title: Installing Squid Web Proxy for Windows
wordpress_id: 472
old_link: 'https://adrianba.net/2014/04/19/installing-squid-web-proxy-for-windows/'
---
I'm running Windows Server Essentials 2012 R2 for file storage and system backups. While I'm doing lots of [experimenting with Boxstarter](/2014/04/19/introducing-boxstarter), I wanted a caching web proxy that would keep local copies of the package files I'm installing over and over so that I wouldn't have to wait for them to come from the Internet each time.

 

[Squid](http://www.squid-cache.org/) is a well known caching proxy and [GuidoSerassio](http://wiki.squid-cache.org/GuidoSerassio) of [Acme Consulting S.r.l.](http://www.acmeconsulting.it/) maintains the official [native Windows port](http://squid.acmeconsulting.it/). You can download the latest stable build of Squid 2.7 from [here](http://squid.acmeconsulting.it/download/squid-2.7.STABLE8-bin.zip).

 

Installation is simple. I extracted all the files into C:squid. In the etc folder, there are four configuration files with .conf.default extensions. I removed the .default extension from `squid.conf`, `mime.conf`, and `cachemgr.conf`:

 

Next from a command prompt running as Administrator cd to `c:squidsbin` and run `squid -i` and `squid -z`. The first command installs squid as a service and the second initialises the cache folder (`c:squidvarcache`). Finally, start the service with `net start squid`.

 

Squid will now be running and listening on port 3128 (the default for squid). The last think you need to do is to configured the Windows Firewall to allow incoming connections to squid. Go to Advanced Settings from the Windows Firewall control panel. Select Inbound rules and add a New Rule allowing listening on TCP port 3128.

 

Now you should be all set - you can configure your browser to connect to the proxy on your server using port 3128. You can look in the `c:squidvarlogs` folder for activity logs to make sure things are working.
