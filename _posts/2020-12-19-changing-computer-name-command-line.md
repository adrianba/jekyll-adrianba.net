---
title: "Changing Computer Name from the command line on Windows 10"
last_modified_at: 20201218T150000-0700
---

Here is a way to change your Windows computer's name from the command line.
[[Source: Password Recovery Blog]](https://www.top-password.com/blog/3-ways-to-change-computer-name-in-windows-10/#:~:text=Method%203%3A%20Change%20Computer%20Name%20from%20Command%20Prompt)

The command line needs to be running as Administrator (Win+X, Command Prompt (Admin)).

# Renaming the computer

Now, run the following command:

`wmic computersystem where caption='current_pc_name' rename new_pc_name`

Replace _current_pc_name_ with your current computer name, and _new_pc_name_ with your desired new computer name.

After running the command, you will need to reboot for the changes to become effective.

# Getting the current name

To determine the current name of the computer, you can use the following command:

`wmic computersystem get caption`
