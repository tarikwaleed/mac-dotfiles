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

hs.alert.show("Hammerspoon config loaded")
