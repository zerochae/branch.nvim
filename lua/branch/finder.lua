local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "branch.actions"
local previewer = require "branch.previewer" -- 추가

local function branch_finder(opts)
  opts = opts or {}

  local branches = vim.fn.systemlist "git branch --format='%(refname:short)'"

  pickers
    .new(opts, {
      prompt_title = "Git Branches",
      finder = finders.new_table {
        results = branches,
      },
      sorter = conf.generic_sorter(opts),
      previewer = previewer.branch_previewer, -- 🔥 여기 추가
      attach_mappings = function(_, map)
        map("i", "<CR>", actions.checkout_branch)
        map("n", "<CR>", actions.checkout_branch)
        return true
      end,
    })
    :find()
end

return branch_finder
