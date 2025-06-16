return {
  'janBorowy/jirac.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'grapp-dev/nui-components.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('jirac').setup {
      email = vim.env.JIRA_USER,
      jira_domain = vim.env.JIRA_DOMAIN,
      api_key = vim.env.JIRA_API_TOKEN,
      config = {
        default_project_key = 'CBLEAP',
        keymaps = {
          ['close-window'] = {
            mode = 'n',
            key = 'q',
          },
          ['previous-tab'] = {
            mode = 'n',
            key = 'H',
          },
          ['refresh-window'] = {
            mode = 'n',
            key = '<F5>',
          },
        },
        window_width = 150,
        window_height = 50,
      },
    }
  end,
}
