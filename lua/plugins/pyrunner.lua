return{
  'rebelot/terminal.nvim',
  lazy=false,
  config = function()
  require("terminal").setup({
    layout = { open_cmd = "float", height = 0.9, width = 0.9},
    cmd = { vim.o.shell },
    autoclose = false,})
  end,
}
