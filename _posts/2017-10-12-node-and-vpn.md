---
title: "NPM giving error EAI_AGAIN from Windows Subsystem for Linux (WSL)"
last_modified_at: 2012-10-12T17:44:00.000Z
---

This morning I was experimenting with some demo code and when I tried to
install some packages from `npm` I got the following network error:

```
request to https://registry.npmjs.org/XXX failed, reason: getaddrinfo EAI_AGAIN registry.npmjs.org:443
```

where `XXX` was the name of the package.

I was running bash from Ubuntu using WSL but when I switched to a Windows command prompt and ran the Windows install of node/npm then it connected just fine.

It took a little searching around but I discovered that this was most likely to do with the network proxy we have at Microsoft or some other quirk of the network configuration. We are currently testing a new on-demand VPN configuration, which had connected me to the corporate network even though I was actually attached directly. Disconnecting the VPN made things "just work" so I guess there was some kind of networking loop that Windows native networking could figure out since it has my login credentials whereas Ubuntu couldn't.

So the `EAI_AGAIN` error is a transient failure and is probably related to something you can fix about your network config.