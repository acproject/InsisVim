--- @param config InsisClangdConfig
return function(config)
  return {
    getFormatOnSavePattern = function()
      if config.format_on_save then
        return { "*.c", "*.cpp", "*.cc", "*.cmake", "CMakeLists.txt" }
      end
      return {}
    end,

    getTSEnsureList = function()
      return { "cpp", "c" }
    end,

    getLSPEnsureList = function()
      return { "clangd", "cmake" }
    end,

    getLSPConfigMap = function()
      return {
        clangd = require("insis.lsp.config.clangd"),
        cmake = require("insis.lsp.config.cmake"),
      }
    end,

    getToolEnsureList = function()
      if config.formatter == "clang-format" then
        return { "clang-format", "cmakelang" }
      end
      return {}
    end,

    getNulllsSources = function()
      local null_ls = pRequire("null-ls")
      if not null_ls then
        return {}
      end
      if config.formatter == "clang-format" then
        return {
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.cmake_format,
        }
      end
      return {}
    end,

    getNeotestAdapters = function()
      return {}
    end,
  }
end
