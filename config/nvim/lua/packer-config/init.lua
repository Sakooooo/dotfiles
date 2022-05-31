return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    use {'srcery-colors/srcery-vim', as = 'srcery'}
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use {'neoclide/coc.nvim', branch = 'release'}
end)
