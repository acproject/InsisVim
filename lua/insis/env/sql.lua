--- @param config InsisSQLConfig
return function(config)
  return {
    getFormatOnSavePattern = function()
      if config.format_on_save then
        return { "*.sql" }
      end
      return {}
    end,

    getTSEnsureList = function()
      return { "sql" }
    end,

    getLSPEnsureList = function()
      return { "sqls" }
    end,

    getLSPConfigMap = function()
      return {
        sqls = require("insis.lsp.config.sql"),
      }
    end,

    getToolEnsureList = function()
      return {}
    end,

    getNulllsSources = function()
      return {}
    end,

    getNeotestAdapters = function()
      return {}
    end,
  }
end
