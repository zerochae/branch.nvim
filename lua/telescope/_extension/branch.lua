local present, telescope = pcall(require, "telescope")

if not present then
  error "requires telescope.nvim (https://github.com/nvim-telescope/telescope.nvim)"
end

local branch_picker = require "branch.picker"

return telescope.register_extension {
  exports = {
    branch = branch_picker,
  },
}
