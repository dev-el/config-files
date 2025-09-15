return {
  'echasnovski/mini-git',
  version = '*',
  main = 'mini.git',
  init = function ()
    require('mini.git').setup()
  end
}
