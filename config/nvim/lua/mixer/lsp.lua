local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },

  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({select = true}),
    ["<C-Space>"] = cmp.mapping.complete()
  }),

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    {name = "buffer"}
  })
})

cmp.setup.filetype({"lisp"}, {
  sources = {
    { name = "nvlime" }
        -- other sources like path or buffer, etc.
  }
})

local servers = {
  lua_ls = {},
  rust_analyzer = {},
  clangd = {},
  zls = {},
  taplo = {},
  gopls = {}
}

local serversList = {}
for k, _ in pairs(servers) do
  table.insert(serversList, k)
end

require("mason-lspconfig").setup{
  ensure_installed = serversList
}

require("neodev").setup()
local lspconfig = require("lspconfig")
local function setupServer(name, options)
  if lspconfig[name] then
    local opts = options or {}
    opts["capabilities"] = require("cmp_nvim_lsp").default_capabilities()
    lspconfig[name].setup(opts)
  end
end

for key, value in pairs(servers) do
  setupServer(key, value)
end
