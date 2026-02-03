local leap = require("leap")
if not leap then
	print("leap not loaded")
	return
end

vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
vim.keymap.set("n", "S", "<Plug>(leap-from-window)")

leap.opts.case_sensitive = true
