# 安装过程

## 准备工作

想要使该配置正常工作，需要有 Nodejs v16 以上 及 Python3.7 以上的支持

安装所需的 Nodejs 包
prettier 用于格式化代码，eslint 用于 Nodejs 类项目的语法检查

```bash
npm install --global neovim prettier eslint
```

安装所需的 Python 包

```bash
pip3 install pynvim
```

NeoVim 所有插件下载完成后在 NeoVim 执行 `:checkhealth` 检查是否缺失需要的软件包，缺失的软件包请自行安装

## 安装 NeoVim

Debian/Ubuntu

```bash
sudo apt-get install neovim
```

RHEL/Fedora/CentOS

```bash
sudo yum install neovim
```

Arch Linux

```bash
sudo pacman -S neovim
```

## 克隆项目

```bash
mkdir -p $HOME/.config
git clone https://moieo@bitbucket.org/moieo/tneovim.git $HOME/.config/nvim
```

## 首次启动 NeoVim

```bash
nvim
```

首次启动将下载需要的插件以及语法补全所需文件，请保持网络通畅

默认情况下，所有需要的文件都从 Github 克隆/下载

## 更新/安装 LSP 环境

可以通过 Mason 来手动管理 LSP 环境，也可以打开指定语言的文件，然后执行 `:LspInstall`

# 该配置支持的开发环境

根据自己目前的需求，配置完成后可以支持以下开发

| Python | C/C++ | Nodejs   |
| ------ | ----- | -------- |
| Vue    | React | Lua      |
| Golang | Shell | Java     |
| JSON   | TOML  | MarkDown |

# 特别感谢

## UI 相关插件

[tokyonight]: https://github.com/folke/tokyonight.nvim
[nvim-web-devicons]: https://github.com/kyazdani42/nvim-web-devicons
[lualine.nvim]: https://github.com/nvim-lualine/lualine.nvim
[tabline.nvim]: https://github.com/kdheepak/tabline.nvim
[indentLine]: https://github.com/Yggdroot/indentLine

|  [tokyonight]  | [nvim-web-devicons] | [lualine.nvim] |
| :------------: | :-----------------: | :------------: |
| [tabline.nvim] |    [indentLine]     |                |

## 工具类插件

[overseer.nvim]: https://github.com/stevearc/overseer.nvim
[bufexplorer]: https://github.com/jlanzarotta/bufexplorer
[fzf-lua]: https://github.com/ibhagwan/fzf-lua
[nvim-terminal]: https://github.com/s1n7ax/nvim-terminal
[nvim-tree.lua]: https://github.com/nvim-tree/nvim-tree.lua
[vista.vim]: https://github.com/liuchengxu/vista.vim
[auto-pairs]: https://github.com/jiangmiao/auto-pairs

| [overseer.nvim] |  [bufexplorer]  |  [fzf-lua]  |
| :-------------: | :-------------: | :---------: |
| [nvim-terminal] | [nvim-tree.lua] | [vista.vim] |
|  [auto-pairs]   |

## LSP 语法补全插件

[mason.nvim]: https://github.com/williamboman/mason.nvim
[mason-lspconfig.nvim]: https://github.com/williamboman/mason-lspconfig.nvim
[nvim-lspconfig]: https://github.com/neovim/nvim-lspconfig
[nvim-cmp]: https://github.com/hrsh7th/nvim-cmp
[cmp-nvim-lsp]: https://github.com/hrsh7th/cmp-nvim-lsp
[lspkind-nvim]: https://github.com/onsails/lspkind-nvim
[cmp-buffer]: https://github.com/hrsh7th/cmp-buffer
[cmp-nvim-lua]: https://github.com/hrsh7th/cmp-nvim-lua
[cmp-path]: https://github.com/hrsh7th/cmp-path
[cmp-emoji]: https://github.com/hrsh7th/cmp-emoji
[cmp-cmdline]: https://github.com/hrsh7th/cmp-cmdline
[LuaSnip]: https://github.com/L3MON4D3/LuaSnip
[cmp_luasnip]: https://github.com/saadparwaiz1/cmp_luasnip
[friendly-snippets]: https://github.com/rafamadriz/friendly-snippets
[trouble.nvim]: https://github.com/folke/trouble.nvim
[typescript-vim]: https://github.com/leafgarland/typescript-vim
[vim-json]: https://github.com/leshill/vim-json
[python-syntax]: https://github.com/vim-python/python-syntax
[vim-vue]: https://github.com/posva/vim-vue
[kotlin-vim]: https://github.com/udalov/kotlin-vim
[nvim-navic]: https://github.com/SmiteshP/nvim-navic
[null-ls.nvim]: https://github.com/jose-elias-alvarez/null-ls.nvim
[plenary.nvim]: https://github.com/nvim-lua/plenary.nvim
[vim-fish-syntax]: https://github.com/khaveesh/vim-fish-syntax
[nvim-treesitter]: https://github.com/nvim-treesitter/nvim-treesitter

|   [mason.nvim]    | [mason-lspconfig.nvim] | [nvim-lspconfig]  |
| :---------------: | :--------------------: | :---------------: |
|    [nvim-cmp]     |     [cmp-nvim-lsp]     |  [lspkind-nvim]   |
|   [cmp-buffer]    |     [cmp-nvim-lua]     |    [cmp-path]     |
|    [cmp-emoji]    |     [cmp-cmdline]      |     [LuaSnip]     |
|   [cmp_luasnip]   |  [friendly-snippets]   |  [trouble.nvim]   |
| [typescript-vim]  |       [vim-json]       |  [python-syntax]  |
|     [vim-vue]     |      [kotlin-vim]      |   [nvim-navic]    |
|  [null-ls.nvim]   |     [plenary.nvim]     | [vim-fish-syntax] |
| [nvim-treesitter] |                        |

所有功能均为第三方开源插件，本项目只将功能组合。除以上例举外，还引用了许多其他开源项目

# 已知问题解决方案
C/C++ 使用静态分析器为 `clangd`

当你编写 C/C++ 代码时无法找到头文件

请在 `$HOME/.clangd` 文件编辑如下内容

```yaml
CompileFlags:
  Add: [
    "-I/usr/include"
  ]

Diagnostics:
  UnusedIncludes: None

InlayHints:
  BlockEnd: No
  Designators: No
  Enabled: Yes
  ParameterNames: No
  DeducedTypes: Yes
  TypeNameLimit: 20
```

以上配置仅在 `Fedora 40` 上测试过

目前本项目未实现 `compile_commands.json` 来进行 CMake 或 Makefile 项目的补全