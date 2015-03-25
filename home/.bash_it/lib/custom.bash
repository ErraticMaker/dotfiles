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

show() {
    local OPTIND s SCALE OPT OPTARG
    SCALE=40
    ERROR=0
    while getopts ":s:" OPT
    do
        case "${OPT}" in
            s)
                SCALE="${OPTARG}"
                ;;
            *)
                echo "Invalid option ${OPTARG}."
                ERROR=1
                ;;
        esac
    done
    shift $((OPTIND-1))

    if [ $# -eq 0 ]; then
        ERROR=1
    fi

    if [ ${ERROR} -eq 1 ]; then
        echo "Usage: show [-s <scale>] <image>"
        return 1
    fi

    w3m -o display_image=1 $1 -o image_scale=${SCALE} -o confirm_qq=0
}

lyrics() {
    if [[ $# -ne 2 ]]
    then
        echo "Usage: lyrics <song> <artist>"
        return 1
    fi

    glyrc lyrics -t "$1" -a "$2" -w 'stdout'  | sed 's/.*();//g' | less -n
}

bak() {
    if [[ $# -ne 1 ]]
    then
        echo "Creates a backup of a given file.\nUsage: bak <file>"
        return 1
    fi

    cp ${1} ${1}.bak
}
