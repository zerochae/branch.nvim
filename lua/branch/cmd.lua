local M = {}

M.git_cmd = {
  checkout = "git checkout ",
  delete = "git branch -d ",
  create = "git checkout -b ",
  get_branches = "git branch --format='%(refname:short)'",
  current_branch = "git rev-parse --abbrev-ref HEAD",
  get_log = {
    "git",
    "log",
    "--color",
    "--graph",
    "--decorate",
    "--date=format:%Y-%m-%d",
    "--abbrev-commit",
    "--pretty=format:%C(yellow)%h%C(auto)%d %s %C(green)(%cr) %C(bold blue)%an",
  },
}

function M.run(cmd)
  local result = vim.fn.system(cmd)
  if vim.v.shell_error ~= 0 then
    print(" Git command failed: " .. cmd)
    print(result)
    return nil
  end
  return result
end

function M.run_list(cmd)
  return vim.fn.systemlist(cmd)
end

return M
