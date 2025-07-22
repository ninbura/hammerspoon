local function setWindowUnit(unit)
  local win = hs.window.focusedWindow()
  if not win then
    hs.alert.show("No focused window found")
    return
  end

  local screen = win:screen()
  local screenFrame = screen:frame()

  local newFrame = {
    x = screenFrame.x + (screenFrame.w * (unit.x or 0)),
    y = screenFrame.y + (screenFrame.h * (unit.y or 0)),
    w = screenFrame.w * (unit.w or 1),
    h = screenFrame.h * (unit.h or 1),
  }

  win:setFrame(newFrame)
end

local function moveWindowToMouseScreen()
  local win = hs.window.focusedWindow()
  if not win then
    hs.alert.show("No focused window found")
    return
  end

  local mouseScreen = hs.mouse.getCurrentScreen()
  if mouseScreen and win:screen():id() ~= mouseScreen:id() then
    win:moveToScreen(mouseScreen)
  else
    hs.alert.show("Could not find a different screen under the mouse.")
  end
end

local function tileRight()
  setWindowUnit({ x = 0.5, w = 0.5 })
end
local function tileLeft()
  setWindowUnit({ w = 0.5 })
end
local function tileTop()
  setWindowUnit({ h = 0.5 })
end
local function tileBottom()
  setWindowUnit({ y = 0.5, h = 0.5 })
end
local function tileTopLeft()
  setWindowUnit({ w = 0.5, h = 0.5 })
end
local function tileTopRight()
  setWindowUnit({ x = 0.5, w = 0.5, h = 0.5 })
end
local function tileBottomLeft()
  setWindowUnit({ y = 0.5, w = 0.5, h = 0.5 })
end
local function tileBottomRight()
  setWindowUnit({ x = 0.5, y = 0.5, w = 0.5, h = 0.5 })
end
local function fill()
  setWindowUnit({})
end

-- Your hotkey bindings remain unchanged
local function bindHotkeys()
  local mods = { "ctrl", "shift", "cmd" }

  hs.hotkey.bind(mods, "right", tileRight)
  hs.hotkey.bind(mods, "left", tileLeft)
  hs.hotkey.bind(mods, "up", tileTop)
  hs.hotkey.bind(mods, "down", tileBottom)
  hs.hotkey.bind(mods, "1", tileTopLeft)
  hs.hotkey.bind(mods, "2", tileTopRight)
  hs.hotkey.bind(mods, "3", tileBottomLeft)
  hs.hotkey.bind(mods, "4", tileBottomRight)
  hs.hotkey.bind(mods, "space", fill)

  hs.hotkey.bind(mods, "pad0", moveWindowToMouseScreen)
end

bindHotkeys()