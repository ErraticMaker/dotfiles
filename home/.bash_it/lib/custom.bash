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

spot () {
    if [ $# -gt 1 -o "$1" = "h" ]
    then
        echo "Usage: spot [p|n|q|b|h]"
        echo ""
        echo "Options:"
        echo "   - Toggle play/pause"
        echo " p - Previous song"
        echo " n - Next song"
        echo " b - Toggle block/unblock song"
        echo " q - Quit"
        echo " h - Show this help"
        return 1
    elif [[ $# -eq 0 ]]; then pkill -RTMIN+2 -f "python.*blockify";
    elif [[ "$1" = "p" ]]; then pkill -RTMIN -f "python.*blockify";
    elif [[ "$1" = "n" ]]; then pkill -RTMIN+1 -f "python.*blockify";
    elif [[ "$1" = "b" ]]; then pkill -RTMIN+3 -f "python.*blockify";
    elif [[ "$1" = "q" ]]; then pkill -TERM -f "python.*blockify";
    fi
}
