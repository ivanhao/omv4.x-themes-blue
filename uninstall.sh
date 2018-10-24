#!/bin/bash
Omv="/var/www/openmediavault"
theme="/var/www/openmediavault/css-blue/"
OS=`cat /etc/issue|awk 'NR==1{print $1}'`
Version=`cat /etc/issue|awk 'NR==1{print $2}'`
V=`cat /etc/issue|awk 'NR==1{print substr($2,1,1)}'`
DATE=$(date +%Y%m%d)
if [ ! -d "$theme" ];then
    echo "主题包未安装,不需要卸载。"
    echo "Theme not exist,not need to run."
    exit
else
    while [ true ]               
	do
	   echo -n "您的系统是：$OS $Version，主题包安装路径存在，是否进行卸载?(y/n)"
	   echo -n "Your OS：$OS $Version,you have installed theme,continue?(y/n)"
	   read x
	   case "$x" in
	     y | yes ) 
		rm -rf $Omv/css
		mv $Omv/css-blue $Omv/css
		rm -rf $Omv/images-blue
		echo "卸载完成，请刷新webui界面！"
		echo "Uninstallation complete,please refresh webui!"
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
fi
