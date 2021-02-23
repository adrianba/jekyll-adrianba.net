---
title: "Repeated SD Card Disconnects on Surface Pro 5"
last_modified_at: 20210223T071700-0800
---

I have been using a 128GB Micro-SD card as additional storage on my Surface Pro
(both Surface Pro 4 and Surface Pro 5) for some years and regularly run into issues
where the SD card doesn't stay connected. Randomly, it will disconnect and a few
seconds later reconnect. This is especially frustrating because I often host a
virtual disk image on the SD card and when it reconnects I have to manually
reconnect the virtual disk too.

I came across an [old post](https://answers.microsoft.com/en-us/surface/forum/all/sd-card-still-randomly-disconnects/e2f4b3f2-954b-4b1b-8a02-81029880edd0?auth=1#threadSummaryAnswersSection:~:text=Ran%20into%20the%20same%20problem%20regardless%20of%20SD%20card%20manufacturer) with a similar issue on Surface Pro 3. I recall that
there have been a variety of SD card issues with SP3 over the years that didn't
crop up with other editions, but I figured this was worth a try.

The change is to switch from the RealTek driver to a generic USB driver as follows:

1. Press **[Win]+X** then select **Device Manager**.
2. Expand **Universal Serial Bus Controller**, right-click on the **RealTek USB 3.0 Card Reader** driver, then select **Update Driver Software**.
3. From the pop-up, select **Browse my computer for driver software**.
4. On the next screen, select **Let me pick from a list of device drivers on my computer**.
5. Make sure Show compatible hardware is selected, then click on **USB Mass Storage Device**, then click Next.
6. It should say that Windows has successfully updated your driver software, so you can now click **Close**.
7. You should be prompted to restart in order for the changes to take effect.

I only just made this change a few days ago so I will see how it goes, but so far
I haven't had any further disconnects.
