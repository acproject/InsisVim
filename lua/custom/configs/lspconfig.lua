local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.cmake.setup {
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  root_dir = lspconfig.util.root_pattern(".git", "build", "cmake", "CMakeLists.txt", "cmake.toml"),
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
}
