function FocusApp(appName)
	local function tryFocus(attempts)
		local app = hs.application.find(appName)

		if app then
			local win = app:mainWindow()
			if not win then
				app:selectMenuItem({ appName, "New OS window" })
			elseif app:isFrontmost() then
				app:hide()
			else
				app:activate()
			end
		else
			if attempts > 0 then
				hs.application.launchOrFocus(appName)
				hs.timer.doAfter(0.1, function()
					tryFocus(attempts - 1)
				end)
			else
				hs.alert.show("Failed to launch " .. appName)
			end
		end
	end

	tryFocus(64)
end

-- Bindings for other applications without transparency
local appBindings = {
	{ key = "k", app = "kitty" },
	{ key = "d", app = "Discord" },
	{ key = "s", app = "Slack" },
	{ key = "v", app = "Visual Studio Code" },
	{ key = "c", app = "Google Chrome" },
	{ key = "t", app = "Clock" },
	{ key = "f", app = "Firefox" },
	{ key = "n", app = "Notion" },
	{ key = "g", app = "GoLand" },
	{ key = "p", app = "PyCharm" },
	{ key = "m", app = "Messages" },
}

hs.application.enableSpotlightForNameSearches(true)

for _, binding in ipairs(appBindings) do
	hs.hotkey.bind({ "cmd", "ctrl" }, binding.key, function()
		FocusApp(binding.app)
	end)
end
