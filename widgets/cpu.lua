-- {{{ CPU usage widget
cpuWidget = awful.widget.graph()
cpuWidget:set_width(50)
cpuWidget:set_height(20)
cpuWidget:set_background_color("#494B4F")
cpuWidget:set_color("#FF5656")
cpuWidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })
cpuWidget.tooltip = awful.tooltip({ objects = { cpuWidget.widget.widget },})
cpuWidget.icon = widget({ type = "imagebox" })
cpuWidget.icon.image = image(beautiful.widget_cpu)

-- Register CPU widget
vicious.register(cpuWidget, vicious.widgets.cpu, 
                    function (widget, args)
                        cpuWidget.tooltip:set_text("CPU Usage: " .. args[1] .. "%")
                        return args[1]
                    end)
--- }}}

