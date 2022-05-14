---
title: "Running ssh-agent with WSL2 (so that VSCode can find it)"
last_modified_at: 20220513T194500-0700
header:
  image: /assets/uploads/2022/keyboardlock.jpg
  image_description: "A photo of a laptop keyboard with a pad lock on top"
  caption: Photo by [FLY:D](https://unsplash.com/@flyd2069) on [Unsplash](https://unsplash.com/s/photos/security)
---

I often use Visual Studio Code together with WSL2 using the [Remote - WSL extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl). Recently, I have been using Docker running on a remote server accessed over SSH. When I tried to use the [Docker extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker) for VSCode, I would get an error message saying: "In order to use an SSH DOCKER_HOST, you must configure an ssh-agent.  Source: Docker (Extension)".

![Screen shot of VSCode error message](/assets/uploads/2022/must-configure-ssh-agent.png)

One of the easiest ways to ensure that `ssh-agent` is running is to use `keychain`.

To install `keychain`, use:

```
sudo apt install keychain
```

Then you need to edit your `.bashrc` file to include the following line:

```
eval `keychain -q --eval --agents ssh IDLIST`
```

Replace _IDLIST_ with the list of identity files in your `~/.ssh` folder.

For example, in my `.bashrc` file I have the line:

```
eval `keychain -q --eval --agents ssh id_rsa id_ed25519`
```

Now, each time you open a shell, `keychain` will check if `ssh-agent` is running and if not start it.