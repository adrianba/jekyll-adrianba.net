---
title: "Installing the latest version of git on Ubuntu"
last_modified_at: 202103010T064500-0800
---

![An image with the git logo and text that says Install Latest Git on Ubuntu](https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/install_git_ubuntu.png?w=800&ssl=1)

I was reading about the latest [git security issue](https://www.openwall.com/lists/oss-security/2021/03/09/3)
this evening when I realized that upgrading the Windows version of `git` using
[Chocolatey](https://chocolatey.org/) gave me a much newer version than the
Ubuntu version on WSL.

```
C:\>git --version
git version 2.30.2.windows.1
```

I found this description of how to
[Install latest Git on Ubuntu-based Linux distributions](https://itsfoss.com/install-git-ubuntu/)
by adding a new Personal Package Archive (PPA) to your apt repository list that
tracks the latest version of `git`.

```
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
```

Now I have the latest version installed.

```
$ git --version
git version 2.30.2
```
