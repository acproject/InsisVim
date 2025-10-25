local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local opts = {
  capabilities = capabilities,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
}
return {
  on_setup = function(server)
    -- server.setup(opts)
    vim.lsp.config("emmet_ls", opts)
    vim.lsp.enable("emmet_ls")
  end,
}
