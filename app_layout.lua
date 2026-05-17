local windowUtils = require("window_utils")
local screens = require("screens")
local apps = require("apps")

local function getScreenByName(name)
  for _, screen in ipairs(hs.screen.allScreens()) do
    if screen:name() == name then return screen end
  end
end

local function positionWindow(win, screenName, unit)
  local screen = getScreenByName(screenName)
  if not screen then return end
  win:moveToScreen(screen, false, true)
  windowUtils.setWindowUnit(unit, win)
end

local rules = {
  [apps.discord] = {
    screen = screens.rightPortrait,
    unit = windowUtils.units.top,
  },
  [apps.finder] = {
    screen = screens.rightPortrait,
    unit = windowUtils.units.bottom,
  },
  [apps.obs] = {
    screen = screens.leftPortrait,
    unit = windowUtils.units.fill,
  },
}

local watcher = hs.application.watcher.new(function(name, event, app)
  if event ~= hs.application.watcher.launched then return end
  local rule = rules[name]
  if not rule then return end
  local elapsed = 0
  hs.timer.waitUntil(
    function()
      elapsed = elapsed + 0.1
      return app:mainWindow() ~= nil or elapsed >= 10
    end,
    function()
      local win = app:mainWindow()
      if win then positionWindow(win, rule.screen, rule.unit) end
    end,
    0.1
  )
end)

watcher:start()

local function bindHotkeys()
  local mods = { "ctrl", "cmd", "shift" }

  hs.hotkey.bind(mods, "tab", function()
    local finder = hs.application.get(apps.finder)
    if not finder then return end
    for _, win in ipairs(finder:allWindows()) do
      positionWindow(win, rules[apps.finder].screen, rules[apps.finder].unit)
    end
  end)
end

bindHotkeys()
