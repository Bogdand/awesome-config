-- {{{ Tags
--if screen.count() == 1 then
	tags = {
		settings = {
			{ names  = { "main", "www", "skype", "mail", "☭", "⌥", "✇", "☼", "⌘"},
			layout = { layouts[3], layouts[3], layouts[6], layouts[3], layouts[3], layouts[3], layouts[3], layouts[3], layouts[3]}
		}
	}}
--[[else
	tags = {
		settings = {
			{ 
			names  = { "main", "IDE", "skype", "mail", "qqq"},
			layout = { layouts[1], layouts[1], layouts[1], layouts[1]}
		},
		{
			names  = { "www", "im", "☭", "⌥", "✇"},
			layout = { layouts[1], layouts[1], layouts[1], layouts[1], layouts[1]}
		}
	}}
end
--]]
for s = 1, screen.count() do
     tags[s] = awful.tag(tags.settings[1].names, s, tags.settings[1].layout)
end
-- }}}

