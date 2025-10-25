local common = require("insis.lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
  flags = common.flags,
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
}
return {
  on_setup = function(_)
    vim.lsp.config.bashls = opts
    vim.lsp.enable("bashls")
  end,
}
