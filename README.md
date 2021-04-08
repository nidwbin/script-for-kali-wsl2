# Kali wsl2 一键设置脚本

## 说明
本脚本仅限WSL2，请勿在其他环境中使用。
这是一个个人的Kali wsl2的一键设置脚本，稳定性和安全性未知，如介意请勿使用。
理论上本脚本可以简单替换两个sources.list并注释掉install.sh中的“sudo chmod u+s /usr/bin/ping”一行在其他Debian系系统上使用。
脚本包含内容如下：
1. 设置vim和zsh样式，zsh使用powerlevel10k主题，并将历史记录保存到~/.zsh_history中
2. 设置apt中国源，已经添加了[哈工大](https://mirrors.hit.edu.cn/)，[中科大](https://mirrors.ustc.edu.cn/)，[清华](https://mirrors.tuna.tsinghua.edu.cn/)的源，你也可以自己添加合适的源到sources-http.list和sources-https.list，请注意sources-https.list是最后生效的apt源文件
3. 安装vim, git, zsh, htop, apt-transport-https, psmisc, genie等软件
4. 安装antigen来管理zsh的插件
5. 切换默认shell为zsh
6. 安装一些启动脚本，包含获取windows的IP和wsl的IP；设置DISPLAY环境变量；设置ALL_PROXY进行代理；设置fcitx输入法的环境变量；开机进入systemd环境

#### 软件说明
vim, git, zsh是本安装脚本主要配置的软件，apt-transport-https是apt使用https源所需的软件，psmisc主要为了安装pstree用于验证是否进入systemd，genie是启动systemd所需的软件，antigen是管理zsh插件所需软件
##使用方法
1. 下载本仓库的zip文件并解压到windows任意路径（这里以C:/script/)为例
2. 进入kali-wsl环境
3. 在home目录下运行
   ```
   cp -r /mnt/c/script ~
   cd ~/script
   bash install.sh
   ```
4. 等脚本完成后退出并重新进入wsl即可
5. 如果开机脚本出现问题，你可以在用户home目录下新建文件.disable来关闭开机脚本，具体可以在windows资源管理器下新建文本文档并重命名或在wsl用户home目录下运行
   ```
   touch ~/.disable
   ```
## 已知问题
genie会在启动systemd时替换PATH为一个较为安全的PATH，这会导致systemd环境下无法查找到windows的程序，这里提供的解决方法为在脚本运行完后修改/etc/genie.ini文件，将clone_path设置为true，然后使用/etc/profile.d/init.d/enable-systemd.sh.bak替换/etc/profile.d/init.d/enable-systemd.sh。即在修改完/etc/genie.ini文件的clone_path后运行如下代码
```
cd /etc/profile.d/init.d
sudo mv enable-systemd.sh.bak enable-systemd.sh
```

Ubuntu wsl2在替换zsh后会出现bug，即不会运行/etc/profile，可以将如下代码添加到.zshrc文件尾来修复
```
source /etc/profile
```
## 鸣谢
[antigen](https://github.com/zsh-users/antigen)
[systemd-genie](https://github.com/arkane-systems/genie)
[hyuuko的配置记录](https://www.cnblogs.com/zsmumu/p/archlinux-wsl2.html)