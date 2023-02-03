
-- ========================================
-- The damn network on the damn desktop
-- Written by electrictangent
-- ========================================

conky.config = {
    alignment = 'top_right',
    border_width = 0,
    cpu_avg_samples = 2,
    default_color = 'white',
    default_outline_color = 'white',
    default_shade_color = 'white',
    double_buffer = true,

    draw_borders = false,
    draw_graph_borders = false,
    draw_outline = false,
    draw_shades = false,
    extra_newline = false,
    font = 'Iosevka nerd Font:normal:size=11',

    gap_x = 25,
    gap_y = 200,
    minimum_width = 300,
    net_avg_samples = 2,
    no_buffers = true,

    out_to_console = false,
    out_to_ncurses = false,
    out_to_stderr = false,
    out_to_x = true,

    own_window = true,
    own_window_class = 'Conky',
    own_window_type = 'override',
    own_window_transparent = true,
    own_window_argb_visual = false,
    own_window_argb_value = 0,
    own_window_hints = 'undecorated,skip_taskbar,skip_pager,below',

    show_graph_range = false,
    show_graph_scale = false,
    stippled_borders = 0,
    update_interval = 1.0,
    uppercase = false,
    use_spacer = 'none',
    use_xft = true,
    
    -- Colors Insert: DO NOT EDIT LINE LABELED "insert" --
    --   color7: Foreground
    --   color0: Background
    --   color1: Accent
    --
    --   Color 14 and above from pywal are not recognised by Conky
    
color0="070803",
color1="11597a",
color2="709d16",
color3="b6551a",
color4="1dcb46",
color5="dfc520",
color6="32d8e1",
color7="c9d6d5",
color8="8c9595",
color9="11597a",
color10="709d16",
color11="b6551a",
color12="1dcb46",
color13="dfc520",
color14="32d8e1",
color15="c9d6d5",
color66="070803"

}

conky.text = [[
${color7} ${font Iosevka nerd Font:normal:size=14}  ${font Roboto:light:size=14} Network ${font} $hr${color}

${voffset -30}
${goto 10}${color7}Host: ${alignr 10}${exec hostname}${color}
${goto 10}${color7}Network SSID: ${alignr 10}${wireless_essid wlp0s16u3}${color}
${goto 10}${color7}Signal:${alignr 10}${wireless_link_qual_perc wlp0s16u3} %${color}

${voffset -25}
${goto 10}${color7}Internal IP: ${alignr 10}${addr wlp0s16u3}${color}
# ${goto 10}${color7}External IP: ${alignr 10}${exec curl ipinfo.io/ip}${color}

# Up Graph
${voffset -25}
${goto 10}${color5}${upspeedgraph wlp0s16u3 50,290 053D30 0E7830 -t}${color}
${voffset -28}${goto 10}${color7}${font Iosevka Nerd Font:normal:size=10}Upload Speed:${alignr 10}${upspeed wlp0s16u3}${color}

# Down Graph
${voffset -40}
${goto 10}${downspeedgraph wlp0s16u3 50,290 053D30 0E7830 -t}${color}
${voffset -28}${goto 10}${color7}${font Iosevka Nerd Font:normal:size=10}Down Speed:${alignr 10}${downspeed wlp0s16u3}${color}

# Total Up/Down
${voffset -30}
${goto 10}${stippled_hr}
${goto 10}${color7}${font Iosevka Nerd Font:normal:size=10}Total Up:${goto 80}${color2}${totalup wlp2s0} ${color}${alignr 20}${color7}Total Down:${alignr 10}${color2}${totaldown wlp0s16u3}
]]
