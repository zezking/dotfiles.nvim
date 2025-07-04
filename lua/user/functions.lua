local M = {}
local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd
local uc = vim.api.nvim_create_user_command

---Highlight yanked text
au("TextYankPost", {
	group = ag("yank_highlight", {}),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
})

vim.cmd([[
  function Test()
    %SnipRun
    call feedkeys("\<esc>`.")
  endfunction

  function TestI()
    let b:caret = winsaveview()
    %SnipRun
    call winrestview(b:caret)
  endfunction
]])

-- Create a command to temporarily disable lsp. It is mainly used for leetcode.nvim
-- Run :edit or restart nvim to re-enable lsp
uc("DisableLSP", "lua require('user.functions').disable_lsp()", {})

uc("WipeReg", "lua require('user.functions').wipe_register()", {})
uc("FormatDisable", "lua require('user.functions').format_disable()", {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", "lua require('user.functions').format_enable()", {
	desc = "Re-enable autoformat-on-save",
})

function M.wipe_register()
	vim.cmd([[for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor]])
	vim.notify("Register wiped")
end

function M.format_disable()
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
	vim.notify("Autoformat disabled")
end

function M.format_enable()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
	vim.notify("Autoformat enabled")
end

function M.sniprun_enable()
	vim.cmd([[
    %SnipRun

    augroup _sniprun
     autocmd!
     autocmd TextChanged * call Test()
     autocmd TextChangedI * call TestI()
    augroup end
  ]])
	vim.notify("Enabled SnipRun")
end

function M.disable_sniprun()
	M.remove_augroup("_sniprun")
	vim.cmd([[
    SnipClose
    SnipTerminate
    ]])
	vim.notify("Disabled SnipRun")
end

function M.toggle_sniprun()
	if vim.fn.exists("#_sniprun#TextChanged") == 0 then
		M.sniprun_enable()
	else
		M.disable_sniprun()
	end
end

function M.remove_augroup(name)
	if vim.fn.exists("#" .. name) == 1 then
		vim.cmd("au! " .. name)
	end
end

-- get length of current word
function M.get_word_length()
	local word = vim.fn.expand("<cword>")
	return #word
end

function M.toggle_option(option)
	local value = not vim.api.nvim_get_option_value(option, {})
	vim.opt[option] = value
	vim.notify(option .. " set to " .. tostring(value))
end

function M.toggle_tabline()
	local value = vim.api.nvim_get_option_value("showtabline", {})

	if value == 2 then
		value = 0
	else
		value = 2
	end

	vim.opt.showtabline = value

	vim.notify("showtabline" .. " set to " .. tostring(value))
end

local diagnostics_active = true
function M.toggle_diagnostics()
	diagnostics_active = not diagnostics_active
	if diagnostics_active then
		vim.diagnostic.show()
	else
		vim.diagnostic.hide()
	end
end

function M.isempty(s)
	return s == nil or s == ""
end

function M.get_buf_option(opt)
	local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
	if not status_ok then
		return nil
	else
		return buf_option
	end
end

function M.disable_lsp(opt)
	vim.lsp.stop_client(vim.lsp.get_clients())
	vim.notify("LSP disabled")
end

function M.smart_quit()
	local bufnr = vim.api.nvim_get_current_buf()
	local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
	if modified then
		vim.ui.input({
			prompt = "You have unsaved changes. Quit anyway? (y/n) ",
		}, function(input)
			if input == "y" then
				vim.cmd("q!")
			end
		end)
	else
		-- Close neo_tree
		require("neo-tree.sources.manager").close_all()
		-- Close Tags (Vista)
		vim.cmd("Vista!")
		-- Save session
		vim.cmd("SessionSave")
		-- Quit
		vim.cmd("q!")
	end
end

function M.organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

M.show_documentation = function()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	elseif vim.fn.expand("%:t") == "Cargo.toml" then
		require("crates").show_popup()
	else
		vim.lsp.buf.hover()
	end
end

return M
