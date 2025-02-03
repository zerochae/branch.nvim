local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {}

local git_cmd = {
  checkout = "git checkout ",
  delete = "git branch -d ",
  create = "git checkout -b ",
  current_branch = "git rev-parse --abbrev-ref HEAD",
}

local function close_picker(bufnr)
  actions.close(bufnr)
end

local function get_selected_branch()
  local selection = action_state.get_selected_entry()
  return selection and selection.value or nil
end

local function run_git_cmd(cmd)
  local result = vim.fn.system(cmd)
  if vim.v.shell_error ~= 0 then
    print(" Git command failed: " .. cmd)
    print(result)
    return nil
  end
  return result
end

M.checkout_branch = function(prompt_bufnr)
  local branch = get_selected_branch()
  if not branch then
    print " No branch selected!"
    return
  end

  if run_git_cmd(git_cmd.checkout .. branch) then
    print(" Switched to branch: " .. branch)
  end

  close_picker(prompt_bufnr)
end

M.delete_branch = function(prompt_bufnr)
  local branch = get_selected_branch()
  if not branch then
    print " No branch selected!"
    return
  end

  local current_branch = run_git_cmd(git_cmd.current_branch)
  if not current_branch or branch == current_branch:gsub("\n", "") then
    print(" Cannot delete current branch: " .. branch)
    return
  end

  if run_git_cmd(git_cmd.delete .. branch) then
    print("󰆴 Deleted branch: " .. branch)
  end

  close_picker(prompt_bufnr)
end

M.create_branch = function(prompt_bufnr)
  close_picker(prompt_bufnr)

  local new_branch = vim.fn.input "New branch name: "
  if new_branch == "" then
    print " No branch name provided!"
    return
  end

  if run_git_cmd(git_cmd.create .. new_branch) then
    print(" Created and switched to new branch: " .. new_branch)
  end
end

return M
