-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")

require("vicious") 
require("helpers")
require("markup")

-- Load Debian menu entries
require("debian.menu")

-- Themes define colours, icons, and wallpapers
-- beautiful.init("/usr/share/awesome/themes/default/theme.lua")
configpath="/home/"..os.getenv("USER").."/.config/awesome/"
beautiful.init(configpath.."/themes/greenaste/theme.lua")
-- dbg(beautiful.awesome_icon)

require('global')
require('layouts')
require('tags')
require('menu')

require('widgets')

require('keybindings')
require("rules-signals")
require('autorun')

--beautiful.init("/home/bogdan/.config/awesome/awesome-themes/green-owl/rc.lua")
--beautiful.init("/home/bogdan/.config/awesome/awesome-themes/green-owl/theme.lua")
