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
hs.alert.show(" 配置已加载 ",0.5)

-- 模拟手动输入
-- 可用于粘贴文本时彻底消除格式，以及某校选课系统的手动输入承诺😬
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
-- 前进很少使用，已弃用此功能。或许下键设定为mission_control更合适
hs.hotkey.bind({}, "f17", function() 
  hs.eventtap.keyStroke('cmd', ']', 0)
end)

