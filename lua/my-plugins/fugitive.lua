return {
	"tpope/vim-fugitive",
	config = function ()
		vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = "Git fugitive" })
		vim.keymap.set('n', '<leader>grf', "<cmd>diffget //2<CR>", { desc = "Git conflict diff left" })
		vim.keymap.set('n', '<leader>grh', "<cmd>diffget //3<CR>", { desc = "Git conflict diff right" })
	end
}
