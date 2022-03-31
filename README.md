# my_hammer_spoon_script

## Introduction
This is a **hammer spoon** script in using by myself. It can call many macOS system APIs and complete many automation tasks.

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
- Force Upper-case English character when `Caps_lock` in any input method

## Updates
**2022.4.1** Now it supports Caps_lock to be binded with upper-case characters even in Chinese langugge input method, which is not originally supported in macOS. Now the input method is quite the same as that in windows system. You should bind your Caps_lock with f16 by Karabiner first, for there is some trouble binding a single function-key to a script function.

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

At present, the software still has a bug. The specific performance is that when the system language is English at present, click "System Preferance" or anything else on the taskbar, and everything is normal. However, when the system language is Chinese at present, when the same operation is performed, there will be a switching language pop-up window every mouse click. The pop-up window of words is " 中 文 " in my settings. In fact, I don't set the default language of system-related software (they usually do not need to be entered), and the Chinese and English input methods are exactly the same in my code, so such bugs should not appear. I can't solve this problem. If anyone knows how to solve it, you can send an issue to contact me. Thank you.

