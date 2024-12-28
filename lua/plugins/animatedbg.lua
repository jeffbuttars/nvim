-- time to wait before starting animation in seconds
local animation_delay = 300 -- delay in seconds
local animation_duration = 600 -- delay in seconds
local an_timer = nil
local initial_colorscheme = ""

local BackgroundACmds = vim.api.nvim_create_augroup("BackgroundAutocmds", { clear = true })

local kill_animation = function()
  if an_timer ~= nil then
    an_timer = nil
    require("animatedbg-nvim").stop_all()
    vim.cmd("colorscheme " .. initial_colorscheme)

    vim.api.nvim_clear_autocmds({ event = "CursorMoved", group = BackgroundACmds })
  end
end

return {
  {
    "alanfortlink/animatedbg.nvim",
    config = function()
      require("animatedbg-nvim").setup({
        fps = 60, -- default
      })

      vim.api.nvim_create_autocmd({ "CursorHold" }, {
        pattern = "*",
        callback = function()
          an_timer = vim.defer_fn(function()
            if an_timer ~= nil then
              vim.api.nvim_create_autocmd({ "CursorMoved" }, {
                pattern = "*",
                callback = kill_animation,
                group = BackgroundACmds,
                desc = "Stop animationbg",
              })

              local cur_win = vim.api.nvim_get_current_win()

              initial_colorscheme = vim.g.colors_name

              -- play the animation on all windows
              local windows = vim.api.nvim_tabpage_list_wins(0)
              for _, win in ipairs(windows) do
                vim.api.nvim_set_current_win(win)

                vim.cmd("colorscheme " .. vim.g.color_dark)
                require("animatedbg-nvim").play({
                  animation = "matrix",
                  duration = animation_duration,
                })
              end

              vim.api.nvim_set_current_win(cur_win)
            end
          end, animation_delay * 1000)
        end,
        group = BackgroundACmds,
        desc = "Run animationbg on hold",
      })
    end,
  },
}
