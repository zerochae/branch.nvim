local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {}

M.checkout_branch = function(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  if not selection then
    print "❌ No branch selected!"
    return
  end

  local branch = selection.value
  local cmd = "git checkout " .. branch
  local result = vim.fn.system(cmd)

  if vim.v.shell_error ~= 0 then
    print("❌ Failed to checkout branch: " .. branch)
    print(result)
  else
    print("✅ Switched to branch: " .. branch)
  end

  actions.close(prompt_bufnr) -- Picker 닫기
end

M.delete_branch = function(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  if not selection then
    print "❌ No branch selected!"
    return
  end

  local branch = selection.value

  -- 현재 체크아웃된 브랜치는 삭제 못 하도록 방지
  local current_branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]
  if branch == current_branch then
    print("🚫 Cannot delete current branch: " .. branch)
    return
  end

  local cmd = "git branch -d " .. branch
  local result = vim.fn.system(cmd)

  if vim.v.shell_error ~= 0 then
    print("❌ Failed to delete branch: " .. branch)
    print(result)
  else
    print("🗑️ Deleted branch: " .. branch)
  end

  actions.close(prompt_bufnr) -- Picker 닫기
end

M.create_branch = function(prompt_bufnr)
  actions.close(prompt_bufnr) -- Picker 닫기

  -- 사용자 입력 받기
  local new_branch = vim.fn.input "New branch name: "
  if new_branch == "" then
    print "❌ No branch name provided!"
    return
  end

  local cmd = "git checkout -b " .. new_branch
  local result = vim.fn.system(cmd)

  if vim.v.shell_error ~= 0 then
    print("❌ Failed to create branch: " .. new_branch)
    print(result)
  else
    print("🌱 Created and switched to new branch: " .. new_branch)
  end
end

return M
