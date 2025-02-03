local cmd = require "branch.cmd"

return {
  prompt = {
    title = " Git Branches",
  },
  preview = {
    title = "  Preview",
    cmd = cmd.git_cmd.get_log,
  },
  finder = {
    icon = " ",
  },
}
