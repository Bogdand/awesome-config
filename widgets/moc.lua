-- moc player
local wibox = require("wibox")

mocWidget = {}

function hook_moc()
    moc_info = io.popen("mocp -i"):read("*all")
    if (string.len(moc_info) == 0) then 
      return 
    end

    moc_state = string.gsub(string.match(moc_info, "State: %a*"),"State: ", "")    
    if moc_state == "PLAY" or moc_state == "PAUSE" then
        moc_artist = string.gsub(string.match(moc_info, "Artist: %C*"), "Artist: ","")
        moc_title = string.gsub(string.match(moc_info, "SongTitle: %C*"), "SongTitle: ","")	
        moc_curtime = string.gsub(string.match(moc_info, "CurrentTime: %d*:%d*"), "CurrentTime: ","")
	if string.find(moc_info, "TotalTime") == nil then
		moc_totaltime = ""		
	else
        moc_totaltime = string.gsub(string.match(moc_info, "TotalTime: %d*:%d*"), "TotalTime: ","")
	end
        moc_nome = '<span color="' .. beautiful.border_focus .. '">MOC ♫ </span>'

        if moc_artist == "" then
            moc_artist = "u/a"
        end
        if moc_title == "" then
            moc_title = "---"
        end
        moc_string = moc_nome .. moc_artist .. " - " .. moc_title .. "  (" .. moc_curtime .. "/" .. moc_totaltime .. ")"
        if moc_state == "PAUSE" then
            moc_string = " [[ " .. moc_string .. " ]]"
        end
    else
        moc_string = "" --"-- MOC not playing --"
    end
    mocWidget.widget.text = moc_string
end

function pause_moc()
    moc_info = io.popen("mocp -i"):read("*all")
    moc_state = string.gsub(string.match(moc_info, "State: %a*"),"State: ","")
    if moc_state == "PLAY" then
        awful.util.spawn("mocp -P")
    elseif moc_state == "PAUSE" then
        awful.util.spawn("mocp -U")
    end
end

function next_moc()
   awful.util.spawn("mocp -f")
end

function prev_moc()
   awful.util.spawn("mocp -r")

end

function volup_moc()
   awful.util.spawn("mocp -v+5")

end

function voldown_moc()
   awful.util.spawn("mocp -v-5")

end


-- Moc widget timer

mocWidget.timer = timer { timeout = 1 }
mocWidget.timer:connect_signal("timeout", function() hook_moc() end)
mocWidget.timer:start()

-- moc widget
mocWidget.widget = wibox.widget.textbox()
mocWidget.widget.name = "mocWidget.widget"
mocWidget.widget.align = "right" 
mocWidget.widget:buttons(awful.util.table.join(
                   awful.button({ }, 1, function () pause_moc() end), --click per pausa
                   awful.button({ }, 2, function () prev_moc() end),
                   awful.button({ }, 3, function () next_moc() end),
                   awful.button({ }, 4, function () volup_moc() end),
                   awful.button({ }, 5, function () voldown_moc() end))) 
    
-- awful.widget.layout.margins[mocWidget.widget] = { right = 9 }
