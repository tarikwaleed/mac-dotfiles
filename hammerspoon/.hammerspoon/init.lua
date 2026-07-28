hs.allowAppleScript(true)

-- App-switching hotkeys, ported from the GNOME Alt+<letter> setup in ../dotfiles/dconf.
-- Bare Cmd+<letter> is used intentionally; this overrides macOS's native Cmd+<letter>
-- shortcuts (Save, Copy, Paste, Find, etc.) system-wide.
local appHotkeys = {
  S = "Slack",
  T = "Terminal",
  F = "Google Chrome",
  C = "ClickUp",
  P = "Postman",
  E = "PyCharm CE",
  N = "Obsidian",
}

for key, appName in pairs(appHotkeys) do
  hs.hotkey.bind({"cmd"}, key, function()
    hs.application.launchOrFocus(appName)
  end)
end

-- Ctrl+A/C/V as select-all/copy/paste (Linux/Windows muscle memory), sent as the
-- underlying Cmd+<key> the app actually expects. Disabled while Terminal is frontmost,
-- since shells use Ctrl+A (start of line) and Ctrl+C (SIGINT) natively.
local ctrlToCmdKeys = {"a", "c", "v"}
local ctrlToCmdHotkeys = {}

for _, key in ipairs(ctrlToCmdKeys) do
  ctrlToCmdHotkeys[key] = hs.hotkey.bind({"ctrl"}, key, function()
    hs.eventtap.keyStroke({"cmd"}, key)
  end)
end

local terminalWatcher = hs.application.watcher.new(function(appName, eventType)
  if appName == "Terminal" then
    local action = (eventType == hs.application.watcher.activated) and "disable" or "enable"
    for _, hotkey in pairs(ctrlToCmdHotkeys) do
      hotkey[action](hotkey)
    end
  end
end)
terminalWatcher:start()

hs.alert.show("Hammerspoon config loaded")
