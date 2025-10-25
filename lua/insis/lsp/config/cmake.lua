local common = require("insis.lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
}

return {
  on_setup = function(_server)
    vim.lsp.config("cmake", {
      cmd = { "cmake-language-server" },
      filetypes = { "cmake" },
      root_dir = require("lspconfig.util").root_pattern(".git", "build", "cmake", "CMakeLists.txt", "cmake.toml"),
      single_file_support = true,
      capabilities = opts.capabilities,
      flags = opts.flags,
      on_attach = opts.on_attach,
    })
    vim.lsp.enable("cmake")
  end,
}
