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
hs.alert.show("Config loaded",0.6)

-- 强制粘贴
hs.hotkey.bind({"ctrl"}, "V", function() 
  hs.eventtap.keyStrokes(hs.pasteboard.getContents()) 
end)

-- 切换窗口
hs.hotkey.bind({}, "f19", function() 
  keyUpDown('cmd', '`')
end)
