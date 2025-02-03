local finders = require "telescope.finders"
local cmd = require "branch.cmd"

local function get_git_branches()
  local branches = cmd.run_list(cmd.git_cmd.get_branches)
  local results = {}

  for _, branch in ipairs(branches) do
    table.insert(results, {
      display = " " .. branch,
      value = branch,
      ordinal = branch,
    })
  end

  return results
end

return finders.new_table {
  results = get_git_branches(),
  entry_maker = function(entry)
    return {
      display = entry.display,
      value = entry.value,
      ordinal = entry.ordinal,
    }
  end,
}
