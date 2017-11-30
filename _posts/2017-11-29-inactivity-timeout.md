---
title: "Setting the inactivity timeout in Windows"
last_modified_at: 20171129T230200Z
---
Windows has a timeout that can return you to the lock screen after a period of inactivity. This
is useful if you want to make sure the PC gets locked if you walk away but don't want to use a
screen saver and don't want the PC to go to sleep. It is easy through the normal settings app to
configure the latter two cases.

To configure the inactivity timeout, you need to run `gpedit.msc` and navigate to the Security
Options folder shown in this screen grab.

[![Screenshot of Local Group Policy Editor showing the Computer Configuration - Windows Settings -
Security Settings - Local Policies - Security Options node](/assets/uploads/2017/inactivity-timeout.png)](/assets/uploads/2017/inactivity-timeout.png)

The policy you need is called "Interactive login: Machine inactivity limit". Double-click on this
and you can configure a timeout in seconds.
