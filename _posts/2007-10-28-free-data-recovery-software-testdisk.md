---
slug: free-data-recovery-software-testdisk
title: Free data recovery software - TestDisk
wordpress_id: 412
old_link: 'https://adrianba.net/2007/10/28/free-data-recovery-software-testdisk/'
last_modified_at: 2007-10-28T18:37:19.000Z
---

I've copied across my IE favourites to a new PC knowing that I need to spend some time going through them and reorganising. There are things there that probably don't point to anything useful and a bunch that could be easier to find if they were in sensible folders.

 

While looking through some of the random things just dumped in the top level folder, I came across the link I'd saved to TestDisk. I came across this tool some time ago while I was having a bit of a panic trying to recover some data. It saved me then and is hence fondly recommended.

 

At the time, I was planning to use the recovery CD for my Toshiba M400. It's purpose is to format the hard disk and re-write an image of a Windows install with all the drivers installed and the tablet features enabled. I started by copying all my important files onto an external USB hard disk and then booted off the CD. The imaging software seemed to get a bit confused because I'd forgotten to unplug the USB drive so I turned off the system, unplugged the drive and then tried again. Everything went fine this time and in a few minutes I had a brand new install of Windows. Everything started to go wrong when I plugged the USB drive back in. What I hadn't realised was that when the recovery disk got confused with the extra drive being present, instead of deleting the partition table on the internal drive, it had done so on the USB drive. So now, all my carefully backed up files were on a drive where the partition table was no longer present and therefore unreadable.

 

I tried a number of different attempts before deciding that I really needed a proper tool to try to fix this. Partition Magic from [Symantec](http://www.symantec.com/) was one that was well known and considering the importance of the data, the price tag wasn't outrageous. Reviewing the product information suggested that it would do just what I needed and I could buy online. In the past I'd bought Symantec products online and found it very convenient. You download an ISO file then you can burn it to a disk and you've got the product there - easy. Only for some obscure reason, Partition Magic didn't come as an ISO file but just installed as a collection of files. This meant you couldn't boot off a disk as you would if you bought it from a store and for some reason, when running it under Windows on my laptop it just crashed while scanning the drive I wanted to repair.

 

I tried working with the support people from Symantec but they were pretty unhelpful. They didn't see the irony of them asking me to boot on a clean install of Windows and then to try it even though they hadn't given me a bootable image which would have made that easy.

 

At the end of my tether I gave up on Partition Magic and searched some more before landing on the [TestDisk](http://www.cgsecurity.org/wiki/TestDisk) site. To cut a long story short, TestDisk did an exhaustive search of the disk (which took quite a while) before telling me that it had found an NTFS partition and was quite willing to re-write the partition table if I so desired. And so all my data came back.

 

These days I make sure that back-up drives are nowhere near being connected while re-installing the OS but I keep a link to this (free!) tool in my favourites.
