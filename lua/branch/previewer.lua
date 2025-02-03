local previewers = require "telescope.previewers"

return function(preview_state)
  return previewers.new_termopen_previewer {
    get_command = function(entry)
      if not entry or not entry.value then
        return { "echo", "No branch selected" }
      end

      local branch = entry.value

      if type(preview_state.cmd) == "table" then
        local cmd = vim.deepcopy(preview_state.cmd)
        table.insert(cmd, branch)
        return cmd
      elseif type(preview_state.cmd) == "string" then
        return { "sh", "-c", preview_state.cmd .. " " .. branch }
      else
        return { "echo", "Invalid preview command" }
      end
    end,
  }
end
