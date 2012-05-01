-- Author: Bogdan Danilyuk

local widget    = widget
local timer     = timer
local awful     = require("awful")
local naughty   = require("naughty")
local beautiful = require("beautiful")
local math      = require("math")
local setmetatable = setmetatable

module("stopwatch")


stopwatch = {}
stopwatch.widget = widget({ type = "textbox", name = "stopwatch.widget", align = "right" })

stopwatch.tooltip = awful.tooltip({ objects = { stopwatch.widget },})
stopwatch.tooltip:set_text("Stopwatch")

-- command must start with a space!
volumecfg.mixercommand = function (command)
       local fd = io.popen("amixer -c " .. volumecfg.cardid .. command)
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
       volumecfg.widget.text = volume
end
volumecfg.update = function ()
       volumecfg.mixercommand(" sget " .. volumecfg.channel)
end
volumecfg.up = function ()
       volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 1%+")
end
volumecfg.down = function ()
       volumecfg.mixercommand(" sset " .. volumecfg.channel .. " 1%-")
end
volumecfg.toggle = function ()
       volumecfg.mixercommand(" sset " .. volumecfg.channel .. " toggle")
end
volumecfg.widget:buttons({
       button({ }, 4, function () volumecfg.up() end),
       button({ }, 5, function () volumecfg.down() end),
       button({ }, 1, function () volumecfg.toggle() end)
})
volumecfg.update()
-- }}}







--[[ 25 min
local pomodoro_time = 60 * 25

local pomodoro_image_path = beautiful.pomodoro_icon or awful.util.getdir("config") .."/pomodoro/pomodoro.png"

-- setup widget
local pomodoro_image = image(pomodoro_image_path)
--]]

pomodoro = widget({ type = "imagebox" })
pomodoro.image = pomodoro_image

-- setup timers
local pomodoro_timer = timer({ timeout = pomodoro_time })
local pomodoro_tooltip_timer = timer({ timeout = 1 })
local pomodoro_nbsec = 0

local function pomodoro_start()
    pomodoro_timer:start()
    pomodoro_tooltip_timer:start()
    pomodoro.bg    = beautiful.bg_normal
 end

local function pomodoro_stop()
   pomodoro_timer:stop(pomodoro_timer)
   pomodoro_tooltip_timer:stop(pomodoro_tooltip_timer)
   pomodoro_nbsec = 0
end

local function pomodoro_end()
    pomodoro_stop()
    pomodoro.bg    = beautiful.bg_urgent
end

local function pomodoro_notify(text)
   naughty.notify({ title = "Pomodoro", text = text, timeout = 10,      
                    icon = pomodoro_image_path, icon_size = 64,
                    width = 200
                 })
end

pomodoro_timer:add_signal("timeout", function(c) 
                                          pomodoro_end()
                                          pomodoro_notify('Ended')  
                                       end)

pomodoro_tooltip_timer:add_signal("timeout", function(c) 
                                             pomodoro_nbsec = pomodoro_nbsec + 1
                                       end)

pomodoro_tooltip = awful.tooltip({
                                    objects = { pomodoro },
                                    timer_function = function()
                                                        if pomodoro_timer.started then
                                                           r = (pomodoro_time - pomodoro_nbsec) % 60
                                                           return 'End in ' .. math.floor((pomodoro_time - pomodoro_nbsec) / 60) .. ' min ' .. r
                                                        else
                                                           return 'pomodoro not started'
                                                        end
                                                     end,
})

local function pomodoro_start_timer()
   if not pomodoro_timer.started then
      pomodoro_start()
      pomodoro_notify('Started')
   else
      pomodoro_stop()
      pomodoro_notify('Canceled')
   end
end

pomodoro:buttons(awful.util.table.join(
                    awful.button({ }, 1, pomodoro_start_timer)
              ))

setmetatable(_M, { __call = function () return pomodoro end })
