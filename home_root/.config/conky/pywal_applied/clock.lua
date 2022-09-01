
-- ========================================
-- The damn time on the damn desktop
-- Written by lilcalcboy
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
    
color0="0d1419",
color1="5282e6",
color2="5d88e7",
color3="75aceb",
color4="89acee",
color5="c194ef",
color6="98c2f0",
color7="dcdce1",
color8="9a9a9d",
color9="5282e6",
color10="5d88e7",
color11="75aceb",
color12="89acee",
color13="c194ef",
color14="98c2f0",
color15="dcdce1",
color66="0d1419"

}

conky.text = [[
${alignr} ${font Iosevka Nerd Font:normal:size=60} ${color2} ${time %H}:${time %M}:${time %S}
${alignr}${offset 30} ${voffset -60} ${font Roboto:light:size=20} ${color7} ${time %A}, ${time %d} ${time %B} ${time %Y}
]]
