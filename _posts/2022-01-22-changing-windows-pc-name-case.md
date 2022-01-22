---
title: "Change Windows PC name to lower case"
last_modified_at: 202201220T074500-0800
header:
  image: /assets/uploads/2022/alphabet.jpg
  image_description: "A photo of magnetic letters"
  caption: Photo by [Towfiqu barbhuiya](https://unsplash.com/@towfiqu999999) on [Unsplash](https://unsplash.com/s/photos/letters)
---

It is straightforward to change the name of your Windows PC through the Settings
app (go to System, About, and choose "Rename this PC"). One problem, though, is
if you want to change the case of the name, but not the name itself. For example,
changing from "SURFACE" to "surface". If you try to use the built-in UI for this,
Windows recognizes that the name hasn't changed and won't let you continue.

One approach would be to rename to something else, then back again with the desired
case. However, there is an easier way using the command prompt.

In a command prompt running as Administrator, use the following command:

```
WMIC computersystem where caption='current_name' rename new_name
```
