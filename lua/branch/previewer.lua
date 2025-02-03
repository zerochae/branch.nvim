local previewers = require "telescope.previewers"

return previewers.new_termopen_previewer {
  get_command = function(entry)
    if not entry or not entry.value then
      return { "echo", "No branch selected" }
    end

    local branch = entry.value
    local command = {
      "git",
      "log",
      "--color",
      "--graph",
      "--decorate",
      "--date=format:%Y-%m-%d",
      "--abbrev-commit",
      "--pretty=format:%C(yellow)%h%C(auto)%d %s %C(green)(%cr) %C(bold blue)%an",
      branch,
    }

    return command
  end,
}
