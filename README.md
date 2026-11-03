# dotfiles.nvim

My personal Neovim configuration, managed with [lazy.nvim](https://github.com/folke/lazy.nvim).

Cloned to `~/.config/nvim`. Plugins are pinned by `lazy-lock.json`, and the update checker is enabled so `lazy.nvim` notifies me when plugins are outdated.

> Still a work in progress — I iterate on it as my workflow changes.

## Requirements

- **Neovim 0.11+** — required by `nvim-treesitter` (`main` branch) and modern `vim.lsp.config` usage
- **A Nerd Font** — for devicons in oil, lualine, and fzf-lua
- **ripgrep** — for fzf-lua live grep
- **Rust nightly toolchain** — `blink.cmp` builds from source (`cargo +nightly build --release`)
- **Git** — lazy.nvim clones plugins on first launch
- Optional: **tmux** — for `vim-tmux-navigator` and the lazydocker keymap (`<leader>D`)

On first launch lazy.nvim bootstraps itself, installs all plugins, and Mason auto-installs the configured LSP servers (`lua_ls`, `ts_ls`).

## Structure

```text
~/.config/nvim
├── init.lua                  # entry point: keymaps → options → lazy
├── lazy-lock.json            # pinned plugin versions
├── snippets/                 # custom LuaSnip snippets (typescript, typescriptreact)
├── spell/                    # committed spell file (custom words sync via git)
└── lua/
    ├── user/                 # personal settings
    │   ├── options.lua       # editor options & diagnostics config
    │   ├── keymaps.lua       # global keymaps (leader = <Space>)
    │   ├── functions.lua     # helpers (hover docs, organize imports)
    │   ├── lazy.lua          # lazy.nvim bootstrap & setup
    │   └── bfs/              # custom buffer/terminal switcher (WIP)
    └── plugins/
        ├── init.lua          # plugin specs
        └── configs/          # per-plugin configuration
            └── lsp/          # LSP, completion, Mason configs
```

## Editor & LSP setup

| Area | Plugins |
| --- | --- |
| Plugin manager | [lazy.nvim](https://github.com/folke/lazy.nvim) |
| Completion | [blink.cmp](https://github.com/saghen/blink.cmp) + [blink-copilot](https://github.com/fang2hou/blink-copilot) |
| Snippets | [LuaSnip](https://github.com/L3MON4D3/LuaSnip) + friendly-snippets + custom `snippets/` |
| LSP | nvim-lspconfig, [Mason](https://github.com/mason-org/mason.nvim), [lspsaga](https://github.com/nvimdev/lspsaga.nvim), nvim-navic (breadcrumbs) |
| Formatting | [conform.nvim](https://github.com/stevearc/conform.nvim) + mason-conform (format on save, auto-installs formatters) |
| Fuzzy finding | [fzf-lua](https://github.com/ibhagwan/fzf-lua) |
| File explorer | [oil.nvim](https://github.com/stevearc/oil.nvim) (edit the filesystem like a buffer) |
| Syntax | nvim-treesitter (`main` branch) + nvim-ts-autotag |
| Git | gitsigns.nvim |
| UI | kanagawa colorscheme, lualine (+ diagnostic messages), which-key, nvim-colorizer |
| Motions | leap.nvim, nvim-surround, Comment.nvim |
| Workflow | harpoon2, persistence.nvim (sessions), trouble.nvim, vim-tmux-navigator |
| Extras | qmk.nvim (ZMK `.keymap` formatting + layer previews) |

### LSP servers

- **Mason-managed**: `lua_ls`, `ts_ls`
- **Native**: `clangd` (C/C++), `sourcekit` (Swift — ships with Xcode, enabled explicitly and restricted to Swift so it doesn't clash with clangd)

### Formatters (conform, on save)

| Filetype | Formatter(s) |
| --- | --- |
| Lua | stylua |
| Python | isort → black |
| TS/JS/JSON/HTML/Markdown | prettierd → prettier |
| Swift | `swift-format` from the Swift 6.0+ toolchain (no install) |
| Go / Java | via LSP (`gopls`, `jdtls`) |
| ZMK `.keymap` | qmk.nvim |

## Keybindings

Leader is `<Space>`. Press `<leader>` and wait for which-key, or `<leader>k` to search all mappings. Highlights:

| Keys | Action |
| --- | --- |
| `<Tab>` | Find files (fzf-lua) |
| `<leader><leader>` | Resume last search |
| `<leader>t` | Live grep |
| `<leader>b` | Buffer list |
| `<leader>qf` | Quickfix list |
| `<leader>e` | Oil file explorer |
| `<S-l>` / `<S-u>` | Harpoon: add file / open quick menu |
| `<S-m>1`…`<S-m>0` | Harpoon: jump to file 1–10 |
| `gd` / `gD` / `gi` / `gf` | LSP: peek definition / goto definition / implementation / finder |
| `K` | LSP hover docs |
| `<leader>a` / `<leader>rn` | Code action / rename |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>lo` | Organize imports |
| `<leader>xx` / `<leader>cs` | Trouble: diagnostics / document symbols |
| `<leader>cl` | Trouble: LSP references & related |
| `s` / `S` / `gs` | Leap forward / backward / cross-window |
| `<C-h/j/k/l>` | Navigate splits & tmux panes seamlessly |
| `+` / `_` / `=` / `-` | Resize splits |
| `<leader>wv` / `<leader>wh` | Vertical / horizontal split |
| `<leader>D` | lazydocker in a new tmux window |
| `<leader>p` | Paste over selection without clobbering the register |
| `<leader>y` | Yank to system clipboard |
| `<esc><esc>` | Clear search highlight |
| `<leader>cab` | Close all buffers except the current one |

## Notes

- Diagnostic signs, virtual text, and the hover handler are customized in `lua/user/options.lua`; spell-checked words added with `zg` are saved to the committed `spell/en.utf-8.add` so they sync with the repo.
- `lua/user/bfs/` is a hand-rolled minimal buffer/terminal switcher — currently a WIP and not wired to any keymaps.
- The lazy.nvim setup disables a few bundled runtime plugins (`gzip`, `tarPlugin`, `tohtml`, `tutor`, `zipPlugin`) for startup performance.
