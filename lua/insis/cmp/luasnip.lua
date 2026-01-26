local luasnip = pRequire("luasnip")
local types = pRequire("luasnip.util.types")
local cfg = pRequire("insis").config.cmp

local pathUtils = require("insis.utils.path")

if not luasnip or not types then
  return
end

-- custom snippets
pRequire("luasnip.loaders.from_lua").load({
  paths = pathUtils.join(pathUtils.getConfig(), "lua", "insis", "cmp", "snippets", "lua"),
})
pRequire("luasnip.loaders.from_vscode").lazy_load({
  paths = pathUtils.join(pathUtils.getConfig(), "lua", "insis", "cmp", "snippets", "vscode"),
})
-- https://github.com/rafamadriz/friendly-snippets/
pRequire("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.set_config({
  history = true,
  update_events = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        -- virt_text = { { "choiceNode", "Comment" } },
        virt_text = { { "<--", "Error" } },
      },
    },
  },
})

keymap({ "i", "s" }, cfg.keys.snip_jump_next, function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end)

keymap({ "i", "s" }, cfg.keys.snip_jump_prev, function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end)

keymap({ "i", "s" }, cfg.keys.snip_next_choice, function()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end)

keymap({ "i", "s" }, cfg.keys.snip_prev_choice, function()
  if luasnip.choice_active() then
    luasnip.change_choice(-1)
  end
end)

local cmp = pRequire("cmp")

local function feedkey(keys)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), "n", true)
end

keymap({ "i", "s" }, "<Tab>", function()
  if cmp and cmp.visible() then
    cmp.select_next_item()
    return
  end
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
    return
  end
  feedkey("<Tab>")
end)

keymap({ "i", "s" }, "<S-Tab>", function()
  if cmp and cmp.visible() then
    cmp.select_prev_item()
    return
  end
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
    return
  end
  feedkey("<S-Tab>")
end)

keymap({ "i", "s" }, "<Down>", function()
  if cmp and cmp.visible() then
    cmp.select_next_item()
    return
  end
  feedkey("<Down>")
end)

keymap({ "i", "s" }, "<Up>", function()
  if cmp and cmp.visible() then
    cmp.select_prev_item()
    return
  end
  feedkey("<Up>")
end)

keymap({ "i", "s" }, "<Right>", function()
  if cmp and cmp.visible() then
    cmp.select_next_item()
    return
  end
  feedkey("<Right>")
end)

keymap({ "i", "s" }, "<Left>", function()
  if cmp and cmp.visible() then
    cmp.select_prev_item()
    return
  end
  feedkey("<Left>")
end)
