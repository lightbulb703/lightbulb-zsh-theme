# lightbulb.zsh-theme

A ZSH theme that displays the following:

- 💽: <span style="color:blue">OS</span> - <span style="color:yellow">Kernel Information</span>[ - **<span style="color:red">\*\*\*REBOOT REQUESTED\*\*\*</span>**]
- ╰─🕰: <span style="color:green">Datetime</span> - **<span style="color:magenta">Uptime</span>**
- ╰──📂: **<span style="color:cyan">Current directory</span>** (<span style="color:red">Number of files</span> and <span style="color:magenta">total size</span>)
-  ╰───🙂|🤬@🖥: Job status(Good|Bad) <span style="color:blue">username</span><span style="color:red">@</span><span style="color:cyan"><ins>hostname</ins></span>
-  ╰────>💡: <span style="color:magenta">TTY</span> **<span style="color:blue">git:(</span>status<span style="color:blue">)</span>** ->

## Sample Screenshot
A redacted example looks like this (**Job Status** changes and **\*\*\*REBOOT REQUESTED\*\*\*** are circled):

![Screenshot](screenshot.png)

## New feature - Reboot Notification!!

This will now let you know if you open a terminal that a reboot is requested.
  This is only checked on first launch of the terminal.
  The reboot check function for CentOS/Fedora depends on `yum-utils` or `dnf-utils`.
  Ubuntu checks for `/var/run/reboot-required`.

## Worth mentioning

I'm new to ZSH and only started using it because [Kali Linux](https://www.kali.org/news/kali-linux-2020-3-release/) decided to go that route and I wanted to see what all the hubbub was about.
  I set up this theme based on how I had my bash prompt set up.
  I've tested on Fedora and CentOS which is what I mainly use.
  Ubuntu seems to work as well although it is not as extensively tested.

Enjoy 🙂 (or not 🤬)!! 💡
