static const char norm_fg[] = "#c2c5c7";
static const char norm_bg[] = "#0C1031";
static const char norm_border[] = "#87898b";

static const char sel_fg[] = "#c2c5c7";
static const char sel_bg[] = "#175ea1";
static const char sel_border[] = "#c2c5c7";

static const char urg_fg[] = "#c2c5c7";
static const char urg_bg[] = "#123c84";
static const char urg_border[] = "#123c84";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
