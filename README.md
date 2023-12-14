# Icecream for [Neovim](https://github.com/neovim/neovim)

![Neovim](https://raw.githubusercontent.com/liminalminds/icecream/master/images/screenshots/neovim.png)

## Install

### [Lazy](https://github.com/folke/lazy.nvim)

```lua
require('lazy').setup({
  {
    'liminalminds/icecream.nvim',
    name = 'icecream',
    lazy = false,
    priority = 1000,
  }
})
```

### [Packer](https://github.com/wbthomason/packer.nvim)

```lua
require('packer').startup(function(use)
  use({ 'liminalminds/icecream.nvim', as = 'icecream' })
end)
```

:D
