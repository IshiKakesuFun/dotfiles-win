
local M = {}

M.copy_table = function(t)
  local copy = {}
  if type(t) == 'table' then
    for k, v in pairs(t) do
      if type(v) == 'table' then
        copy[k] = M.copy_table(v)
      else
        copy[k] = v
      end
    end
  end
  return copy
end

M.merge_table = function(left, right, copy)
  local merged_table = copy and M.copy_table(left) or left
  if type(left) == 'table' and type(right) == 'table' then
    -- merge the right table with override
    for k, v in pairs(right) do 
      if type(v) == 'table' and type(merged_table[k] or false) == 'table' then 
        merged_table[k] = M.merge_table(merged_table[k], v, copy) 
      else
        merged_table[k] = v 
      end 
    end
  end
  return merged_table 
end

M.set_keymap = function(mode, opts, keymaps)
  for _, keymap in ipairs(keymaps) do
    vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], opts)
  end
end

return M

