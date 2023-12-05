/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 2;  /* border pixel of windows */
static const unsigned int snap      = 32; /* snap pixel */
static const int showbar            = 1;  /* 0 means no bar */
static const int topbar             = 1;  /* 0 means bottom bar */
static const char *fonts[]          = {"CodeNewRoman:size=9:antialias=true:autohint=true"};
static const char dmenufont[]       = "monospace:size=10";
static const char *colors[][3]      = {
	/* fg bg border */

	[SchemeNorm] = { "#ffffff", "#000000", "#333333" },
	[SchemeSel]  = { "#f7f7f7", "#333333", "#7fa5bd" }
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
     */

	/* class instance title tags_mask isfloating monitor */

	{ "Gimp",    NULL, NULL, 0,      1, -1 },
	{ "Firefox", NULL, NULL, 1 << 8, 0, -1 },
};

/* layout(s) */
static const float mfact        = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster        = 1;    /* number of clients in master area */
static const int resizehints    = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1;    /* 1 will force focus on the fullscreen window */

static int cur_layout = 0;
static const Layout layouts[] = {
	/* symbol arrange_function */

	{ "[T]", tile    }, /* first entry is default */
	{ "[F]", NULL    }, /* no layout function means floating behavior */
	{ "[M]", monocle },
};

static void
layout_rotfwd()
{
    Arg arg = {0};

    cur_layout++;
    if (cur_layout >= LENGTH(layouts)) {
        cur_layout = 0;
    }
    arg.v = layouts + cur_layout;
    setlayout(&arg);
}

static void
layout_rotbck()
{
    Arg arg = {0};

    cur_layout--;
    if (cur_layout < 0) {
        cur_layout = LENGTH(layouts) - 1;
    }
    arg.v = layouts + cur_layout;
    setlayout(&arg);
}

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY, view,       {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY, toggleview, {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY, tag,        {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY, toggletag,  {.ui = 1 << TAG} },

/* commands */
//static const char *dmenucmd[]        = { "dmenu_run", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *dmenucmd[]        = { NULL };
static const char *termcmd[]         = { "st", NULL };
static const char *browsercmd[]      = { "brave", NULL };
static const char *backlightinccmd[] = { "backlight-control", "inc", NULL };
static const char *backlightdeccmd[] = { "backlight-control", "dec", NULL };
static const char *volmutecmd[]      = { "volume-control", "mute", NULL };
static const char *volmicmutecmd[]   = { "volume-control", "mic-mute", NULL };
static const char *volupcmd[]        = { "volume-control", "inc", NULL };
static const char *voldowncmd[]      = { "volume-control", "dec", NULL };

static const Key keys[] = {
	/* modifier key function argument */

	{ MODKEY, XK_p,      spawn, {.v = dmenucmd}   },
	{ MODKEY, XK_Return, spawn, {.v = termcmd}    },
	{ MODKEY, XK_b,      spawn, {.v = browsercmd} },

    { 0, XF86XK_MonBrightnessUp,   spawn, {.v = backlightinccmd} },
    { 0, XF86XK_MonBrightnessDown, spawn, {.v = backlightdeccmd} },

    { 0, XF86XK_AudioMute,        spawn, {.v = volmutecmd}    },
    { 0, XF86XK_AudioMicMute,     spawn, {.v = volmicmutecmd} },
    { 0, XF86XK_AudioRaiseVolume, spawn, {.v = volupcmd}   },
    { 0, XF86XK_AudioLowerVolume, spawn, {.v = voldowncmd} },

	{ MODKEY, XK_j,     focusstack, {.i = +1}    },
	{ MODKEY, XK_k,     focusstack, {.i = -1}    },
	{ MODKEY, XK_i,     incnmaster, {.i = +1}    },
	{ MODKEY, XK_d,     incnmaster, {.i = -1}    },
	{ MODKEY, XK_h,     setmfact,   {.f = -0.05} },
	{ MODKEY, XK_l,     setmfact,   {.f = +0.05} },
	{ MODKEY, XK_space, zoom,       {0}          },

	{ MODKEY,           XK_Tab, layout_rotfwd, {0} },
	{ MODKEY|ShiftMask, XK_Tab, layout_rotbck, {0} },

	{ MODKEY, XK_w, killclient,     {0} },
	{ MODKEY, XK_f, togglefloating, {0} },
	/* { MODKEY,           XK_b,      togglebar,      {0} }, */

	{ MODKEY,           XK_0, view, {.ui = ~0 } },
	{ MODKEY|ShiftMask, XK_0, tag,  {.ui = ~0 } },

	{ MODKEY,           XK_comma,  focusmon, {.i = -1 } },
	{ MODKEY,           XK_period, focusmon, {.i = +1 } },
	{ MODKEY|ShiftMask, XK_comma,  tagmon,   {.i = -1 } },
	{ MODKEY|ShiftMask, XK_period, tagmon,   {.i = +1 } },

	{ MODKEY|ControlMask, XK_q, quit, {0} },

	TAGKEYS(XK_1, 0)
	TAGKEYS(XK_2, 1)
	TAGKEYS(XK_3, 2)
	TAGKEYS(XK_4, 3)
	TAGKEYS(XK_5, 4)
	TAGKEYS(XK_6, 5)
	TAGKEYS(XK_7, 6)
	TAGKEYS(XK_8, 7)
	TAGKEYS(XK_9, 8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click_event mask button function argument */

	{ ClkLtSymbol, 0, Button1, layout_rotfwd, {0} },
	{ ClkLtSymbol, 0, Button3, layout_rotbck, {0} },

	{ ClkClientWin, MODKEY, Button1, movemouse,      {0} },
	{ ClkClientWin, MODKEY, Button2, togglefloating, {0} },
	{ ClkClientWin, MODKEY, Button3, resizemouse,    {0} },

	{ ClkTagBar, 0,      Button1, view,       {0} },
	{ ClkTagBar, 0,      Button3, toggleview, {0} },
	{ ClkTagBar, MODKEY, Button1, tag,        {0} },
	{ ClkTagBar, MODKEY, Button3, toggletag,  {0} },
};

