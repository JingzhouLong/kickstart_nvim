return {
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst'
  version = '1.*',
  opts = {
    open_cmd = 'firefox-bin %s -P typst-preview --class typst-preview',
    dependencies_bin = { ['tinymist'] = 'tinymist' },
  }, -- lazy.nvim will implicitly calls `setup {}`
}
