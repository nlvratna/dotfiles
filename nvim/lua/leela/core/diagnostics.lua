local diag_next = function()
	local diagnostics = vim.diagnostic.get()

	-- If no diagnostics, notify and return
	if #diagnostics == 0 then
		vim.notify("No diagnostics available", vim.log.levels.WARN)
		return
	end

	-- Sort diagnostics by buffer number, then by line, then by column
	table.sort(diagnostics, function(a, b)
		if a.bufnr ~= b.bufnr then
			return a.bufnr < b.bufnr
		end
		if a.lnum ~= b.lnum then
			return a.lnum < b.lnum
		end
		return a.col < b.col
	end)

	local current_buf = vim.api.nvim_get_current_buf()
	local current_pos = vim.api.nvim_win_get_cursor(0)
	local current_line = current_pos[1] - 1 -- Convert to 0-based indexing
	local current_col = current_pos[2]

	-- Find the next diagnostic after the current cursor position
	local next_index = nil

	for idx, diag in ipairs(diagnostics) do
		-- Check if this diagnostic is after the current cursor position
		if
			diag.bufnr > current_buf
			or (diag.bufnr == current_buf and diag.lnum > current_line)
			or (diag.bufnr == current_buf and diag.lnum == current_line and diag.col > current_col)
		then
			next_index = idx
			break
		end
	end

	-- If no diagnostic found after current position, wrap to first
	if not next_index then
		next_index = 1
	end

	local next_diag = diagnostics[next_index]

	-- Switch to the buffer containing the diagnostic
	vim.api.nvim_set_current_buf(next_diag.bufnr)

	-- Jump to the diagnostic position (convert to 1-based line numbering for cursor)
	vim.api.nvim_win_set_cursor(0, { next_diag.lnum + 1, next_diag.col })

	-- Show diagnostic float
	-- mimic this using a create win function and place the diagnostic message
	vim.diagnostic.open_float()
end

local diag_prev = function()
	local diagnostics = vim.diagnostic.get()

	-- If no diagnostics, notify and return
	if #diagnostics == 0 then
		vim.notify("No diagnostics available", vim.log.levels.WARN)
		return
	end

	-- Sort diagnostics by buffer number, then by line, then by column
	table.sort(diagnostics, function(a, b)
		if a.bufnr ~= b.bufnr then
			return a.bufnr < b.bufnr
		end
		if a.lnum ~= b.lnum then
			return a.lnum < b.lnum
		end
		return a.col < b.col
	end)

	local current_buf = vim.api.nvim_get_current_buf()
	local current_pos = vim.api.nvim_win_get_cursor(0)
	local current_line = current_pos[1] - 1 -- Convert to 0-based indexing
	local current_col = current_pos[2]

	-- Find the previous diagnostic before the current cursor position
	local prev_index = nil

	-- Search backwards through the diagnostics list
	for idx = #diagnostics, 1, -1 do
		local diag = diagnostics[idx]
		-- Check if this diagnostic is before the current cursor position
		if
			diag.bufnr < current_buf
			or (diag.bufnr == current_buf and diag.lnum < current_line)
			or (diag.bufnr == current_buf and diag.lnum == current_line and diag.col < current_col)
		then
			prev_index = idx
			break
		end
	end

	-- If no diagnostic found before current position, wrap to last
	if not prev_index then
		prev_index = #diagnostics
	end

	local prev_diag = diagnostics[prev_index]

	-- Switch to the buffer containing the diagnostic
	vim.api.nvim_set_current_buf(prev_diag.bufnr)

	-- Jump to the diagnostic position (convert to 1-based line numbering for cursor)
	vim.api.nvim_win_set_cursor(0, { prev_diag.lnum + 1, prev_diag.col })

	-- Show diagnostic float
	vim.diagnostic.open_float()
end

vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	virtual_text = {
		prefix = "●",
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})
vim.keymap.set("n", "[d", function()
	diag_next()
end)
vim.keymap.set("n", "]d", function()
	diag_prev()
end)
