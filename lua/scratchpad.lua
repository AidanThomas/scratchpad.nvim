local function open_window(buf, opts)
	local ui = vim.api.nvim_list_uis()[1]
	local height = opts.height * ui.height
	local width = opts.width * ui.width
	vim.api.nvim_open_win(buf, true, {
		relative = "win",
		width = math.floor(width),
		height = math.floor(height),
		col = math.floor(ui.width / 2) - math.floor(width / 2),
		row = math.floor(ui.height / 2) - math.floor(height / 2),
		anchor = "NW",
		style = "minimal",
		border = "rounded",
		title = "Scratchpad",
		title_pos = "center",
	})
end

local M = {}

M.setup = function(opts)
	M.opts = {}
	if opts ~= nil then
		M.opts.height = opts.height or 0.65
		M.opts.width = opts.width or 0.7
	else
		M.opts.height = 0.65
		M.opts.width = 0.7
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
