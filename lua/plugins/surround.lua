-- Surround editing.
-- mini.surround adds, deletes, finds, and replaces surrounding characters
-- such as (), {}, [], quotes, backticks, and angle brackets.
return {
    {
      'echasnovski/mini.surround',
      version = '*',
      event = 'VeryLazy',
      config = function()
        require('mini.surround').setup({
          custom_surroundings = {
            ['{'] = { output = { left = '{', right = '}' } },
            ['B'] = { output = { left = '{ ', right = ' }' } },
            ['('] = { output = { left = '(', right = ')' } },
            ['P'] = { output = { left = '( ', right = ' )' } },
            ['['] = { output = { left = '[', right = ']' } },
            ['"'] = { output = { left = '"', right = '"' } },
            ["'"] = { output = { left = "'", right = "'" } },
            ['`'] = { output = { left = '`', right = '`' } },
            ['<'] = { output = { left = '<', right = '>' } },
          },
          mappings = {
            add = 'gsa',
            delete = 'gsd',
            find = 'gsf',
            find_left = 'gsF',
            highlight = 'gsh',
            replace = 'gsr',
            update_n_lines = 'gsn',
            suffix_last = '',
            suffix_next = '',
          },
          n_lines = 50,
          respect_selection_type = true,
          search_method = 'cover_or_next',
        })

        vim.keymap.set('n', '<leader>{', function()
         local count = vim.v.count1
         local keys = 'V' .. (count > 1 and (count - 1) .. 'j' or '') .. 'gsa{'
         vim.api.nvim_feedkeys(keys, 'm', false)
         vim.schedule(function()
          vim.cmd('normal! =a{')
         end)
        end, { desc = '用 {} 包裹行并缩进' })

        -- 一键包裹 {} 并缩进
        vim.keymap.set('x', '<leader>{', function()
          vim.api.nvim_feedkeys('gsa{', 'm', false)
          vim.schedule(function()
            vim.cmd('normal! =a{')
          end)
        end, { desc = '用 {} 包裹并缩进' })

        vim.keymap.set('x', '<leader>(', function()
          vim.api.nvim_feedkeys('gsa(', 'm', false)
        end, { desc = '用 () 包裹' })

        vim.keymap.set('x', '<leader>"', function()
          vim.api.nvim_feedkeys('gsa"', 'm', false)
        end, { desc = '用 "" 包裹' })
      end,
    }
}
