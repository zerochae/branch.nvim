local M = {}

local state = require "branch.state"

M.setup = function(opts)
  opts = opts or {}
  state = vim.tbl_deep_extend("force", {}, state, opts)

  vim.api.nvim_create_user_command("Branch", function()
    require "branch.picker"(state)
  end, { desc = "get git branches" })
end

return M
