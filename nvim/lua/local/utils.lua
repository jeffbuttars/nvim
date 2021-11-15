local nf_icons = require('local.nf-icons')

local utils = {
 signs = {
    error = nf_icons['mdi-close_circle_outline'], -- 
    warning = nf_icons['mdi-alert_outline'], -- 
    hint = nf_icons['mdi-lightbulb_outline'], -- 
    information = nf_icons['oct-info'], -- 
    hint = nf_icons['fa-hand_o_right'], -- 
    other = nf_icons['mdi-check_circle_outline'], -- 﫠
  },
  solarized_colors = {
    base03  =  '#002b36',
    base02  =  '#073642',
    base01  =  '#586e75',
    base00  =  '#657b83',
    base0   =  '#839496',
    base1   =  '#93a1a1',
    base2   =  '#eee8d5',
    base3   =  '#fdf6e3',
    yellow  =  '#b58900',
    orange  =  '#cb4b16',
    red     =  '#dc322f',
    magenta =  '#d33682',
    violet  =  '#6c71c4',
    blue    =  '#268bd2',
    cyan    =  '#2aa198',
    green   =  '#859900',
  }
}

return utils
