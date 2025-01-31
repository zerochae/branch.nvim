local finders = require "telescope.finders"

return finders.new_table {
  results = vim.fn.systemlist "git branch --format='%(refname:short)'",
}
