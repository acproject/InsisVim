local common = require("insis.lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(_, bufnr)
    common.keyAttach(bufnr)
    -- common.disableFormat(client)
  end,
  -- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim
  -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
return {
  on_setup = function(_server)
    vim.lsp.config("gopls", {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = require("lspconfig.util").root_pattern("go.mod", ".git", "go.work"),
      capabilities = opts.capabilities,
      flags = opts.flags,
      on_attach = opts.on_attach,
      settings = opts.settings,
    })
    vim.lsp.enable("gopls")
  end,
}
