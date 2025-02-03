# branch.nvim

>[!NOTE]
> It hasn't been officially released yet. It's coming soon, so please wait.

A Telescope picker to quickly git branch finder in project

## 🚀 Usage

- :Branch

## 🖥️ Demo


## ✨ Features

## 📦 Installation

```lua
-- lazy.nvim
  {
    "zerochae/branch.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    cmd = "Branch",
    config = function()
      require("branch").setup {}
    end,
  }
```

## ⚙️ Configuration


```lua
 {
  prompt = {
    title = " Git Branches",
  },
  preview = {
    title = "  Preview",
    cmd = { -- string or table
      "git",
      "log",
      "--color",
      "--graph",
      "--decorate",
      "--date=format:%Y-%m-%d",
      "--abbrev-commit",
      "--pretty=format:%C(yellow)%h%C(auto)%d %s %C(green)(%cr) %C(bold blue)%an",
    },
  },
  finder = {
    icon = " ",
  },
}
```

## ⚡️ Requirements

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
