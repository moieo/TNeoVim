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
首次启动将下载需要的插件以及语法补全所需文件，请保持网络通畅

# 特别感谢
[Packer](https://github.com/wbthomason/packer.nvim)

[Tokyonight](https://github.com/folke/tokyonight.nvim)

[Lua Line](https://github.com/nvim-lualine/lualine.nvim)

[Vista](https://github.com/liuchengxu/vista.vim)

...除以上项目外，请打开 `./init.lua` 查看 `packer` 部分
