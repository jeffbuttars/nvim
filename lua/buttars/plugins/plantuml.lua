return {
	-- {
	-- 	"orfosys/nvim-soil",
	-- 	lazy = true,
	-- 	ft = "plantuml",
	-- 	config = function()
    --         require'soil'.setup{
	-- 		-- If you want to change default configurations
    --         -- darkmode = false, -- Enable or disable darkmode 
    --         format = "svg", -- Choose between png or svg

    --         -- This is a default implementation of using nsxiv to open the resultant image
    --         -- Edit the string to use your preferred app to open the image
    --         -- Some examples:
    --         -- return "feh " .. img
    --         -- return "xdg-open " .. img
    --         -- execute_to_open = function(img) 
    --         --     return "nsxiv -b " .. img
    --         -- end
    --         }
	-- 	end,
	-- },

	-- Optional for puml syntax highlighting:
	{
        "aklt/plantuml-syntax",
		lazy = true,
		ft = "plantuml",
    },
}
