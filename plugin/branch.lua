vim.api.nvim_create_user_command("Branch", function()
  require "branch.picker"()
end, { desc = "get git branches" })
