run_once("dropbox start")
run_once("nm-applet")
-- run_once("indicator-cpufreq")
run_once("clipit")
-- run_once("gnome-session")
run_once("unity-settings-daemon")
-- run_once("setxkbmap -option grp:alt_shift_toggle us,ru")
-- run_once("synapse")
-- run_once("xrdb ~/.Xresources")


wallpaperFolder = "/home/bogdand/Pictures/wallpapers/2014_01"
if file_exists(wallpaperFolder) then
  x = 0

  -- setup the timer
  mytimer = timer { timeout = x }
  mytimer:connect_signal("timeout", function()

    -- tell awsetbg to randomly choose a wallpaper from your wallpaper directory
    os.execute("awsetbg -T -r " .. wallpaperFolder .. "&")

    -- stop the timer (we don't need multiple instances running at the same time)
    mytimer:stop()

    -- define the interval in which the next wallpaper change should occur in seconds
    -- (in this case anytime between 10 and 20 minutes)
    x = math.random( 600, 1200)

    --restart the timer
    mytimer.timeout = x
    mytimer:start()
  end)

  -- initial start when rc.lua is first run
  mytimer:start()
end