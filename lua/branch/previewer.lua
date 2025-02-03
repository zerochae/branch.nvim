local previewers = require "telescope.previewers"

return function(preview_cmd)
  return previewers.new_termopen_previewer {
    get_command = function(entry)
      if not entry or not entry.value then
        return { "echo", "No branch selected" }
      end

      local branch = entry.value

      if type(preview_cmd) == "table" then
        local cmd = vim.deepcopy(preview_cmd)
        table.insert(cmd, branch)
        return cmd
      elseif type(preview_cmd) == "string" then
        return { "sh", "-c", preview_cmd .. " " .. branch }
      else
        return { "echo", "Invalid preview command" }
      end
    end,
  }
end
