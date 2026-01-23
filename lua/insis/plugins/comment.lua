local cfg = require("insis").config.comment
local comment = pRequire("Comment")

if comment and cfg and cfg.enable then
  comment.setup({
    mappings = {
      -- disable extra keys
      extra = false,
    },

    -- Normal Mode
    toggler = {
      line = cfg.toggler.line, -- line comment
      block = cfg.toggler.block, -- block comment
    },
    -- Visual Mode
    opleader = {
      line = cfg.opleader.line,
      bock = cfg.opleader.block,
    },

  })
end
