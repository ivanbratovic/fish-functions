function dfh --wraps=df --description "Alias for human-readable df"
    /usr/bin/df -Th --exclude-type tmpfs $argv
end
