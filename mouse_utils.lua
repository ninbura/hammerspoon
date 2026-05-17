local screens = require("screens")

local function moveMouseToFocusedWindowCenter()
  local win = hs.window.focusedWindow()
  if win then
    local f = win:frame()
    local center = hs.geometry.point(f.x + f.w / 2, f.y + f.h / 2)
    hs.mouse.absolutePosition(center)
  end
end

local function moveMouseToDisplayCenter(displayName)
  for _, screen in ipairs(hs.screen.allScreens()) do
    if screen:name() == displayName then
      local f = screen:frame()
      local center = hs.geometry.point(f.x + f.w / 2, f.y + f.h / 2)
      hs.mouse.absolutePosition(center)
      return
    end
  end
  hs.alert.show("Display not found: " .. displayName)
end

local function bindHotkeys()
  local mods = { "ctrl", "cmd", "shift" }

  hs.hotkey.bind(mods, "`", moveMouseToFocusedWindowCenter)

  hs.hotkey.bind(mods, "pad1", function()
    moveMouseToDisplayCenter(screens.leftPortrait)
  end)

  hs.hotkey.bind(mods, "pad2", function()
    moveMouseToDisplayCenter(screens.prompter)
  end)

  hs.hotkey.bind(mods, "pad3", function()
    moveMouseToDisplayCenter(screens.tv)
  end)

  hs.hotkey.bind(mods, "pad4", function()
    moveMouseToDisplayCenter(screens.rightPortrait)
  end)

  hs.hotkey.bind(mods, "pad5", function()
    moveMouseToDisplayCenter(screens.secondary)
  end)

  hs.hotkey.bind(mods, "pad6", function()
    moveMouseToDisplayCenter(screens.ultrawide)
  end)

  hs.hotkey.bind(mods, "\\", function()
    moveMouseToDisplayCenter(screens.primary)
  end)

  hs.hotkey.bind(mods, "pad7", function()
    moveMouseToDisplayCenter(screens.primary)
  end)
end

bindHotkeys()
