-- hs.hotkey.bind({"cmd", "ctrl"}, "space", function()
--     local app = hs.application.get("kitty")
--     if app then
--         if not app:mainWindow() then
--             app:selectMenuItem({"kitty", "New OS window"})
--         elseif app:isFrontmost() then
--             app:hide()
--         else
--             app:activate()
--         end
--     else
--         hs.application.launchOrFocus("kitty")
--     end
-- end)
function dropit(appName)
  local app = hs.application.get(appName)

  if app then
      if not app:mainWindow() then
          app:selectMenuItem({appName, "New OS window"})
      elseif app:isFrontmost() then
          app:hide()
      else
          app:activate()
      end
  else
      hs.application.launchOrFocus(appname)
      app = hs.application.get(appName)
  end

  -- app:mainWindow():moveToUnit'[100,50,0,0]'
  app:mainWindow().setShadows(false)
end

hs.hotkey.bind({"cmd", "ctrl"}, "space", function()
  dropit("kitty")
end)

hs.hotkey.bind({"cmd", "ctrl"}, "s", function()
  dropit("Slack")
end)

hs.hotkey.bind({"cmd", "ctrl"}, "f", function()
  dropit("firefox")
end)
