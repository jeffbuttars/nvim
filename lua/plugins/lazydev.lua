-- disable it
return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      integrations = {
        lspconfig = false, -- disable the problematic integration
        cmp = true,
      },
    },
  },
}
