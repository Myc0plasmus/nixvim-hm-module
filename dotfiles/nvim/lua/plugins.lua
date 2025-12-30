function get_setup(name)
	return string.format('require("setup/%s")',name)
end

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

	-- STUFF FOR LSP
    use ({'neovim/nvim-lspconfig'--,
	-- config = get_setup('lsp')
})
    use ({'nvim-treesitter/nvim-treesitter',
		config = get_setup('treesitter'),
		run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
	})
    use ({
           "hrsh7th/nvim-cmp",
           config = get_setup('nvim-cmp'), -- may very based on config
		   requires = {
				   "hrsh7th/cmp-buffer",
				   "hrsh7th/cmp-nvim-lsp",
				   "hrsh7th/cmp-path",
				   "hrsh7th/cmp-nvim-lua",
				   "L3MON4D3/LuaSnip", -- may very based on config
				   "onsails/lspkind-nvim",
			   }
    })
	use ({
		'tzachar/cmp-tabnine',
        run = './install.sh',
        requires = 'hrsh7th/nvim-cmp'
	})
	use ({"williamboman/mason-lspconfig.nvim",
		run = ":MasonUpdate" ,
		-- config=get_setup("nvim-mason")
	})
	-- use({'ms-jpq/coq_nvim', branch = 'coq'})
	-- use({'ms-jpq/coq.artifacts', branch = 'artifacts'})
	-- use({'ms-jpq/coq.thirdparty', branch = '3p'})
	use ({
	    'nvim-telescope/telescope.nvim', tag = '0.1.0',
	    config = get_setup('t-scope'), -- or                            , branch = '0.1.x',
	    requires = { {'nvim-lua/plenary.nvim'} }
    })
	use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		--- Uncomment these if you want to manage LSP servers from neovim
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},

		-- LSP Support
		{'neovim/nvim-lspconfig'},
		-- Autocompletion
		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'L3MON4D3/LuaSnip'},
	  },
	  config = get_setup('nvim-lsp-zero'), -- or                            , branch = '0.1.x',
	}
	-- END STUF FOR LSP

    use ({
	    'kyazdani42/nvim-tree.lua',
	    requires = {
                	'kyazdani42/nvim-web-devicons', -- optional, for file icons
  	    },
  	    tag = 'nightly', -- optional, updated every week. (see issue #1193)
	    config = get_setup('tree')
    })
    -- use ({
	   --  'phaazon/hop.nvim',
	   --  branch = 'v2',
	   --  config = get_setup('hophop')
    -- })
    
    use ({
	    'numToStr/Comment.nvim',
	    config = get_setup('comment')
    })
    use ({'lewis6991/gitsigns.nvim', config = get_setup('gitsign')})
    -- use ({'m4xshen/autoclose.nvim', config = get_setup('brackets')})
    use {
  	    'nvim-lualine/lualine.nvim',
  	    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
	    config = get_setup('nvim-lualine')
    }
	use ({'shaeinst/roshnivim-cs'})
	use ({'Mofiqul/dracula.nvim', config=get_setup('nvim-dracula')}) -- fuse: user_allow_other
	use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
	use ({'mfussenegger/nvim-dap',config=get_setup('dap-main')})
	use ({'mfussenegger/nvim-dap-python', config = get_setup('dap-python')})
	use ({'theHamsta/nvim-dap-virtual-text', config=get_setup('dap-virtual-text')})
	use ({ "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}, config=get_setup('dap-ui')})	
	use 'erietz/vim-terminator'
	-- use ({ 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' })
	-- use ({'goerz/jupytext.vim',config=get_setup('jupytext')})
	use 'untitled-ai/jupyter_ascending.vim'
	use 'lambdalisue/suda.vim'
	use ({'DanielWeidinger/nvim-sshfs', config=get_setup('sshfs-plug')}) -- fuse: user_allow_other
	use 'jamestthompson3/nvim-remote-containers'
	use ({
  "folke/which-key.nvim",
  config = get_setup("whichKey")
})
	use ({"ThePrimeagen/harpoon", config = get_setup("myharpoon")})
	use ({"chentoast/marks.nvim", config = get_setup("my_mark")})
	use ({"williamboman/mason.nvim" })
	
	use 'paretje/nvim-man'

	use({"akinsho/toggleterm.nvim",tag = '*', config = get_setup("toggleTerm")})
	use 'stevearc/dressing.nvim'
	use 'rcarriga/nvim-notify'
	-- use {
 --    'jedrzejboczar/toggletasks.nvim',
 --    requires = {
 --        'akinsho/toggleterm.nvim',
 --    },
	-- config = get_setup("toggleTasks"),
 --    -- To enable YAML config support
 --    rocks = 'lyaml',
	-- }
	-- use {
 --    'stevearc/overseer.nvim',
 --    requires = {
 --        'akinsho/toggleterm.nvim',
	-- 	'stevearc/dressing.nvim',
	-- 	'rcarriga/nvim-notify'
 --    },
	-- config = get_setup("nvim-overseer"),
 --    -- To enable YAML config support
	-- }


	if packer_bootstrap then
		require('packer').sync()
	end

end)
