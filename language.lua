local alert = require "hs.alert"
local application = require "hs.application"

en = "com.apple.keylayout.ABC"
zh = "com.apple.inputmethod.SCIM.ITABC"
str_en = " English "
str_zh = " 中 文 "

-- 需要变换语言的app
local app_list = {
    {'/System/Applications/Utilities/Terminal.app', 'English'},
    {'/Applications/Visual Studio Code.app', 'English'},
    {'/Applications/PyCharm.app', 'English'},
    {'/Applications/IntelliJ IDEA.app ', 'English'},
    {'/Applications/CLion.app', 'English'},
    {'/Applications/Royal TSX.app ', 'English'},
    {'/Applications/Safari.app', 'English'},
    {'/Applications/Royal TSX.app', 'English'},

    --{'/System/Library/CoreServices/Finder.app', 'Chinese'},
    {'/Applications/WeChat.app', 'Chinese'},
    {'/Applications/QQ.app', 'Chinese'},
    {'/Applications/QQMusic.app', 'Chinese'},
    {'/System/Applications/Notes.app', 'Chinese'},
    {'/Applications/Typora.app', 'Chinese'},
    {'/Applications/texstudio.app', 'Chinese'},   
    {'/Applications/Microsoft Word.app', 'Chinese'},
}

-- 提示语言改变
function inputchange()    
    if hs.keycodes.currentSourceID() == en then
        alert.closeAll()
        alert.show(str_en,0.6)
    elseif hs.keycodes.currentSourceID() == zh then
        alert.closeAll()
        alert.show(str_zh,0.6)
    end
end

-- 我不懂为啥，但是如果把切换语言后的输出去掉，改成调用那个注释掉的函数，就会有多次输出，而且输出中英文不固定
-- 更改输入法并提示
function updateFocusAppInputMethod(app_path)
    for _, app in pairs(app_list) do
        local appPath = app[1]                  -- 预期的软件路径
        local expectedIme = app[2]              -- 预期的语言
        if app_path == appPath then             -- 是需要改变输入法的软件
            if expectedIme == 'English' then
                hs.keycodes.currentSourceID(en) -- 切换成英文
                alert.closeAll()
                alert.show(str_en,0.6)
            elseif expectedIme == 'Chinese' then
                hs.keycodes.currentSourceID(zh) -- 切换成中文
                alert.closeAll()
                alert.show(str_zh,0.6)
            end   
            -- inputchange()
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
        hs.keycodes.inputSourceChanged(inputchange)       
    end
end
appWatcher = application.watcher.new(applicationWatcher)
appWatcher:start()

-- 锁定大写
hs.hotkey.bind({}, "f16", function() 
    if hs.hid.capslock.get() == false then   -- 当前没有大写锁定  
        alert.closeAll()
        hs.alert.show(" 大 写 ",0.6)
        now = hs.keycodes.currentSourceID()    
        hs.keycodes.currentSourceID(en)
        hs.hid.led.set("caps", true)
        hs.hid.capslock.set(true)
    else                                     -- 当前大写锁定
        alert.closeAll()
        hs.alert.show(" 小 写 ",0.6) 
        hs.keycodes.currentSourceID(now)
        hs.hid.led.set("caps", false)
        hs.hid.capslock.set(false)
    end
end)
