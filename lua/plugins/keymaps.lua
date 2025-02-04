return {
	"telescope.nvim",
	config = function()
		local builtin = require("telescope.builtin")
		-- the ThePrimeagen suggestions
		-- when navigating also center
		vim.keymap.set("n", "<C-d>", "<C-d>zz")
		vim.keymap.set("n", "<C-u>", "<C-u>zz")
		vim.keymap.set("n", "n", "nzzzv")
		vim.keymap.set("n", "N", "Nzzzv")

		vim.keymap.set("x", "<leader>p", '"_dP')
		vim.keymap.set("n", "<leader>js", ":w !node<CR>", { desc = "[r]un [c]ode" })

		-- find files
		-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
		-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
		-- vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "Grep string" })
		-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
		-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
		-- vim.keymap.set('n', '<leader>fv', builtin.git_files, { desc = "Find git files" })
		-- vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "Find references" })
		vim.keymap.set("n", "<leader>fp", function()
			require("telescope").extensions.projects.projects({})
		end, { desc = "Change projects" })
	end,
}
