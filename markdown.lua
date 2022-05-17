keyUpDown = function(modifiers, key)
  hs.eventtap.keyStroke(modifiers, key, 0)
end

function wrapSelectedText(wrapCharacters_1, wrapCharacters_2)
  local originalClipboardContents = hs.pasteboard.getContents()
  keyUpDown('cmd', 'c')
  hs.timer.doAfter(0.1, function()
    local selectedText = hs.pasteboard.getContents()
    local wrappedText = wrapCharacters_1 .. selectedText .. wrapCharacters_2
    hs.pasteboard.setContents(wrappedText)
    keyUpDown('cmd', 'v')

    hs.timer.doAfter(0.1, function()
      hs.pasteboard.setContents(originalClipboardContents)
    end)
  end)
end

function inlineLink()
  local linkUrl = hs.pasteboard.getContents()
  keyUpDown('cmd', 'c')

  hs.timer.doAfter(0.1, function()
    local linkText = hs.pasteboard.getContents()
    local markdown = '[' .. linkText .. '](' .. linkUrl .. ')'
    hs.pasteboard.setContents(markdown)
    keyUpDown('cmd', 'v')

    hs.timer.doAfter(0.1, function()
      hs.pasteboard.setContents(linkUrl)
    end)
  end)
end

--------------------------------------------------------------------------------
-- Define Markdown Mode
--------------------------------------------------------------------------------

markdownMode = hs.hotkey.modal.new({}, 'F20')

local message = require('status-message')
markdownMode.statusMessage = message.new('Markdown')
markdownMode.entered = function()
  markdownMode.statusMessage:show()
end
markdownMode.exited = function()
  markdownMode.statusMessage:hide()
end

function markdownMode.bindWithAutomaticExit(mode, key, fonction)
  mode:bind({}, key, function()
-- 操作后不自动退出。如果你需要它自动退出markdown模式，取消对下一句的注释
--  mode:exit()
    fonction()
  end)
end

markdownMode:bindWithAutomaticExit('d', function() -- 删除线
  wrapSelectedText('<del>', '</del>')
end)

markdownMode:bindWithAutomaticExit('4', function() -- 行内公式
  wrapSelectedText('$', '$')
end)

markdownMode:bindWithAutomaticExit('t', function() -- 居中一级标题
  wrapSelectedText('<h1 align="center">', '</h1>')
end)

markdownMode:bindWithAutomaticExit('l', function() -- 链接（作用同cmd+k）
  inlineLink()
end)

markdownMode:bindWithAutomaticExit('c', function() -- 行内代码块
  wrapSelectedText('`', '`')
end)

markdownMode:bindWithAutomaticExit('v', function() -- 黑色h2，适用于文末“参考链接”标题
  wrapSelectedText('<h2><font color="black">', '</font></h2>')
end)

hs.hotkey.bind({}, 'f6', function()
  markdownMode:enter()
end)
markdownMode:bind({}, 'f6', function()
  markdownMode:exit()
end)
