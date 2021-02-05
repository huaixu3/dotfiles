# 安装manjaro

## 配置
```sh
pacman-mirrors -i -c China -m rank #换镜像源，选择延迟最低的
pacman -Syyu #强制更新软件

pacman -S yay base-devel #安装aur个人软件仓库和基本开发工具

yay -S fcitx5 fcitx5-chinese-addons fcitx5-configtool 
vim ~/.xprofile
|export GTK_IM_MODULE=fcitx
|export QT_IM_MODULE=fcitx
|export XMODIFIERS="@im=fcitx"
	#配置中文输入法，首先下载fcitx5,中文包，图形化配置工具，然后配置默认启动

yay -S nodejs noevim npm
pacman -S clang
npm config set registry https://registry.npm.taobao.org  #npm换源淘宝
nvim
:PlugInstall
:CocInstall Coc-clangd
	#配置nvim的写作环境，配置文件来源myconfig

yay -S picom feh screenkey
pacman -S chromium #安装常用软件
