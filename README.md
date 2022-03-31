# my_hammer_spoon_script

## Introduction
This is a hammer spoon script in using by myself. It can call many system APIs and complete many automation tasks, including automatically switching input methods, adjusting window positions, and mapping my mouse side keys to going further or going back which is useful in Safari and Finder.

After installing the hammer spoon, follow the prompts to grant the corresponding permissions, and then you can see a hidden folder `.hammerspoon` in the user's home directory and put the script into it. `init.lua` is required, and the remaining scripts will be called in this script.

My scripts include five documents,`init.lua`,`layout.lua`,`language.lua`,`markdown.lua`,`status-message.lua`. The second script refers to [example of the official website](http://www.hammerspoon.org/go/); the last three scripts refer to [a great project](https://github.com/JIagengDing/hammerspoon-config), and he refers to [another great project](https://www.bilibili.com/video/BV1Q54y197dw).

I have made a lot of changes to the reference code according to my own needs, including fixing some bugs and enhancing code readability. You can also refer to [Official Document](http://www.hammerspoon.org/docs/) to make a script that suits you.

Besides, I also uploaded karabiner's profile. You can use key mapping happily by replacing it with `~/.config/karabiner/karabiner.json` in your user directory.

## My design
I don't use Do Not Disturb Mode, so I used Karabiner to map f6 to a non-existent key f19, and then bound f19 to the entry and exit keys of markdown mode. It is worth mentioning that I think the shortcut key of typora is convenient enough. The script markdown mode that automatically exits will not help me, so I decided to change it to no automatic exit, so that continuous operation can enhance efficiency.

My system uses command+Accents to switch windows in the same software, and I don't often use the option on the right, so I map the option key on the right to switch window keys. I don't like the way the Mac system switches the input method, so I adjust the shortcut keys of the system adjustment input method to a combination of shortcut keys that are almost non-touchable, such as `command+option+command+space`, and mapped the left shift. Short press is mapped to this set of shortcut keys, and if you press it without lifting it, it will still be shift. These mapping operations are all done with Karabiner, which is also a very powerful software.

I have set the default language of some software. Every time the software in this list is activated (clicking the mouse from the out of focus state), the default language will be set and prompted quickly through the pop-up window. It's easy to implement this function. The problem is how to make it unduly disturb me, such as prompting the current input method inappropriately when I don't need to input. At present, the software still has a bug. The specific performance is that when the system language is English at this moment, click "System Preferance" or anything else on the taskbar, and everything is normal. However, when the system language is Chinese at this moment, when the same operation is performed, there will be a switching language pop-up window every mouse click. The pop-up window of words is " 中 文 " in my settings). In fact, I don't set the default language of system-related software (they usually do not need to be entered), and the Chinese and English input methods are exactly the same in my code, so such bugs should not appear. I can't solve this problem. If anyone knows how to solve it, you can send an issue to contact me. Thank you.

## Updates
**2022.4.1** Now it supports Caps_lock to be binded with upper-case characters even in Chinese langugge input method, which is not originally supported in macOS. Now the input method is quite the same as that in windows system. You should bind your Caps_lock with f16 by Karabiner first, for there is some trouble binding a single function-key to a script function.
