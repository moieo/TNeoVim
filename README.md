# 文件结构

```
├── README.MD # 当前的文档
├── init.lua # 入口文件，Packer 安装插件在此文件配置
├── lua
│   ├── initialization.lua # NeoVim 的基础配置，基本热键，
│   ├── lsp
│   │   ├── cmp.lua # cmp 语法提示框的配置
│   │   ├── handlers.lua # NeoVim 的顶部栏
│   │   ├── init.lua # LSP 入口配置，添加语法检查可编辑此文件
│   │   └── keybindings.lua # LSP 的热键
│   ├── lualine-config.lua # lualine插件，底部状态栏配置文件
│   ├── navic-config.lua # Navic插件的配置文件
│   ├── null-ls-config.lua # null-ls插件，语法格式化插件配置文件
│   ├── nvimtree-config.lua # NeoVim 自带文件树配置文件
│   └── tabline-config.lua # 标签栏配置文件
└── plugin
    └── packer_compiled.lua # Packer 插件管理工具
```

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

可以在完成 NeoVim 安装 及 Packer 所有插件下载完之后在 NeoVim 执行 `:checkhealth` 检查是否缺失需要的软件包，缺失的软件包请自行安装

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

## 安装 Packer

```bash
mkdir -p $HOME/.local/share/nvim/site/pack/packer/start
git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## 克隆项目

```bash
mkdir -p $HOME/.config
git clone https://gitee.com/moieo/neo-vim-configure $HOME/.config/nvim
```

## 首次启动 NeoVim

```bash
nvim :PackerInstall
```

如果左侧没有正在执行的下载任务，且有红色报错，请按`q`键关闭报错，并手动在 NeoVim 中执行`:PackerInstall`

首次启动将下载需要的插件以及语法补全所需文件，请保持网络通畅

默认情况下，所有需要的文件都从 Github 克隆/下载

## 更新/安装 LSP 环境
可以通过 Mason 来手动管理 LSP 环境，也可以打开指定语言的文件，然后执行 `:LspInstall`

# 该配置支持的开发环境
根据自己目前的需求，配置完成后可以支持以下开发
> Python

> C/C++

> Nodejs

> Vue

> React

> Lua

> Golang

> Shell

> Java

> JSON

> TOML

> MarkDown

# 特别感谢

[Packer](https://github.com/wbthomason/packer.nvim)

[Tokyonight](https://github.com/folke/tokyonight.nvim)

[Lua Line](https://github.com/nvim-lualine/lualine.nvim)

[Vista](https://github.com/liuchengxu/vista.vim)

...除以上项目外，请打开 `./init.lua` 查看 `packer` 部分
