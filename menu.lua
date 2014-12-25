-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart", awesome.restart },
   { "Log out", function () awesome.quit(); end},
   { "Lock screen", function () awesome.spawn("gnome-screensaver-command -l"); end},
   { "htop", terminal .. " -e htop" }   
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu }, 
									{ "settings", "unity-control-center" },                                   
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
-- }}}

