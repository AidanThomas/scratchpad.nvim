# Introduction
A small plugin written in Lua to provide a scratchpad to jot notes or anything else.

# Installation
Install using your package manager of choice

Using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
    "AidanThomas/scratchpad.nvim",
    config = function()
        require("scratchpad").setup()
    end,
}
```

# Configuration
Default configuration looks like:
```lua
require("scratchpad").setup({
    height = 50,
    width = 100,
})
```

# Usage
Three functions are available:

Open the scratchpad window
```lua
require("scratchpad").open()
```

Close the scratchpad window
```lua
require("scratchpad").close()
```

Toggle the scratchpad window
```lua
require("scratchpad").toggle()
```
