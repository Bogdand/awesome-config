-- {{{ RAM usage widget
memoryWidget = awful.widget.progressbar()
memoryWidget:set_width(20)
memoryWidget:set_height(20)
memoryWidget:set_vertical(true)
memoryWidget:set_background_color('#494B4F')
memoryWidget:set_color('#AECF96')
memoryWidget:set_gradient_colors({ '#AECF96', '#88A175', '#FF5656' })
memoryWidget.icon = widget({ type = "imagebox" })
memoryWidget.icon.image = image(beautiful.widget_memory)

memoryWidget.tooltip = awful.tooltip({ objects = { memoryWidget.widget, memoryWidget.icon},})

vicious.cache(vicious.widgets.mem)
vicious.register(memoryWidget, vicious.widgets.mem,
                function (widget, args)
		    memoryWidget.tooltip:set_text(" RAM: " .. args[2] .. "MB / " .. args[3] .. "MB ")
                    return args[1]
                 end, 13)
-- }}}

