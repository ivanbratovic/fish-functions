#!/usr/bin/fish
function dps --wraps='docker ps' --description "Docker ps, but without ports"
    if not __fish_docker_test
        return 1
    end
    docker ps --format "table {{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}" $argv
end
complete -c dps -f
