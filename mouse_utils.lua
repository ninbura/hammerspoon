local function moveMouseToFocusedWindowCenter() -- test
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
  local mods = {"ctrl", "cmd", "shift"}

  hs.hotkey.bind(mods, "`", moveMouseToFocusedWindowCenter)

  hs.hotkey.bind(mods, "\\", function()
    moveMouseToDisplayCenter("EDIIG0216 (1)")
  end)

  hs.hotkey.bind(mods, "]", function()
    moveMouseToDisplayCenter("KG282K (1)")
  end)

  hs.hotkey.bind(mods, "[", function()
    moveMouseToDisplayCenter("EDIIG0216 (3)")
  end)
end

bindHotkeys()