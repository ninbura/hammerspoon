local capsLockToggleEvent = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
    local flags = event:getFlags()
    local isCtrlPressed = flags.ctrl
    local isShiftPressed = flags.shift
    local isF20Pressed = event:getKeyCode() == hs.keycodes.map["f20"]

    if isCtrlPressed and isShiftPressed and isF20Pressed then
        local capsLockEnabled = hs.hid.capslock.get()
        hs.hid.capslock.set(not capsLockEnabled)
        return true
    end
    return false
end)

capsLockToggleEvent:start()