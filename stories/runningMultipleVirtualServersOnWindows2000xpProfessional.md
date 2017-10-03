---
title: Running multiple virtual servers on Windows 2000/XP Professional
layout: single
---
If you want often carry out development on more than one web site at a time, then you've probably come across the restriction in the Professional versions of Windows 2000 and Windows XP where you can only create a single virtual server. For a while, I've known that you could create more servers using ADSI and today I finally got around to putting together a generic script that does that.

Now, you can still only have one virtual server running at any one time, but being able to stop the current one and start a new one is useful, for me at any rate.

Here is the VBScript that creates a new virtual server:

```
Option Explicit
Dim oWeb,oSite,oRoot,nSiteID
Const POOLED = 2
Set oWeb = GetObject("IIS://LocalHost/W3SVC")
' Find next ID for new server and stop current servers
nSiteID = 0
For Each oSite In oWeb
 If oSite.Class="IIsWebServer" Then
  If IsNumeric(oSite.Name) Then
   If CLng(oSite.Name)>nSiteID Then _
    nSiteID = CLng(oSite.Name)
  End If
  oSite.Stop
 End If
Next
nSiteID = nSiteID + 1
' Create new server
Set oSite = oWeb.Create("IIsWebServer",CStr(nSiteID))
oSite.ServerComment = "Web Site " & CStr(nSiteID)
oSite.DefaultDoc = "default.htm,default.asp"
oSite.ServerBindings = ":80:"
oSite.ServerAutoStart = 0
oSite.SetInfo
' Create root
Set oRoot = oSite.Create("IIsWebVirtualDir","ROOT")
oRoot.Path = "C:\Inetpub\wwwroot"
oRoot.AccessRead = True
oRoot.SetInfo
oRoot.AppCreate2 POOLED
oRoot.AppEnable
oRoot.AppFriendlyName = "Default Application"
oRoot.SetInfo
oSite.Start
```

I'm hoping others might find this useful too.