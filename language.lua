local alert = require "hs.alert"
local application = require "hs.application"

en = "com.apple.keylayout.ABC"
zh = "com.apple.inputmethod.SCIM.ITABC"
str_en = " English "
str_zh = " 中 文 "

-- 需要变换语言的app
-- 不需要输入的软件尽量不写.语言切换提示挺烦人的
local app_list = {
    {'/System/Applications/Utilities/Terminal.app', 'English'},
    {'/Applications/Visual Studio Code.app', 'English'},
    {'/Applications/PyCharm.app', 'English'},
    {'/Applications/IntelliJ IDEA.app ', 'English'},
    {'/Applications/CLion.app', 'English'},
    {'/Applications/Royal TSX.app ', 'English'},
    {'/Applications/Safari.app', 'English'},
    {'/Applications/Royal TSX.app', 'English'},

    {'/Applications/Keynote.app', 'Chinese'},
    {'/Applications/WeChat.app', 'Chinese'},
    {'/Applications/QQ.app', 'Chinese'},
    --{'/Applications/QQMusic.app', 'Chinese'},
    {'/System/Applications/Notes.app', 'Chinese'},
    {'/Applications/Typora.app', 'Chinese'},
    {'/Applications/texstudio.app', 'Chinese'},   
    {'/Applications/Microsoft Word.app', 'Chinese'},
}

-- 提示语言改变
function inputchange()    
    if hs.keycodes.currentSourceID() == en then
        alert.closeAll()
        alert.show(str_en,0.5)
    elseif hs.keycodes.currentSourceID() == zh then
        alert.closeAll()
        alert.show(str_zh,0.5)
    end
end

-- 我不懂为啥，但是如果把切换语言后的输出去掉，改成调用那个注释掉的函数，就会有多次输出，而且输出中英文不固定
-- 更改输入法并提示
function updateFocusAppInputMethod(app_path)
    for _, app in pairs(app_list) do
        local appPath = app[1]
        local expectedIme = app[2]
        if app_path == appPath then
            if expectedIme == 'English' then
                hs.keycodes.currentSourceID(en)
                alert.closeAll()
                alert.show(str_en,0.5)
            elseif expectedIme == 'Chinese' then
                hs.keycodes.currentSourceID(zh)
                alert.closeAll()
                alert.show(str_zh,0.5)
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

-- 锁定大写.大写键重映射到了f16上
-- 功能不稳定，已弃用
hs.hotkey.bind({}, "f16", function() 
    now = en                                 
    if hs.hid.capslock.get() == false then  
        alert.closeAll()
        hs.alert.show(" 大 写 ",0.5)

        now = hs.keycodes.currentSourceID() 

        hs.keycodes.currentSourceID(en)
        hs.hid.led.set("caps", true)
        hs.hid.capslock.set(true)
    else
        alert.closeAll()
        hs.alert.show(" 小 写 ",0.5) 

        hs.keycodes.currentSourceID(now)
        hs.hid.led.set("caps", false)
        hs.hid.capslock.set(false)
    end
end)

-- 大写键切换应用
hs.hotkey.bind({}, "f15", function() 
    hs.eventtap.keyStroke('command', 'tab', 0)
end)
