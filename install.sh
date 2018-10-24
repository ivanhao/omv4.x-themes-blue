#!/bin/bash
Omv="/var/www/openmediavault"
theme="/var/www/openmediavault/css-blue/"
OS=`cat /etc/issue|awk 'NR==1{print $1}'`
Version=`cat /etc/issue|awk 'NR==1{print $2}'`
V=`cat /etc/issue|awk 'NR==1{print substr($2,1,1)}'`
if [ -d "$theme" ];then
    echo "您已经安装过，请不要重复安装！"
    echo "You have already installed! Now quit."
    exit
fi
if [ "$OS" != "openmediavault" ];then
    echo "您的系统不是Openmediavault，程序即将退出！"
    echo "Your OS is not Openmediavault.Now quit!"
    exit
fi
if [ "$V" != "4" ];then
  echo "您的Openmediavault版本不对，不建议安装！"
  echo "Your Openmeidavalt's version is unmatched."
  exit
fi
if [ ! -d "$Omv" ];then
	    echo "OMV路径不存在，无法安装。"
	    echo "Omv's path not exist!"
	    exit
fi
while [ true ]               
  do
     echo -n "您的系统是：$OS $Version，OMV路径存在，是否进行安装?(y/n)"
     echo -n "Your OS：$OS $Version,continue?(y/n)"
     read x
     case "$x" in
       y | yes ) 
    mv $Omv/css $Omv/css-blue
    cp -R ./css-blue $Omv/css
    cp -R ./images-blue $Omv/
    chown -R openmediavault-webgui:openmediavault-webgui $Omv/css
    chown -R openmediavault-webgui:openmediavault-webgui $Omv/images-blue
    echo "安装完成，请刷新webui界面！"
    echo "Installation Complete,please refresh your webui!"
    exit
    ;;

       n | no )
    exit
    ;;
      
       * )
         echo "请输入y/n确认是否继续！"
         echo "Please input y/n to comfirm!"
     esac
done
