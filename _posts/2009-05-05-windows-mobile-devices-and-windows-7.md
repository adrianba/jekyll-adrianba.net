---
comments: false
date: 2009-05-05T12:16:47.000Z
layout: single
slug: windows-mobile-devices-and-windows-7
title: Windows Mobile Devices and Windows 7
wordpress_id: 450
old_link: 'https://adrianba.net/2009/05/05/windows-mobile-devices-and-windows-7/'
---
Yesterday, I started experimenting with building a simple application using the .NET Compact Framework v3.5 and Visual Studio 2008. It was pretty simple to get running using the emulator after downloading and installing the [Windows Mobile 6 SDKs](http://www.microsoft.com/downloads/details.aspx?FamilyID=06111a3a-a651-4745-88ef-3d48091a390b&displaylang=en) (make sure you get the Refresh).

 

As part of the SDK install, you are reminded that you will need to install the [Windows Mobile Device Center](http://www.microsoft.com/windowsmobile/en-us/help/synchronize/device-center.mspx) (WMDC) application in order to connect to a real device. Since I am running Win7 RC, I was a little nervous about this. I remember trying to install ActiveSync on Vista and getting in a mess before discovering you needed WMDC instead. I assumed that Win7 would come with WMDC but since the SDK couldna€™t see it I gambled and installed anyway.

 

After getting a simple application running with the emulator, I decided to try it on a real device. Connecting my phone with a USB cable, I ended up with Win7 detecting and then losing the connection and then re-detecting over and over every few seconds. I am not sure what went wrong but I guessed that maybe installing WMDC had been a mistake so I tried uninstalling and then reconnecting the phone. This time the driver for the phone downloading from Windows Update stalled.

 

I found a post on the TechNet forums from someone at Microsoft describing a [driver install issue with Windows Mobile and the Win7 Beta](http://social.technet.microsoft.com/Forums/en-US/w7itprogeneral/thread/56531f1b-cf19-40ee-83a0-6d040d48fcaf/). Although I would have expected this issue to be resolved by now, following the instructions to remove the RNDIS driver and then re-installing WMDC did the trick and on the third attempt the phone was detected and the drivers correctly downloaded and installed.

 

Ia€™m not sure exactly what the problem was and I hope that either I was just unlucky or that this issue is resolved before Win7 ships. Now that I can connect to the phone from Visual Studio, the next step is to deploy my test app and ensure it works on the device.

 

**Update 8 May**: Today, I just plugged my phone into a different Win7 machine and it automatically went off and downloaded everything it needed including Windows Mobile Device Center and everything just worked. I guess I went wrong before by trying to preempt what software I needed to install based on the SDK messages. Just plugging in the phone would have given me what I needed.

 
