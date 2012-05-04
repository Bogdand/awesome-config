-- {{{ Volume widget

volumeWidget = {}
volumeWidget.cardid  = 0
volumeWidget.channel = "Master"
volumeWidget.widget = widget({ type = "textbox", name = "volumeWidget.widget", align = "right" })
volumeWidget.icon = widget({ type = "imagebox" })
volumeWidget.icon.image = image(beautiful.widget_volume)

volumeWidget.tooltip = awful.tooltip({ objects = { volumeWidget.widget },})
volumeWidget.tooltip:set_text("Volume")

-- command must start with a space!
volumeWidget.mixercommand = function (command)
       local fd = io.popen("amixer -c " .. volumeWidget.cardid .. command)
       local status = fd:read("*all")
       fd:close()

       local volume = string.match(status, "(%d?%d?%d)%%")
       volume = string.format("% 3d", volume)
       status = string.match(status, "%[(o[^%]]*)%]")
       if string.find(status, "on", 1, true) then
		volume = volume .. "%"
		awful.util.spawn_with_shell("amixer -c 0 sset Speaker unmute") 
		awful.util.spawn_with_shell("amixer -c 0 sset Headphone unmute") 
--		io.popen("amixer -c 0 sset Master unmute")
--		io.popen("amixer -c 0 sset Front unmute")
--		io.popen("amixer -c 0 sset Headphone unmute")
       else
               volume = volume .. "M"	
       end
       volumeWidget.widget.text = volume
end
volumeWidget.update = function ()
       volumeWidget.mixercommand(" sget " .. volumeWidget.channel)
end
volumeWidget.up = function ()
       volumeWidget.mixercommand(" sset " .. volumeWidget.channel .. " 1%+")
end
volumeWidget.down = function ()
       volumeWidget.mixercommand(" sset " .. volumeWidget.channel .. " 1%-")
end
volumeWidget.toggle = function ()
       volumeWidget.mixercommand(" sset " .. volumeWidget.channel .. " toggle")
end
volumeWidget.widget:buttons({
       button({ }, 4, function () volumeWidget.up() end),
       button({ }, 5, function () volumeWidget.down() end),
       button({ }, 1, function () volumeWidget.toggle() end)
})
volumeWidget.icon:buttons({
       button({ }, 4, function () volumeWidget.up() end),
       button({ }, 5, function () volumeWidget.down() end),
       button({ }, 1, function () volumeWidget.toggle() end)
})
volumeWidget.update()
-- }}}

