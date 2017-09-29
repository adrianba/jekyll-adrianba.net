---
comments: false
date: 2016-01-06T22:39:48.000Z
layout: single
slug: using-sublime-text-as-your-git-editor-on-windows
title: Using Sublime Text as your git editor on Windows
wordpress_id: 524
old_link: >-
  https://adrianba.net/2016/01/06/using-sublime-text-as-your-git-editor-on-windows/
---
Many git commands require using an editor including [writing good commit messages](http://chris.beams.io/posts/git-commit/). I use [Sublime Text](http://www.sublimetext.com/3) as my default text editor and I wanted to make sure git launched Sublime Text appropriately.

On Windows, the sublime_text.exe program has a couple of command line options that help here. The `-n` option causes a new editing window to be created and the `-w` option tells Sublime Text to wait until you close the window before returning.

By default, the Sublime Text 3 installer puts everything into "C:\Program Files\Sublime Text 3". The spaces in the folder names makes the git command to configure the editor slightly trickier than normal. The following command sets up the global editor for git.

`git config --global core.editor "\"C:\Program Files\Sublime Text 3\sublime_text.exe\" -n -w"`

You can check that the configuration has been correctly stored with

`git config --global -l`
