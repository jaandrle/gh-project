listCards(){
    echo `gh api "projects/columns/$1/cards" -q '. as $arr |
        reduce range(0;length) as $i
            ([]; . + [ $arr[$i] | { id, note, "number": $i, "issue": (try ( .content_url | split("/") | .[-1] ) catch null) } ])'`
}
