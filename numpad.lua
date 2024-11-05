local numpadLayerActive = false

-- Function to enable or disable the numpad layer
function toggleNumpadLayer()
    numpadLayerActive = not numpadLayerActive
end

-- Listen for Control + F20 to toggle the numpad layer
hs.hotkey.bind({"ctrl"}, "F20", toggleNumpadLayer)

-- Define the numpad key mappings based on the specified layout
local numpadMappings = {
    b = "1",
    n = "2",
    m = "3",
    h = "4",
    j = "5",
    k = "6",
    y = "7",
    u = "8",
    i = "9",
    ["7"] = "/",
    ["8"] = "*",
    ["9"] = "-",
    l = "return",
    o = "return",
    [","] = ".",
    space = "0"
}

-- Eventtap to remap keys when the numpad layer is active
local numpadEvent = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
    if numpadLayerActive then
        local keyCode = event:getKeyCode()
        local character = hs.keycodes.map[keyCode]

        if numpadMappings[character] then
            hs.eventtap.keyStrokes(numpadMappings[character])
            
            return true
        end
    end

    return false
end)

-- Eventtap to remap keys when the numpad layer is active
local numpadEvent = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
    if numpadLayerActive then
        local keyCode = event:getKeyCode()
        local character = hs.keycodes.map[keyCode]

        if numpadMappings[character] then
            local output = numpadMappings[character]

            if output == "return" or output == "padclear" then
                
                hs.eventtap.keyStroke({}, output, 0)
            else
                hs.eventtap.keyStrokes(output)
            end

            return true
        end
    end

    return false
end)

numpadEvent:start()