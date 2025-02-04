local finders = require "telescope.finders"
local cmd = require "branch.cmd"

local function get_git_branches(finder_state)
  local branches = cmd.run_list(cmd.git_cmd.get_branches)
  local current_branch = cmd.run(cmd.git_cmd.current_branch)
  local results = {}

  local function trim(s)
    return s:match "^%s*(.-)%s*$"
  end

  for _, branch in ipairs(branches) do
    local is_current_branch = trim(branch) == trim(current_branch)
    print(is_current_branch, branch, current_branch)
    local icon = (is_current_branch and finder_state.current_branch_icon) or finder_state.icon

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
    results = get_git_branches(finder_state),
    entry_maker = function(entry)
      return {
        display = entry.display,
        value = entry.value,
        ordinal = entry.ordinal,
      }
    end,
  }
end
