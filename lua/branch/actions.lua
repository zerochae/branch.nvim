local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {}

M.checkout_branch = function(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  if not selection then
    print "No branch selected!"
    return
  end

  local branch = selection.value
  local cmd = "git checkout " .. branch

  -- Git checkout 실행
  local result = vim.fn.system(cmd)

  if vim.v.shell_error ~= 0 then
    print("❌ Failed to checkout branch: " .. branch)
    print(result) -- 오류 메시지 출력
  else
    print("✅ Switched to branch: " .. branch)
  end

  -- Telescope Picker 닫기
  actions.close(prompt_bufnr)
end

return M
