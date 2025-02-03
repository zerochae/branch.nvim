local cmd = require "branch.cmd"

return {
  prompt_title = " Git Branches",
  preview_title = "  Preview",
  preview_cmd = cmd.get_log,
}
