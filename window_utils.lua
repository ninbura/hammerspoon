local function triggerMenuItem(menuPath)
  local app = hs.application.frontmostApplication()
  if app then
    app:selectMenuItem(menuPath)
  else
    hs.alert.show("No active application found")
  end
end

local function tileRight()
  triggerMenuItem({"Window", "Move & Resize", "Right"})
end
local function tileLeft()
  triggerMenuItem({"Window", "Move & Resize", "Left"})
end
local function tileTop()
  triggerMenuItem({"Window", "Move & Resize", "Top"})
end
local function tileBottom()
  triggerMenuItem({"Window", "Move & Resize", "Bottom"})
end
local function tileTopLeft()
  triggerMenuItem({"Window", "Move & Resize", "Top Left"})
end
local function tileTopRight()
  triggerMenuItem({"Window", "Move & Resize", "Top Right"})
end
local function tileBottomLeft()
  triggerMenuItem({"Window", "Move & Resize", "Bottom Left"})
end
local function tileBottomRight()
  triggerMenuItem({"Window", "Move & Resize", "Bottom Right"})
end
local function fill()
  triggerMenuItem({"Window", "Fill"})
end
local function moveToDisplay1()
  triggerMenuItem({"Window", "Move To", "DELL S2725QS (2)"})
end
local function moveToDisplay2()
  triggerMenuItem({"Window", "Move To", "EDIIG0216 (2)"})
end

local function bindHotkeys()
  local mods = {"ctrl", "shift", "cmd"}

  hs.hotkey.bind(mods, "right", tileRight)
  hs.hotkey.bind(mods, "left", tileLeft)
  hs.hotkey.bind(mods, "up", tileTop)
  hs.hotkey.bind(mods, "down", tileBottom)
  hs.hotkey.bind(mods, "1", tileTopLeft)
  hs.hotkey.bind(mods, "2", tileTopRight)
  hs.hotkey.bind(mods, "3", tileBottomLeft)
  hs.hotkey.bind(mods, "4", tileBottomRight)
  hs.hotkey.bind(mods, "space", fill)

  hs.hotkey.bind(mods, "0", moveToDisplay1)
  hs.hotkey.bind(mods, "9", moveToDisplay2)
end

bindHotkeys()