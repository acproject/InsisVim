if vim.g.loaded_opencode_nvim == 1 then
  return
end
vim.g.loaded_opencode_nvim = 1

vim.g.opencode_opts = vim.g.opencode_opts or {}
vim.o.autoread = true

local ok, opencode = pcall(require, "opencode")
if not ok then
  return
end

vim.keymap.set({ "n", "x" }, "<C-a>", function()
  opencode.ask("@this: ", { submit = true })
end, { desc = "Ask opencode…" })

vim.keymap.set({ "n", "x" }, "<C-x>", function()
  opencode.select()
end, { desc = "Execute opencode action…" })

vim.keymap.set({ "n", "t" }, "<C-.>", function()
  opencode.toggle()
end, { desc = "Toggle opencode" })

vim.keymap.set({ "n", "x" }, "go", function()
  return opencode.operator("@this ")
end, { desc = "Add range to opencode", expr = true })

vim.keymap.set("n", "goo", function()
  return opencode.operator("@this ") .. "_"
end, { desc = "Add line to opencode", expr = true })

vim.keymap.set("n", "<S-C-u>", function()
  opencode.command("session.half.page.up")
end, { desc = "Scroll opencode up" })

vim.keymap.set("n", "<S-C-d>", function()
  opencode.command("session.half.page.down")
end, { desc = "Scroll opencode down" })

vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
