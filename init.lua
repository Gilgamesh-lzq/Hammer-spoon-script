local hyper = {"ctrl", "alt", "cmd"}

require("language")
require("layout")
require("markdown")

-- 自动重新加载配置文件
function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
      if file:sub(-4) == ".lua" then
          doReload = true
      end
  end
  if doReload then
      hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.closeAll()
hs.alert.show(" 配置已加载 ",0.6)

-- 强制粘贴(针对某校选课系统NT要求🥴)
hs.hotkey.bind({"ctrl"}, "V", function() 
  hs.eventtap.keyStrokes(hs.pasteboard.getContents()) 
end)

-- 切换窗口.右option映射到了f19
hs.hotkey.bind({}, "f19", function() 
  hs.eventtap.keyStroke('cmd', '`', 0)
end)

-- 鼠标上键 回退 适配 Logitech Anywhere 3
-- 请自行使用 Karabiner-EventViewer 观察和调整按键映射
hs.hotkey.bind({}, "f18", function() 
  hs.eventtap.keyStroke('cmd', '[', 0)
end)

-- 鼠标下键 前进
hs.hotkey.bind({}, "f17", function() 
  hs.eventtap.keyStroke('cmd', ']', 0)
end)

