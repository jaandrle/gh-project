testNumber(){
    [[ "$2" != "" ]] && [ $2 -eq $2 ] &>/dev/null && return 0
    echo "For choosing $1 use number, not '$2'"
    echo "For help use '--help'"
    exit 1
}
