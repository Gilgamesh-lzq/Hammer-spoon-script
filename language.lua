local alert = require "hs.alert"
local application = require "hs.application"

en = "com.apple.keylayout.ABC"
zh = "com.apple.inputmethod.SCIM.ITABC"
str_en = " A B C "
str_zh = " 中 文 "
last = str_zh

zh_style = {
    strokeWidth  = 5, -- 边框宽度
    strokeColor = { white = 0, alpha = 0.5 }, -- 边框颜色
    fillColor   = { white = 1, alpha = 0.7 }, -- 背景颜色
    textColor = { red=0.345, alpha=1 }, -- 文字颜色
    textFont  = "PingFangSC-Medium", -- ".AppleSystemUIFont"
    textSize  = 42,
    radius = 25,
    atScreenEdge = 0,
    fadeInDuration = 0, -- 载入动画
    fadeOutDuration = 0, -- 淡出动画
    padding = 5, -- 文字的边距
}

en_style = {
    strokeWidth  = 5, -- 边框宽度
    strokeColor = { white = 0, alpha = 0.5 }, -- 边框颜色
    fillColor   = { white = 1, alpha = 0.7 }, -- 背景颜色
    textColor = { blue=0.4, alpha=1 }, -- 文字颜色
    textFont  = "PingFangSC-Medium", -- ".AppleSystemUIFont"
    textSize  = 42,
    radius = 25,
    atScreenEdge = 0,
    fadeInDuration = 0, -- 载入动画
    fadeOutDuration = 0, -- 淡出动画
    padding = 5, -- 文字的边距
}


-- 需要变换语言的app
-- 不需要输入的软件尽量不写.频繁语言切换提示挺烦人的
local app_list = {
    {'/System/Applications/Utilities/Terminal.app', 'English'},
    {'/Applications/Visual Studio Code.app', 'English'},
    {'/Applications/PyCharm.app', 'English'},
    {'/Applications/IntelliJ IDEA.app ', 'English'},
    {'/Applications/CLion.app', 'English'},
    {'/Applications/Royal TSX.app ', 'English'},
    --{'/Applications/Safari.app', 'English'},

    {'/Applications/Keynote.app', 'Chinese'},
    {'/Applications/WeChat.app', 'Chinese'},
    {'/Applications/QQ.app', 'Chinese'},
    {'/System/Applications/Notes.app', 'Chinese'},
    {'/Applications/Typora.app', 'Chinese'},
    -- {'/Applications/texstudio.app', 'Chinese'},   
    {'/Applications/Microsoft Word.app', 'Chinese'},
}

-- 手动切换输入法时给出提示
function changeManually()
    now = hs.keycodes.currentSourceID()
    if now ~= last then
        if now == en then
            alert.closeAll()
            alert.show(str_en,en_style,0.5)
        elseif now == zh then
            alert.closeAll()
            alert.show(str_zh,zh_style,0.5)
        end
        last = hs.keycodes.currentSourceID()
    end
end

-- 提示语言改变
function inputchange()    
    if hs.keycodes.currentSourceID() == en then
        alert.closeAll()
        alert.show(str_en,en_style,0.5)
    elseif hs.keycodes.currentSourceID() == zh then
        alert.closeAll()
        alert.show(str_zh,zh_style,0.5)
    end
end

-- 更改输入法并提示
function updateFocusAppInputMethod(app_path)
    for _, app in pairs(app_list) do
        local appPath = app[1]
        local expectedIme = app[2]
        if app_path == appPath then
            if expectedIme == 'English' then
                hs.keycodes.currentSourceID(en)
                alert.closeAll()
                alert.show(str_en,en_style,0.5)
            elseif expectedIme == 'Chinese' then
                hs.keycodes.currentSourceID(zh)
                alert.closeAll()
                alert.show(str_zh,zh_style,0.5)
            end   
            break
        end        
    end  
end

-- 窗口激活时自动切换输入法
function applicationWatcher(appName, eventType, app_object)
    app_path = app_object:path()
    if eventType == application.watcher.activated then
        updateFocusAppInputMethod(app_path)
    else
        hs.keycodes.inputSourceChanged(changeManually)
    end
end
appWatcher = application.watcher.new(applicationWatcher)
appWatcher:start()

----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- 锁定大写.大写键重映射到了f16上
-- 功能不稳定，已弃用
-- hs.hotkey.bind({}, "f16", function() 
--     now = en                                 
--     if hs.hid.capslock.get() == false then  
--         alert.closeAll()
--         hs.alert.show(" 大 写 ",0.5)

--         now = hs.keycodes.currentSourceID() 

--         hs.keycodes.currentSourceID(en)
--         hs.hid.led.set("caps", true)
--         hs.hid.capslock.set(true)
--     else
--         alert.closeAll()
--         hs.alert.show(" 小 写 ",0.5) 

--         hs.keycodes.currentSourceID(now)
--         hs.hid.led.set("caps", false)
--         hs.hid.capslock.set(false)
--     end
-- end)

-- 大写键切换应用
-- hs.hotkey.bind({}, "f15", function() 
--     hs.eventtap.keyStroke('command', 'tab', 0)
-- end)
