local M = {}

M.units = {
  right = { x = 0.5, w = 0.5 },
  left = { w = 0.5 },
  top = { h = 0.5 },
  bottom = { y = 0.5, h = 0.5 },
  topLeft = { w = 0.5, h = 0.5 },
  topRight = { x = 0.5, w = 0.5, h = 0.5 },
  bottomLeft = { y = 0.5, w = 0.5, h = 0.5 },
  bottomRight = { x = 0.5, y = 0.5, w = 0.5, h = 0.5 },
  fill = {},
  center = { x = 0.25, y = 0.25, w = 0.5, h = 0.5 },
}

local function setWindowUnit(unit, win)
  win = win or hs.window.focusedWindow()
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

M.setWindowUnit = setWindowUnit

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

local function tileRight() setWindowUnit(M.units.right) end
local function tileLeft() setWindowUnit(M.units.left) end
local function tileTop() setWindowUnit(M.units.top) end
local function tileBottom() setWindowUnit(M.units.bottom) end
local function tileTopLeft() setWindowUnit(M.units.topLeft) end
local function tileTopRight() setWindowUnit(M.units.topRight) end
local function tileBottomLeft() setWindowUnit(M.units.bottomLeft) end
local function tileBottomRight() setWindowUnit(M.units.bottomRight) end
local function fill() setWindowUnit(M.units.fill) end
local function tileCenter() setWindowUnit(M.units.center) end

local function bindHotkeys()
  local mods = { "ctrl", "shift", "cmd" }

  hs.hotkey.bind(mods, "right", tileRight)
  hs.hotkey.bind(mods, "left", tileLeft)
  hs.hotkey.bind(mods, "up", tileTop)
  hs.hotkey.bind(mods, "down", tileBottom)
  hs.hotkey.bind(mods, "f1", tileTopLeft)
  hs.hotkey.bind(mods, "f2", tileTopRight)
  hs.hotkey.bind(mods, "f3", tileBottomLeft)
  hs.hotkey.bind(mods, "f4", tileBottomRight)
  hs.hotkey.bind(mods, "f", fill)
  hs.hotkey.bind(mods, "t", tileCenter)

  hs.hotkey.bind(mods, "r", moveWindowToMouseScreen)
end

bindHotkeys()

return M
