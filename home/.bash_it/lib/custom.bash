#!/usr/bin/env bash
#
proxy_off() {
    gsettings set org.gnome.system.proxy mode 'none'
    echo -e "System proxy disabled."
    
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset socks_proxy
    unset all_proxy
    echo -e "Proxy enviroment varibles removed."
}
