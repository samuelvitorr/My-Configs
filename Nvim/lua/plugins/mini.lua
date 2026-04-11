return {
	{
		"nvim-mini/mini.surround",
		version = false,
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		{
			"nvim-mini/mini.pairs",
			version = false,
			config = function()
				require("mini.pairs").setup()
			end,
		},
	},
}
