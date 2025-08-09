function dfh --wraps=df --description "Alias for human-readable df"
    command df -Th --exclude-type tmpfs $argv
end
