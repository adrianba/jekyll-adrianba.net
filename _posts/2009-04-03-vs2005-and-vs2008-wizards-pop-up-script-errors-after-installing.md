---
slug: vs2005-and-vs2008-wizards-pop-up-script-errors-after-installing
title: VS2005 and VS2008 Wizards Pop Up Script Errors after installing IE8
wordpress_id: 447
old_link: >-
  https://adrianba.net/2009/04/03/vs2005-and-vs2008-wizards-pop-up-script-errors-after-installing/
last_modified_at: 2009-04-03T14:28:00.000Z
---

The Visual Studio and Internet Explorer teams discovered an issue affecting some of the code wizards in Visual Studio after installing IE8. Visual Studio hosts the browser control to implement the code wizards and the custom security manager that is part of VS doesna€™t expect a request from IE about an URLACTION that wasna€™t previously routed through the security manager.

 

The Visual Studio team have [posted a workaround](http://blogs.msdn.com/vcblog/archive/2009/03/28/some-vs2005-and-vs2008-wizards-pop-up-script-error.aspx) on their blog.

 

  
