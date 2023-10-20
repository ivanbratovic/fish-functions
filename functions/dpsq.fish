function dpsq --wraps='docker ps' --description "Display Docker container IDs"
    docker ps -q $argv
end
complete -c dpsq -f
