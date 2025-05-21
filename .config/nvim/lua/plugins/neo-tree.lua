return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>")
		require("neo-tree").setup({
			window = {
				mappings = {
					["P"] = {
						"toggle_preview",
						config = {
							use_float = true,
						  use_image_nvim = true,
							-- title = 'Neo-tree Preview',
						},
					},
				},
			},
			filesystem = {
				window = {
					mappings = {
						["<leader>p"] = "image_wezterm", -- " or another map
					},
				},
				commands = {
					image_wezterm = function(state)
						local node = state.tree:get_node()
						if node.type == "file" then
							require("image_preview").PreviewImage(node.path)
						end
					end,
				},
			},
		})
	end,
}
