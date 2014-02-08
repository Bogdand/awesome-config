-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart", awesome.restart },
   { "Log out", function () awesome.spawn("gnome-session-quit"); end},
   { "Lock screen", function () awesome.spawn("gnome-screensaver-command -l"); end},
   { "Shutdown", function () awesome.spawn("gdm-control --shutdown"); awesome.quit() end}
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu },                                    
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

