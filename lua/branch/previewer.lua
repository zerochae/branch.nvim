local previewers = require "telescope.previewers"

return previewers.new_termopen_previewer {
  get_command = function(entry)
    if not entry or not entry.value then
      return { "echo", "No branch selected" }
    end

    return { "git", "log", "--oneline", "--graph", entry.value }
  end,
}
