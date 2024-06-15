return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-jest",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local neotest = require("neotest").setup({
			icons = {
				passed = "✓",
				running = "●",
				failed = "✗",
			},
			output = {
				enabled = true,
				open_on_run = "enter",
			},
			output_panel = {
				enabled = true,
				open = "botright split | resize 30",
			},
			adapters = {
				require("neotest-jest")({
					env = { TZ = "UTC" },
					jestConfigFile = function()
						local file = vim.fn.expand("%:p")
						if string.find(file, "/packages/") then
							return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
						end

						if string.find(file, "/libs/") then
							return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
						end
						return vim.fn.getcwd() .. "/jest.config.ts"
					end,
					jestCommand = "yarn jest --runTestsByPath",
				}),
			},
		})
	end,
	keys = {
		{
			"<leader>tt",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run File",
		},
		{
			"<leader>tT",
			function()
				require("neotest").run.run(vim.loop.cwd())
			end,
			desc = "Run All Test Files",
		},
		{
			"<leader>tr",
			function()
				require("neotest").run.run()
			end,
			desc = "Run Nearest",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Toggle Summary",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true, auto_close = true })
			end,
			desc = "Show Output",
		},
		{
			"<leader>tO",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "Toggle Output Panel",
		},
		{
			"<leader>tS",
			function()
				require("neotest").run.stop()
			end,
			desc = "Stop",
		},
	},
}
