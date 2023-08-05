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
    height = 0.65, -- Expressed as a fraction of UI height
    width = 0.7, -- Expressed as a fraction of UI width
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
