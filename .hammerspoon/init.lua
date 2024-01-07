-- Configuration Reloading
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
       if file:sub(-4) == ".lua" then
	   doReload = true
       end
    end
    if doReload then
       hs.reload()
       hs.alert.show("Config loaded")
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

-- Configuration
local PREFIX={"cmd", "shift"}

---@param arg string
local function yabai_window(arg)
  hs.execute("yabai -m window " .. arg)
end

hs.hotkey.bind(PREFIX, "\\", function ()
   hs.alert.show("Hello world!")
end)

hs.hotkey.bind(PREFIX, "R", function ()
                  local _, cmd = hs.dialog.textPrompt("Enter an application name to run.", "Application:")
                  hs.execute("open -na \"" .. cmd .. "\"", true)
end)

hs.hotkey.bind(PREFIX, "SPACE", function ()
                  local _, cmd = hs.dialog.textPrompt("Open file or URL:", "File:")
                  hs.execute("open " .. cmd, true)
end)
