-- --stolen from https://github.com/bioe007/awesome-configs/blob/master/rc.lua

-- failsafe mode
local awful = require("awful")
local naughty = require("naughty")

 confdir = awful.util.getdir("config")
 local rc, err = loadfile(confdir .. "/awesome.lua");
 if rc then
     rc, err = pcall(rc);
     if rc then
         return;
     end
 end

 dofile("/etc/xdg/awesome/rc.lua");

 for s = 1,screen.count() do
     mypromptbox[s].text = awful.util.escape(err:match("[^\n]*"));
 end

 naughty.notify(
     {text="Awesome crashed during startup on " ..
             os.date("%d/%m/%Y %T:\n\n")
             .. err .. "\n", timeout = 0}
     )
