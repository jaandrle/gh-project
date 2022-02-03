printColumn(){
    [[ -t 1 ]]\
        && echo -e "$1\nNUM\tISSUE\tTITLE/NOTE"
    length=`echo "$2" | jq -r ". | length"`
    declare -i i=0
    while [[ $i < $length ]]; do
        number=`echo "$2" | jq -r ".[$i].number"`
        issue=`echo "$2" | jq -r ".[$i].issue"`
        [[ "$issue" = "null" ]] \
            && note=`echo "$2" | jq -r ".[$i].note"' | split("\r\n") |  join("\t")'` \
            || note=`gh issue view $issue --json title -q '.title'`
        echo -e "$number\t$issue\t$note"
        i=$(( i + 1 ))
    done
}
