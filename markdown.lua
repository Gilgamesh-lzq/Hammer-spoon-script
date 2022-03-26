keyUpDown = function(modifiers, key)
  hs.eventtap.keyStroke(modifiers, key, 0)
end

function wrapSelectedText(wrapCharacters)
  local originalClipboardContents = hs.pasteboard.getContents()
  keyUpDown('cmd', 'c')
  hs.timer.doAfter(0.1, function()
    local selectedText = hs.pasteboard.getContents()
    local wrappedText = wrapCharacters .. selectedText .. wrapCharacters
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
--    mode:exit()
    fonction()
  end)
end

markdownMode:bindWithAutomaticExit('B', function()
  wrapSelectedText('**')
end)

markdownMode:bindWithAutomaticExit('i', function()
  wrapSelectedText('*')
end)

markdownMode:bindWithAutomaticExit('4', function()
  wrapSelectedText('$')
end)

markdownMode:bindWithAutomaticExit('s', function()
  wrapSelectedText('~~')
end)

markdownMode:bindWithAutomaticExit('l', function()
  inlineLink()
end)

markdownMode:bindWithAutomaticExit('c', function()
  wrapSelectedText('`')
end)

hs.hotkey.bind({}, 'f6', function()
  markdownMode:enter()
end)
markdownMode:bind({}, 'f6', function()
  markdownMode:exit()
end)
