return {
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
		command = "Git",
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup() --has to be loaded before everything
		end,
	},
	{

		"mbbill/undotree",
		command = "UndotreeToggle",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
			vim.o.undofile = true
		end,
	},
}
