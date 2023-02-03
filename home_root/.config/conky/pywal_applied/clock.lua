
-- ========================================
-- The damn time on the damn desktop
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
    draw_graph_borders = true,
    draw_outline = false,
    draw_shades = false,
    extra_newline = false,
    font = 'DejaVu Sans Mono:size=12',
    gap_x = 25,
    gap_y = 60,
    minimum_height = 5,
    minimum_width = 5,
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
    --   color3: Background
    --   color2: Accent
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
${alignr} ${font Iosevka Nerd Font:normal:size=60} ${color2} ${time %H}:${time %M}:${time %S}
${alignr}${offset 30} ${voffset -60} ${font Roboto:light:size=20} ${color7} ${time %A}, ${time %d} ${time %B} ${time %Y}
]]
