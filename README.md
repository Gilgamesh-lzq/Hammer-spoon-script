# My hammer spoon script

## Introduction
This is a **hammer spoon** script in using by myself. It can call many macOS system APIs and complete various automation tasks.

After installing the hammer spoon, follow the prompts to grant the corresponding permissions, and then you can see a hidden folder `.hammerspoon` in the user's home directory and put the script into it. `init.lua` is required, and the remaining scripts will be called in this script.

My scripts include five documents,`init.lua`,`layout.lua`,`language.lua`,`markdown.lua`,`status-message.lua`. The second script refers to [example of the official website](http://www.hammerspoon.org/go/); the last three scripts refer to [a great project](https://github.com/JIagengDing/hammerspoon-config), and he refers to [another great project](https://www.bilibili.com/video/BV1Q54y197dw).

I have made a lot of changes to the reference code according to my own needs, including fixing some bugs and enhancing code readability. You can also refer to [Official Document](http://www.hammerspoon.org/docs/) to make a script that suits you.

Besides, I also uploaded karabiner's profile. You can use key mapping happily by replacing it with `~/.config/karabiner/karabiner.json` in your user directory.

## Functions
- Automatically switch input methods according to specific softwares
- Show the current input method with a pop-up window when switching input methods 
- Adjust window position by short-key `⌘+↑`,`⌘+↓`,`⌘+←`,`⌘+→`,`⌘+⏎`
- Simulate pasting clipboard content as real user input (It's useful when a web page banned `⌘+V`)
- Press `right_option` to switch windows in one software
- Press `f6` to enter "Markdown Mode" and use a bunch of personalized shortcuts
- Map mouse's side keys to go further or go back (It's useful in Safari and Finder)
- Map `right_shift` to `delete`
- Map `left_shift` to switching input method
- Switch your currrntly open windows with `Caps_lock`

## Updates
**2022.4.1** Now it supports Caps_lock to be binded with upper-case characters even in Chinese langugge input method, which is not originally supported in macOS. Now the input method is quite the same as that in windows system. You should bind your Caps_lock with f16 by Karabiner first, for there is some trouble binding a single function-key to a script function.

**2022.5.17** Due to the instability of system calls, the last updated FORCE UPPER-CASE operation often fails, and now it has been deprecated.

**2022.5.28** For a long time, due to the strange logic of system calls, it is inevitable that it still prompts that the current input method is Chinese in the program you have not specified. Now, I have fixed it, and programs that are not in the list you wrote will no longer be disturbed by the prompt box. Of course, there will still be prompts when manually switching input methods.

**2022.7.30** Scripts now support the use of the shortcut key `f4` to quickly open or close Terminal. If you are troubled by an abnormal recovery exit prompt every time you reopen, you can consider changing `kill9` in the script to `kill`, but there is often a window prompt "Issession running sure to quit?" To solve this problem, you can consider closing the recovery exit window in terminal preferences. In addition, when switching on/off the Terminal, it will check whether vscode has any windows, and close the app if there are no other windows.

## balabala
Due to my limited personal level and the limitations of the **hammer spoon** software itself, some shortcut keys must be mapped with **Karabiner** to use, including：
- `right_option` to `f19`
- `button5` to `f18` (Logitech Anywhere3)
- `button4` to `f17` (Logitech Anywhere3)
- `caps_lock` to `f16`
- `right_shift` to `delete_forward`
- `f6` to `f6` (Media button Do-Not-Disturb-Mode by default)
- `left_shift`
  - to `shift` when *held*
  - to `⌘+⌥+⌃+space` when *tap* 

Besides, you should set set up the following shortcut keys in "System Preferance":
- `⌘+・` for switching windows in a software
- `⌘+⌥+⌃+space` for switching the next input method
