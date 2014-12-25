-- {{{ CPU usage widget
local wibox = require("wibox")
cpuWidget = {}
cpuWidget.widget = awful.widget.graph()
cpuWidget.widget:set_width(50)
cpuWidget.widget:set_height(20)
cpuWidget.widget:set_background_color("#494B4F")
cpuWidget.widget:set_color("#FF5656")
memoryWidget.widget:set_color({ type = "linear", from = { 0, 20 }, to = { 0, 0 }, stops = { {0, "#AECF96"}, {0.5, "#88A175"}, 
                    {1, "#FF5656"}}})
cpuWidget.tooltip = awful.tooltip({ objects = { cpuWidget.widget, cpuWidget.icon },})
cpuWidget.icon = wibox.widget.imagebox(beautiful.widget_cpu)

-- Register CPU widget
vicious.register(cpuWidget.widget, vicious.widgets.cpu, 
                    function (widget, args)
                        cpuWidget.tooltip:set_text("CPU Usage: " .. args[1] .. "%")
                        return args[1]
                    end)
--- }}}

