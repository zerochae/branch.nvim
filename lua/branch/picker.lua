local pickers = require "telescope.pickers"
local branch_finder = require "branch.finder"
local branch_previewer = require "branch.previewer"
local branch_mappings = require "branch.mappings"
local conf = require("telescope.config").values

return function(opts)
  opts = opts or {}

  return pickers
    .new(opts, {
      prompt_title = " Git Branches",
      preview_title = "  Preview",
      finder = branch_finder,
      previewer = branch_previewer,
      sorter = conf.generic_sorter(opts),
      attach_mappings = branch_mappings,
    })
    :find()
end
