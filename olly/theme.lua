-- theme.lua
-- Set the colorscheme with error handling
local colorscheme_ok, _ = pcall(vim.cmd, [[colorscheme catppuccin]])
if not colorscheme_ok then
  print("Warning: catppuccin theme not found. Falling back to default theme.")
  return
end

-- Configure Catppuccin theme (only if available)
local has_catppuccin, catppuccin = pcall(require, "catppuccin")
if has_catppuccin then
  local setup_ok, _ = pcall(catppuccin.setup, {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = false,
    term_colors = true,
    integrations = {
      cmp = true,
      nvimtree = true,
      telescope = true,
      treesitter = true,
      which_key = true,
    },
  })

  if not setup_ok then
    print("Error setting up catppuccin theme. Using default configuration.")
  end
end

print("Theme initialized!")

