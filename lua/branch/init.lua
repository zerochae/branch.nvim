local M = {}

local config = {}

M.setup = function(opts)
  opts = opts or {}
  config = vim.tbl_deep_extend("force", {}, config, opts)

  vim.api.nvim_create_user_command("Branch", function()
    require "branch.picker"()
  end, { desc = "get git branches" })
end

return M
