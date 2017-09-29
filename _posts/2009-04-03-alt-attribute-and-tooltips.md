---
comments: false
date: 2009-04-03T12:46:00.000Z
layout: single
slug: alt-attribute-and-tooltips
title: ALT attribute and ToolTips
wordpress_id: 446
old_link: 'https://adrianba.net/2009/04/03/alt-attribute-and-tooltips/'
---
For as long as I can remember (I think going back to IE3), Internet Explorer has displayed a ToolTip containing the contents of the [ALT attribute](http://msdn.microsoft.com/en-us/library/ms533073(VS.85).aspx) for IMG elements. Other browsers including Netscape 4 also showed the ToolTip. In IE7, this looks something like this:

![tooltip](/wp-content/uploads/2009/04/img446-1.png)In IE8 standards mode, the ToolTip is no longer shown. This is a change we made to be more standards compliant, more interoperable with other current browsers, and to encourage more accessible mark-up. ToolTips are still shown in quirks and IE7 standards modes.

The problem comes because having the ALT attribute displayed as a ToolTip encourages two behaviours that arenâ€™t compatible with the accessible web. The first is that content authors naturally enough set their ALT text to be something appropriate for a ToolTip but not _ALTernate_ text to represent the image in scenarios where users canâ€™t see the image. The second is that content authors actively donâ€™t put alternate text because they donâ€™t want a ToolTip displayed. Neither of these is desirable.

The solution for content authors is to use the [TITLE attribute](http://msdn.microsoft.com/en-us/library/ms534683(VS.85).aspx) if they want a ToolTip. The TITLE attribute applies to other elements with the same effect and not just images. The [ALT attribute](http://msdn.microsoft.com/en-us/library/ms533073(VS.85).aspx) should be used for text thatâ€™s an alternative to the image.


