local finders = require "telescope.finders"
local cmd = require "branch.cmd"

local function get_git_branches(icon)
  local branches = cmd.run_list(cmd.git_cmd.get_branches)
  local results = {}

  for _, branch in ipairs(branches) do
    table.insert(results, {
      display = icon .. branch,
      value = branch,
      ordinal = branch,
    })
  end

  return results
end

return function(finder_state)
  if not finder_state.icon then
    return finders.new_table {
      results = cmd.run_list(cmd.git_cmd.get_branches),
    }
  end

  return finders.new_table {
    results = get_git_branches(finder_state.icon),
    entry_maker = function(entry)
      return {
        display = entry.display,
        value = entry.value,
        ordinal = entry.ordinal,
      }
    end,
  }
end
