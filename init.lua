local hyper = {"ctrl", "alt", "cmd"}

require("language")
require("layout")
require("markdown")

-- 所有提示语句的显示样式
hs.alert.defaultStyle = {
  strokeWidth  = 5, -- 边框宽度
  strokeColor = { white = 0, alpha = 1 }, -- 边框颜色
  fillColor   = { white = 1, alpha = 0.7 }, -- 背景颜色
  textColor = { white = 0, alpha = 1 }, -- 文字颜色
  textFont  = "PingFangSC-Medium", -- ".AppleSystemUIFont"
  textSize  = 42,
  radius = 25,
  atScreenEdge = 0,
  fadeInDuration = 0, -- 载入动画
  fadeOutDuration = 0, -- 淡出动画
  padding = 5, -- 文字的边距
}

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
