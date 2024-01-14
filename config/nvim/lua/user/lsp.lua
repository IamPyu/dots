local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({select = true}),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" }
  }, {
    { name = "buffer" }
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

local lspconfig = require("lspconfig")
require("mason").setup()
require("neodev").setup()

local servers = {
  lua_ls = {},
  rust_analyzer = {},
  clangd = {},
  cmake = {},
  clojure_lsp = {},
  hls = {},
  luau_lsp = {},
  bashls = {},
  zls = {},
  eslint = {},
  omnisharp = {}
}

local mservers = {}
for k, _ in pairs(servers) do
  table.insert(mservers, k)
end

require("mason-lspconfig").setup{
  ensure_installed = mservers,
}

local function SetupLSP(name, options)
  if lspconfig[name] then
    local opts = options or {}
    opts["capabilities"] = require("cmp_nvim_lsp").default_capabilities()
    lspconfig[name].setup(opts)
  end
end

for key, value in pairs(servers) do
  SetupLSP(key, value)
end
