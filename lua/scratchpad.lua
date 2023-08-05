local function open_window(buf, opts)
	local ui = vim.api.nvim_list_uis()[1]
	vim.api.nvim_open_win(buf, true, {
		relative = "win",
		width = opts.width,
		height = opts.height,
		col = math.floor(ui.width / 2) - math.floor(opts.width / 2),
		row = math.floor(ui.height / 2) - math.floor(opts.height / 2),
		anchor = "NW",
		style = "minimal",
		border = "single",
	})
end

local M = {}

M.setup = function(opts)
	M.opts = {}
	if opts ~= nil then
		M.opts.height = opts.height or 50
		M.opts.width = opts.width or 100
	else
		M.opts.height = 50
		M.opts.width = 100
	end

	M.pad = nil
	M.visible = false
	M.win = nil
end

M.open = function()
	if M.pad ~= nil then
		open_window(M.pad, M.opts)
		M.win = vim.api.nvim_get_current_win()
	else
		M.pad = vim.api.nvim_create_buf(false, true)
		open_window(M.pad, M.opts)
		M.win = vim.api.nvim_get_current_win()
	end
	M.visible = true
end

M.close = function()
	vim.api.nvim_win_hide(M.win)
	M.visible = false
end

M.toggle = function()
	if M.visible then
		M.close()
	else
		M.open()
	end
end


return M
