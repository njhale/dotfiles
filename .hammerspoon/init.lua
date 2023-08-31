function DropIt(appName)
	local app = hs.application.get(appName)

	if app then
		if not app:mainWindow() then
			app:selectMenuItem({ appName, "New OS window" })
		elseif app:isFrontmost() then
			app:hide()
		else
			app:activate()
		end
	else
		hs.application.launchOrFocus(appName)
		app:mainWindow().setShadows(false)
		app = hs.application.get(appName)
	end
end

hs.hotkey.bind({ "cmd", "ctrl" }, "k", function()
	DropIt("kitty")
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "s", function()
	DropIt("Slack")
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "c", function()
	DropIt("Chrome")
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "f", function()
	DropIt("Firefox")
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "n", function()
	DropIt("Notion")
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "t", function()
	DropIt("Things")
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "g", function()
	DropIt("GoLand")
end)
