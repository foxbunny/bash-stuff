# Source this in your .bashrc

WORK_DIR=${WORK_DIR:=~/code}

findwds() {
    find "$WORK_DIR"/* -maxdepth 0 -type d
}

activatewd() {
    wd=$1
    cd $1
    workon $(dirname "$wd") 2>&1 > /dev/null
}

printmenu() {
    wdrs=$@
    idx=1
    for path in $wdrs
    do
        printf "%3s) %s\n" "$idx" "$(basename $path)"
        idx=$(expr $idx + 1)
    done
}

getchoice() {
    wdrs=($1)
}

activatewdr() {
    path=$1
    cd "$path"
    workon "$(basename "$path")" 2> /dev/null
    if [ -d "$path/.git" ]
    then
        git fetch 2>&1 > /dev/null
        git status
    fi
}

work() {
    kwd=$1
    results=$(findwds | grep -v "$WORK_DIR"$ | grep "$kwd")
    count=$(echo "$results" | wc -l)
    case "$count" in
        0)
            echo "No project found"
            ;;
        1)
            activatewdr "$results"
            ;;
        *)
            printmenu $results | more
            read -p "Choose a project: " choice
            if [ -z "$choice" ]
            then
                cd $WORK_DIR
                return
            fi
            wdrs=($results)
            activatewdr ${wdrs[$(expr "$choice" - 1)]}
            ;;
    esac
}
