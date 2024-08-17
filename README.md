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

[Packer](https://github.com/wbthomason/packer.nvim)

[Tokyonight](https://github.com/folke/tokyonight.nvim)

[Lua Line](https://github.com/nvim-lualine/lualine.nvim)

[Vista](https://github.com/liuchengxu/vista.vim)

所有功能均为第三方开源插件，本项目只将功能组合。除以上例举外，还引用了许多其他开源项目
