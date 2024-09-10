-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

local function open_nvim_tree()
	local args = vim.fn.argv()
	if #args > 0 then
		require("nvim-tree.api").tree.open()
	end
end

local function read_local_dap_config()
	local args = vim.fn.argv()
	if #args > 0 then
		local path = vim.fn.fnamemodify(args[1], ":p:h")
		if vim.fn.isdirectory(path) == 1 then
			local dap_config_file = path .. "/.lvim/launch.lua"
			if vim.fn.filereadable(dap_config_file) == 1 then
				dofile(dap_config_file)
			end
		end
	end
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		open_nvim_tree()
		read_local_dap_config()
	end,
})

lvim.plugins = {
	{ "rafamadriz/neon" },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{ "numToStr/Comment.nvim" },
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"mxsdev/nvim-dap-vscode-js",
			{
				"microsoft/vscode-js-debug",
				build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
				lazy = true,
			},
		},
		lazy = true,
	},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			if vim.env.VIRTUAL_ENV then
				local path = vim.env.VIRTUAL_ENV .. "/Scripts/python.exe"
				require("dap-python").setup(path)
				require("dap-python").test_runner = "pytest"
			end
		end,
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
		opts = {
			-- Your options go here
			-- name = "venv",
			-- auto_refresh = false
		},
		event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
		keys = { -- Keymap to open VenvSelector to pick a venv.
			{ "<leader>vs", "<cmd>VenvSelect<cr>" },
			-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
			{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
		},
	},
}
-- Appearance
lvim.colorscheme = "neon"
lvim.transparent_window = true

-- Config
local dap = require("dap")
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- 使用したいフォーマッタを指定
		null_ls.builtins.formatting.prettier, -- Prettier
		null_ls.builtins.formatting.black, -- Black (Python)
		null_ls.builtins.formatting.stylua, -- StyLua (Lua)
	},
})

-- Others
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({ async = false })
		vim.cmd("silent! write")
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({ async = false })
		vim.cmd("silent! write")
	end,
})

-- Keymaps
local opts = {
	noremap = true,
	silent = true,
}
vim.keymap.set("n", "<C-q>", "<C-v>", opts)
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end, opts)
vim.keymap.set("n", "<S-F5>", function()
	require("dap").terminate()
end, opts)
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end, opts)
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end, opts)
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end, opts)
-- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, opts)
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end, opts)
vim.keymap.set("n", "B", function()
	require("dap").toggle_breakpoint()
end, opts)
vim.keymap.set("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, opts)
vim.keymap.set("n", "<Leader>dt", function()
	require("dapui").toggle()
end, opts)
vim.keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end, opts)
vim.keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end, opts)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end, opts)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end, opts)
vim.keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end, opts)
vim.keymap.set("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end, opts)

-- Enable powershell as your default shell
vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag =
	"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd([[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]])

-- Set a compatible clipboard manager
vim.g.clipboard = {
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},
}
