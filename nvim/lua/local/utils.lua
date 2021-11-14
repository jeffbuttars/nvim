
local utils = {
  icons = {
    alpha = "",
    check_mark_outline = "﫠",
    circle_cross = "",
    circle_cross_outline = "",
    console = "",
    crescent_circle_left = "",
    crescent_circle_right = "",
    exclamation = "",
    folder = "",
    gear = "",
    greek_function = "",
    half_circle_left_filled = "",
    half_circle_right_filled = "",
    information_outline = "" ,
    light_bulb = "",
    lightning_bolt = "",
    palette = "",
    pi = '',
    plus_or_minus = "",
    pointy_cursor_right = ">",
    pointy_cursor_right_filled = "",
    right_pointy_finger = "",
    scissors = "",
    triangle_bang = "",
    triangle_bang_outline = "",
    x_marks_the_spot = "✗",
  },
 signs = {
    -- Error = "",
    -- Warning = "",
    -- Hint = "",
    -- Information = "" ,
    -- Hint = "",
  }
}

utils.signs["error"] = utils.icons.circle_cross_outline
utils.signs["warning"] = utils.icons.triangle_bang_outline
utils.signs["hint"] = utils.icons.right_pointy_finger
utils.signs["information"] = utils.icons.information_outline
utils.signs["other"] = utils.icons.check_mark_outline

return utils
