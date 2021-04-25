## 安装manjaro
[toc]

## ⚙️️配置
  - 软件源及基础包
```sh
pacman-mirrors -i -c China -m rank #换镜像源，选择延迟最低的
pacman -Syyu #强制更新软件

pacman -S yay base-devel #安装aur个人软件仓库和基本开发工具
```
  - 中文输入法（🍀️rime-clover）
```sh
yay -S fcitx5 fcitx5-qt fcitx5-gtk fcitx5-qt4 fcitx5-chinese-addons fcitx5-configtool fcitx5-material-color fcitx5-rime fcitx-clover
	#fcitx5 :fcitx5引擎本体
	#fcitx5-qt fcitx5-gtk fcitx5-qt4 ：对各种图形界面的支持模块
	#fcitx5-chinese-addons ：fcitx5的中文输入法插件
	#fcitx5-configtool：fcitx5的图形配置工具
	#fcitx5-material-color ：主题美化  
        #fcitx5-rime clover clover使用yay安装，四叶草输入的自带emojo不错  
vim ~/.xprofile
|export GTK_IM_MODULE=fcitx
|export QT_IM_MODULE=fcitx
|export XMODIFIERS="@im=fcitx"
	#配置中文输入法，首先下载fcitx5,中文包，图形化配置工具，然后配置默认启动
```
  - nvim（keep it simple stupid)
```sh
yay -S nodejs noevim npm
pacman -S clang
npm config set registry https://registry.npm.taobao.org  #npm换源淘宝
nvim
:PlugInstall
:CocInstall coc-clangd coc-java coc-python
	#配置nvim的写作环境，配置文件来源myconfig
```

## Dwm+St
```bash
git clone [dwm] #克隆dwm仓库
git clone [St]  #克隆St
rm config.h && make clean install #删除配置文件并安装，第一次可以不用前面  
yay -S picom feh screenkey
        # picom窗口渲染器
        # feh 更换背景壁纸
        # screenkey 屏幕显示键位
```

## Misc  
  - xflux  (屏幕色温调节软件，GUI的有flux）  
    * xxflux -l 41.8 -g 123.4 -k 3400 5000  
  - alsamixer (声音调节）
  - xbacklight (屏幕亮度调节）
    * xbacklight = 25
  - chromium   
  
------
## 还存在的问题
1 中文在浏览器状态不能输入  (done) fcitx5的qt适配题  
2 markdown preview 不能工作 (done) 使用neoclide/coc.nvim  
