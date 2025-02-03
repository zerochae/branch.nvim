local previewers = require "telescope.previewers"

return function(preview_cmd)
  return previewers.new_termopen_previewer {
    get_command = function(entry)
      if not entry or not entry.value then
        return { "echo", "No branch selected" }
      end

      local branch = entry.value
      table.insert(preview_cmd, branch)

      return preview_cmd
    end,
  }
end
