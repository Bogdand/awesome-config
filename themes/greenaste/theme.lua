-- greenaste, awesome3 theme, by BogdanD

--{{{ Main
require("awful.util")

theme = {}

home          = os.getenv("HOME")
config        = awful.util.getdir("config")
shared        = "/usr/share/awesome"
if not awful.util.file_readable(shared .. "/icons/awesome16.png") then
    shared    = "/usr/share/local/awesome"
end
sharedicons   = shared .. "/icons"
sharedthemes  = shared .. "/themes"
themes        = config .. "/themes"
themename     = "/greenaste"
if not awful.util.file_readable(themes .. themename .. "/theme.lua") then
       themes = sharedthemes
end
themedir      = themes .. themename
sharedzenburn = sharedthemes .. "/zenburn/"

wallpaper1    = themedir .. "/background.jpg"
wallpaper2    = themedir .. "/background.png"
wallpaper3    = sharedthemes .. "/zenburn/zenburn-background.png"
wallpaper4    = sharedthemes .. "/default/background.png"
wpscript      = home .. "/.wallpaper"

if awful.util.file_readable(wallpaper1) then
	theme.wallpaper_cmd = { "awsetbg " .. wallpaper1 }
elseif awful.util.file_readable(wallpaper2) then
	theme.wallpaper_cmd = { "awsetbg " .. wallpaper2 }
elseif awful.util.file_readable(wpscript) then
	theme.wallpaper_cmd = { "sh " .. wpscript }
elseif awful.util.file_readable(wallpaper3) then
	theme.wallpaper_cmd = { "awsetbg " .. wallpaper3 }
else
	theme.wallpaper_cmd = { "awsetbg " .. wallpaper4 }
end

if awful.util.file_readable(config .. "/vain/init.lua") then
    theme.useless_gap_width  = "3"
end
--}}}

theme.font          = "sans 8"

-- {{{ Colors
theme.fg_normal = "#DCDCCC"
theme.fg_focus  = "#F0DFAF"
theme.fg_urgent = "#CC9393"
theme.fg_minimize   = "#ffffff"
theme.bg_normal = "#3F3F3F"
theme.bg_focus  = "#1E2320"
theme.bg_urgent = "#3F3F3Fsharedzenburn .. "
theme.bg_minimize   = "#444444"
-- }}}

-- {{{ Borders
theme.border_width  = "2"
theme.border_normal = "#3F3636"
theme.border_focus  = "#6FAF6F"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#353F38"
theme.titlebar_bg_normal = "#496F66"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "15"
theme.menu_width  = "100"
-- }}}


-- {{{ Icons

theme.widget_battery = themedir .. "/icons/bat.png"
theme.widget_cpu = themedir .. "/icons/cpu.png"
theme.widget_memory = themedir .. "/icons/mem.png"
theme.widget_volume = themedir .. "/icons/vol.png"
theme.lang_ru = themedir .. "/icons/lang_ru.png"
theme.lang_en = themedir .. "/icons/lang_en.png"

-- {{{ Taglist
theme.taglist_squares_sel   = sharedzenburn .. "taglist/squarefz.png"
theme.taglist_squares_unsel = sharedzenburn .. "taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = sharedzenburn .. "awesome-icon.png"
theme.menu_submenu_icon      = "/usr/share/awesome/themes/default/submenu.png"
theme.tasklist_floating_icon = "/usr/share/awesome/themes/default/tasklist/floatingw.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = sharedzenburn .. "layouts/tile.png"
theme.layout_tileleft   = sharedzenburn .. "layouts/tileleft.png"
theme.layout_tilebottom = sharedzenburn .. "layouts/tilebottom.png"
theme.layout_tiletop    = sharedzenburn .. "layouts/tiletop.png"
theme.layout_fairv      = sharedzenburn .. "layouts/fairv.png"
theme.layout_fairh      = sharedzenburn .. "layouts/fairh.png"
theme.layout_spiral     = sharedzenburn .. "layouts/spiral.png"
theme.layout_dwindle    = sharedzenburn .. "layouts/dwindle.png"
theme.layout_max        = sharedzenburn .. "layouts/max.png"
theme.layout_fullscreen = sharedzenburn .. "layouts/fullscreen.png"
theme.layout_magnifier  = sharedzenburn .. "layouts/magnifier.png"
theme.layout_floating   = sharedzenburn .. "layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = sharedzenburn .. "titlebar/close_focus.png"
theme.titlebar_close_button_normal = sharedzenburn .. "titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = sharedzenburn .. "titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = sharedzenburn .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = sharedzenburn .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = sharedzenburn .. "titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = sharedzenburn .. "titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = sharedzenburn .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = sharedzenburn .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = sharedzenburn .. "titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = sharedzenburn .. "titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = sharedzenburn .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = sharedzenburn .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = sharedzenburn .. "titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = sharedzenburn .. "titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = sharedzenburn .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = sharedzenburn .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = sharedzenburn .. "titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
