---
title: "Clean recovery of Surface RT and Windows Update (2022)"
last_modified_at: 20221123T200000-0800
header:
  image: /assets/uploads/2022/microsoft-surface-windows-rt-1.jpg
  image_description: "A photo of a Surface RT"
---

If you reset a Microsoft Surface RT from a recovery disk, there is a good chance
that you will get an error from Windows Update: Error 8007000e Windows Update ran into a problem.
There are various guides on the web for how to recover from this but most of them didn't work for
me. Here is what did work.

1. On the Surface RT, I [created a USB recovery drive](https://support.microsoft.com/en-us/windows/create-a-usb-recovery-drive-460091d5-1e8f-cb33-2d17-8fdef77412d5) using the Recovery Drive app.
   I used a 4GB USB drive and the tool formats the drive and copies the recovery files (uncheck the
   checkbox for backing up files).

2. Download a [Surface Recovery Image](https://support.microsoft.com/en-us/surface-recovery-image)
   from Microsoft. If you type in your serial number, the site will provide the corresponding image
   for Windows 8.1.

3. Extract all the files from the recovery image zip file onto the USB overwriting existing files.

4. Power off the Surface RT. Insert the USB drive. Press and hold volume down, press the power button
   to power on, and as soon as you see the Surface logo, release the volume down button. The Surface
   should boot from the USB and under Advanced Options, you can reset from the drive. Choose to
   repartition the drive to make sure everything is reset.

5. This is the point at which if you connect to the network, you will get the Windows Update error.
   Instead, go through the OOBE but skip connecting to a network.

6. Install the following updates in order (even though they are out of order - no other order worked
   for me):
   - [KB-2919442](http://download.windowsupdate.com/c/msdownload/update/software/crup/2014/02/windows8.1-kb2919442-arm_506ed7113697c597c2859d295d562fa4311834ec.msu)
   - [KB-2932046](http://download.windowsupdate.com/c/msdownload/update/software/crup/2014/02/windows8.1-kb2932046-arm_fe6acf558880d127aef1a759a8c2539afc67b5fb.msu)
   - [KB-2919355](http://download.windowsupdate.com/c/msdownload/update/software/crup/2014/02/windows8.1-kb2919355-arm_a6119d3e5ddd1a233a09dd79d91067de7b826f85.msu)
   - Reboot
   - [KB-2938439](http://download.windowsupdate.com/d/msdownload/update/software/crup/2014/03/windows8.1-kb2938439-arm_4a536d9ddcd9993cbe4fbc309ebd50a18d65f954.msu)
   - Reboot
   - [KB-2937592](http://download.windowsupdate.com/c/msdownload/update/software/crup/2014/02/windows8.1-kb2937592-arm_860c83a0cccc0519111f57a679ae9f9d071315e5.msu)
   - Reboot
   - [KB-3173424](http://download.windowsupdate.com/d/msdownload/update/software/crup/2016/06/windows8.1-kb3173424-arm_e11b6837c0586d2b8d887f3bc33b3372fe83c8c7.msu)
   - [KB-3172614](http://download.windowsupdate.com/c/msdownload/update/software/updt/2016/07/windows8.1-kb3172614-arm_3d918d6c809bf6f57c8fcefa5db5c739e1754426.msu)
   - Reboot
   - [KB3097667](https://download.microsoft.com/download/C/0/F/C0F4437B-2A24-4C8F-9E67-BD487BDABADB/Windows8.1-KB3097667-arm.msu)
   - Reboot

7. At this point, connect to Wi-Fi and search for updates in Windows Update. It takes a long time to
   find any updates (maybe an hour or more) - just leave it. Then follow the instructions to install
   the updates. This will take several hours to install >100 updates.
