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
      prompt_title = opts.prompt.title,
      preview_title = opts.preview.title,
      finder = branch_finder(opts.finder),
      previewer = branch_previewer(opts.preview),
      sorter = conf.generic_sorter(),
      attach_mappings = branch_mappings,
    })
    :find()
end
