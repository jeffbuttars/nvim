local get_hex = require("cokeline/utils").get_hex
local buf_delete = require("cokeline/utils").buf_delete

require("cokeline").setup({
	default_hl = {
	    focused = function(buffer)
	    return
	        buffer.is_focused
	        and get_hex('Normal', 'fg')
	        or get_hex('Comment', 'fg')
	    end,
	    -- bg = get_hex('ColorColumn', 'bg'),
	},

	sidebar = {
		filetype = "neo-tree",
		components = {
			{
				text = "     Filesystem",
				fg = get_hex("NeoTreeNormal", "fg"),
				bg = get_hex("NeoTreeNormal", "bg"),
				highlight = get_hex("NeoTreeFileName", "fg"),
				style = "bold",
			},
		},
	},

	components = {
		{
            text = "",
			fg = function(buffer)
                return (buffer.is_focused and get_hex('Normal', 'fg')) or get_hex('Normal', 'bg')
			end,
			bg = function(_)
                return get_hex('Normal', 'bg')
			end,
		},
		{
			text = function(buffer)
				return " " .. buffer.devicon.icon
			end,
			fg = function(buffer)
                return (buffer.is_focused and get_hex('Normal', 'bg')) or get_hex('Normal', 'fg')
			end,
		},
		{
			text = function(buffer)
				return buffer.filename .. "  "
			end,
			style = function(buffer)
				return buffer.is_focused and "bold" or nil
			end,
		},
		{
            text = "",
            -- text = function(buffer)
            --     vim.print("TEXT", buffer.is_hovered)
            --     if buffer.is_hovered and buffer.is_focused then
            --         return ""
            --     end
            --
            --     return ""
            -- end,
			-- delete_buffer_on_left_click = true,
            -- on_click = function(idx, clicks, buttons, modifiers, buffer)
            --     -- vim.print(buffer.delete, buffer.number)
            --     -- vim.print(buffer)
            --     buf_delete(buffer.number, nil, false)
            --     -- buffer.delete()
            -- end,
            on_click = function(_, _, _, _, buffer)
                buffer:delete()
            end,
            -- on_mouse_enter = function(cx, screen_col)
            --     vim.print("on_mouse_enter", cx, screen_col)
            --     -- cx.text = ""
            --     -- return cx
            -- end,
            -- on_mouse_leave = function(cx)
            --     cx.text = ""
            --     return cx
            -- end,
		},
		{
			text = "",
			fg = function(buffer)
                return (buffer.is_focused and get_hex('Normal', 'fg')) or get_hex('Normal', 'bg')
			end,
			bg = function(_)
                return get_hex('Normal', 'bg')
			end,
		},
	},
})
