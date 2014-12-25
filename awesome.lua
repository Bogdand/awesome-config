-- Standard awesome library
awful = require("awful")
awful.autofocus = require("awful.autofocus")
awful.rules = require("awful.rules")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
naughty = require("naughty")

vicious = require("vicious") 
require("helpers")
require("markup")

-- Themes define colours, icons, and wallpapers
-- beautiful.init("/usr/share/awesome/themes/default/theme.lua")
configpath="/home/"..os.getenv("USER").."/.config/awesome/"
beautiful.init(configpath.."/themes/greenaste/theme.lua")
--dbg(beautiful.awesome_icon)

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
