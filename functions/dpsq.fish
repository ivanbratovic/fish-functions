function dpsq --wraps='docker ps' --description "Display Docker container IDs"
    if not __fish_docker_test
        return 1
    end
    docker ps -q $argv
end
complete -c dpsq -f
