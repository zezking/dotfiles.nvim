local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
	vim.notify("Auto session not found")
	return
end

-- Not using neo tree for now. Trying out oil
-- close_neo_tree and open_neo_tree and with current configs will fix Failed to rename buffer error when nvim is closed with neo tree open.
-- local function close_neo_tree()
-- 	require("neo-tree.sources.manager").close_all()
-- 	vim.notify("closed all")
-- end
--
-- local function open_neo_tree()
-- 	vim.notify("opening neotree")
-- 	require("neo-tree.sources.manager").show("filesystem")
-- end

auto_session.setup({
	suppressed_dirs = { "~", "~/Projects", "~/Downloads", "/" },
	args_allow_files_auto_save = true,
	log_level = "debug",
})
