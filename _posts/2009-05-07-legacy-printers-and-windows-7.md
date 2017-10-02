---
slug: legacy-printers-and-windows-7
title: Legacy printers and Windows 7
wordpress_id: 452
old_link: 'https://adrianba.net/2009/05/07/legacy-printers-and-windows-7/'
last_modified_at: 2009-05-07T17:10:06.000Z
---

I have an old printer. Very old. It's an Epson EPL-5500 and I got it in about 1995/6 and it has served me well ever since. Soon I might need a new printer (soon I won't be able to get toner cartridges for this one) but for now it is fine. It worked fine in Vista but now that I've decided to enter the 64-bit world with Windows 7, I need 64-bit drivers and they don't come with Win7. After all, who still uses a printer that is more than a decade old?

My printer is connected to my Windows Home Server and I know that server operating systems have the ability to host drivers for the printers they share so that when you connect to the printer, the driver is downloaded. Using Remote Desktop to connect to WHS, there is an Additional Drivers button on the Sharing tab of the printer properties.

![AdditionalDrivers](/assets/uploads/2009/05/img452-1.png)

WHS is based on Windows Server 2003 so it doesn't intrinsically know anything about Windows Vista or Windows 7. It does know about 64-bit Windows XP, though. By default the x64 checkbox is unchecked and the driver isn't installed. When you check the box, you're prompted to enter the DVD containing the driver. Unfortunately, WHS is 32-bit only so inserting the WHS DVD doesn't help. I found a copy of Windows Server 2003 64-bit on an old MSDN DVD and used that to provide a copy of the 64-bit driver. This gives me a â€˜Yes' in the Additional Drivers dialog and now I can connect to the printer from Windows 7. When I do, Windows prompts me to elevate permissions so that the driver can be installed and all is well.

Windows Home Server to the rescue again (sort of) and now all my Windows 7 PC's will be able to print again.
