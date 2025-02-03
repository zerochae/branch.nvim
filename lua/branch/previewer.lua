local previewers = require "telescope.previewers"

return function(preview_cmd)
  return previewers.new_termopen_previewer {
    get_command = function(entry)
      if not entry or not entry.value then
        return { "echo", "No branch selected" }
      end

      local branch = entry.value
      local command = preview_cmd .. branch

      return command
    end,
  }
end
