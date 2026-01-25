function jq-preview -d "Interactive JSON explorer with fzf and jq"
    set -l file $argv[1]

    if test -z "$file"
        echo "Usage: jq-preview <json-file>"
        echo "       cat data.json | jq-preview -"
        return 1
    end

    if test "$file" = "-"
        set -l tmpfile (mktemp)
        cat >$tmpfile
        set file $tmpfile
        trap "rm -f $tmpfile" EXIT
    else if not test -f "$file"
        echo "File not found: $file"
        return 1
    end

    set -l query "."
    while true
        set -l preview_cmd "jq -C '$query' '$file' 2>&1 | head -100"
        set -l result (echo "$query" | fzf \
            --prompt="jq> " \
            --preview="jq -C '$query' '$file' 2>&1 | head -100" \
            --preview-window="right:70%:wrap" \
            --print-query \
            --query="$query" \
            --header="Enter: apply | Ctrl-C: exit | Examples: .foo | .[0] | keys | .[] | select(.id==1)")

        if test $status -ne 0
            break
        end

        set query $result[1]
    end

    # Final output
    if test "$query" != "."
        echo "Final query: $query"
        jq -C "$query" "$file"
    end
end
