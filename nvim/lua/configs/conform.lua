local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    ocaml = { "ocamlformat" },
    js = { "prettier" },
    ts = { "prettier" },
    go = { "goimports", "gofmt" },
    nix = {"alejandra"}
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
