-- 左半屏
hs.hotkey.bind({"cmd"}, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
  end)

-- 右半屏
hs.hotkey.bind({"cmd"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h   

  win:setFrame(f)
end)

-- 全屏
hs.hotkey.bind({"cmd"}, "return", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

-- 向上一个显示器
hs.hotkey.bind({"cmd"}, "Up", function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenNorth(ensureInScreenBounds)
end)

-- 向下一个显示器
hs.hotkey.bind({"cmd"}, "Down", function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenSouth(ensureInScreenBounds)
end)

function middle()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 5)
  f.y = max.y + (max.h / 5)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end

-- 居中
hs.hotkey.bind({"cmd"}, "f3", middle)

-- 禁止动画（否则闪屏很严重）
hs.window.animationDuration = 0

