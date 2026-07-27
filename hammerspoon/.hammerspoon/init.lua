hs.allowAppleScript(true)

-- App-switching hotkeys, ported from the GNOME Alt+<letter> setup in ../dotfiles/dconf.
-- macOS reserves bare Cmd+<letter> for Save/Copy/Paste/Find etc. system-wide, so these
-- use Cmd+Option+<letter> instead to avoid clobbering every app's native shortcuts.
local appHotkeys = {
  S = "Slack",
  T = "Terminal",
  C = "Google Chrome",
  F = "Firefox",
  P = "Postman",
  Y = "PyCharm CE",
  N = "Finder",
  V = "Preview",
}

for key, appName in pairs(appHotkeys) do
  hs.hotkey.bind({"cmd", "alt"}, key, function()
    hs.application.launchOrFocus(appName)
  end)
end

hs.alert.show("Hammerspoon config loaded")
