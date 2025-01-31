local branch_actions = require "branch.actions"

return function(_, map)
  map("i", "<CR>", branch_actions.checkout_branch)
  map("n", "<CR>", branch_actions.checkout_branch)

  map("i", "<C-d>", branch_actions.delete_branch)
  map("n", "<C-d>", branch_actions.delete_branch)

  map("i", "<C-n>", branch_actions.create_branch)
  map("n", "<C-n>", branch_actions.create_branch)

  return true
end
