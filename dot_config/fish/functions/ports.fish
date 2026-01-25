function ports -d "Show listening ports and their processes"
    set -l port $argv[1]

    if test -n "$port"
        # Show specific port
        lsof -i :$port -P -n 2>/dev/null | bat --style=plain --paging=never
    else
        # Show all listening ports
        lsof -i -P -n | rg LISTEN | bat --style=plain --paging=never
    end
end
