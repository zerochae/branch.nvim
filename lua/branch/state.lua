local cmd = require "branch.cmd"

return {
  prompt = {
    title = " Git Branches",
  },
  preview = {
    title = " Git Log",
    cmd = cmd.git_cmd.get_log,
  },
  finder = {
    current_branch_icon = "* ",
    icon = " ",
  },
}
