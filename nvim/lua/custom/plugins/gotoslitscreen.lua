return {
  -- Common function to open the first definition with a given split command
  local function go_to_definition(split_cmd)
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result, ctx, config)
      if err or result == nil or vim.tbl_isempty(result) then
        return
      end
      vim.cmd(split_cmd)
      if type(result) == 'table' and result[1] then
        vim.lsp.util.jump_to_location(result[1])
      else
        vim.lsp.util.jump_to_location(result)
      end
    end)
  end

  -- Function to open the first definition in a horizontal split
  function _G.go_to_definition_split()
    go_to_definition 'split'
  end

  -- Function to open the first definition in a vertical split
  function _G.go_to_definition_vsplit()
    go_to_definition 'vsplit'
  end

  -- Key mapping for horizontal split and go to definition
  vim.api.nvim_set_keymap('n', 'gs', ':lua go_to_definition_split()<CR>', { noremap = true, silent = true })

  -- Key mapping for vertical split and go to definition
  vim.api.nvim_set_keymap('n', 'gv', ':lua go_to_definition_vsplit()<CR>', { noremap = true, silent = true })
}
