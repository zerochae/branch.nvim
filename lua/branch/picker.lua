local pickers = require "telescope.pickers"
local branch_finder = require "branch.finder"
local branch_previewer = require "branch.previewer"
local branch_mappings = require "branch.mappings"
local conf = require("telescope.config").values

return function(state)
  return pickers
    .new({}, {
      prompt_title = state.prompt.title,
      finder = branch_finder(state.finder),
      previewer = branch_previewer(state.preview),
      sorter = conf.generic_sorter(),
      attach_mappings = branch_mappings,
    })
    :find()
end
