-- Functions for easy paste of copied images into resources folder
local function get_last_file_number(dir_path)
  local n = -1
  local handle, err = vim.uv.fs_scandir(dir_path)
  if not handle then
    vim.notify('Scanning error: ' .. err, vim.log.levels.ERROR)
    return nil
  end

  while true do
    local name, type = vim.uv.fs_scandir_next(handle)
    if not name then
      break
    end

    if type == 'file' then
      local tmp = tonumber(name:match '%d+')
      if tmp == nil then
        tmp = 0
      end
      if tmp > n then
        n = tmp
      end
    end
  end

  return n
end

local function paste_image(opt)
  local name = opt.args
  local path = vim.fn.expand '%:p:h'
  path = path .. '/resources/'
  local number = get_last_file_number(path)
  local command = 'wl-paste > ' .. path .. number + 1 .. '-' .. name .. '.png'
  vim.fn.jobstart(command)
end

vim.api.nvim_create_user_command('PasteImage', paste_image, { nargs = '?' })
