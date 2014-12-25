-- {{{ Wibox
-- Create a textclock widget
local wibox = require("wibox")
mytextclock = awful.widget.textclock.new()

require('widgets/calendar2')
calendar2.addCalendarToWidget(mytextclock)

-- Create a systray
mysystray = wibox.widget.systray()

spacer = wibox.widget.textbox(" ")
separator = wibox.widget.textbox("|")

require('widgets/battery')
require('widgets/memory')
require('widgets/cpu')
require('widgets/volume')
require('widgets/moc')
require('widgets/keyboard')

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))
for s = 1, screen.count() do
    -- Create a promptbox for each screen

    mypromptbox[s] = awful.widget.prompt({ layout = wibox.layout.fixed.horizontal() })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s, height = 18 })
    -- Add widgets to the wibox - order matters
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])
    if s == 1 then 
      left_layout:add(mocWidget.widget) 
    end

    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(mysystray) end
    right_layout:add(spacer)
    right_layout:add(separator)
    right_layout:add(spacer)
    right_layout:add(keyboardWidget.widget)
    right_layout:add(spacer)
    right_layout:add(separator)
    right_layout:add(spacer)
    right_layout:add(volumeWidget.icon)
    right_layout:add(spacer)
    right_layout:add(volumeWidget.widget)
    right_layout:add(spacer)
    right_layout:add(separator)
    right_layout:add(spacer)
    right_layout:add(memoryWidget.icon)
    right_layout:add(spacer)
    right_layout:add(memoryWidget.widget)
    right_layout:add(spacer)
    right_layout:add(separator)
    right_layout:add(spacer)
    right_layout:add(cpuWidget.icon)
    right_layout:add(spacer)
    right_layout:add(cpuWidget.widget)
    right_layout:add(spacer)
    right_layout:add(separator)
    right_layout:add(spacer)
    right_layout:add(batteryWidget.icon)
    right_layout:add(spacer)
    right_layout:add(batteryWidget.widget)
    right_layout:add(spacer)
    right_layout:add(separator)
    right_layout:add(spacer)
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])


    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)    
end
-- }}}