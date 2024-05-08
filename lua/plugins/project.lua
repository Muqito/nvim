return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("telescope").load_extension("projects")
		require("project_nvim").setup({
			manual_mode = true,
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
		})
	end,
}
