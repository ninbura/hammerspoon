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
  local mods = {"ctrl", "cmd", "shift"}

  hs.hotkey.bind(mods, "`", moveMouseToFocusedWindowCenter)

  hs.hotkey.bind(mods, "pad1", function()
    moveMouseToDisplayCenter("BenQ GW2480")
  end)

  hs.hotkey.bind(mods, "pad2", function()
    moveMouseToDisplayCenter("Elgato Prom.")
  end)

  hs.hotkey.bind(mods, "pad3", function()
    moveMouseToDisplayCenter("LG TV RVU")
  end)

  hs.hotkey.bind(mods, "pad4", function()
    moveMouseToDisplayCenter("VA249QG")
  end)

  hs.hotkey.bind(mods, "pad5", function()
    moveMouseToDisplayCenter("AW2725Q")
  end)

  hs.hotkey.bind(mods, "pad6", function()
    moveMouseToDisplayCenter("AW3425DW")
  end)

  hs.hotkey.bind(mods, "\\", function()
    moveMouseToDisplayCenter("LG ULTRAFINE")
  end)

  hs.hotkey.bind(mods, "pad7", function()
    moveMouseToDisplayCenter("LG ULTRAFINE")
  end)
end

bindHotkeys()
