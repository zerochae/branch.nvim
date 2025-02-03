local pickers = require "telescope.pickers"
local branch_finder = require "branch.finder"
local branch_previewer = require "branch.previewer"
local branch_mappings = require "branch.mappings"
local conf = require("telescope.config").values
local state = require "branch.state"

return function(opts)
  opts = opts or state

  return pickers
    .new(opts, {
      prompt_title = opts.prompt_title,
      preview_title = opts.preview_title,
      finder = branch_finder,
      previewer = branch_previewer,
      sorter = conf.generic_sorter(opts),
      attach_mappings = branch_mappings,
    })
    :find()
end
