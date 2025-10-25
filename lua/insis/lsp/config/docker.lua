local common = require("insis.lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(_, bufnr)
    common.keyAttach(bufnr)
  end,
}
return {
  on_setup = function(_server)
    vim.lsp.config("dockerls", {
      cmd = { "docker-langserver", "--stdio" },
      filetypes = { "dockerfile" },
      root_dir = require("lspconfig.util").root_pattern("Dockerfile", ".git"),
      capabilities = opts.capabilities,
      flags = opts.flags,
      on_attach = opts.on_attach,
    })
    vim.lsp.enable("dockerls")
  end,
}
