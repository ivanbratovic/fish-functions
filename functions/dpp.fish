#!/usr/bin/fish
function dpp --wraps='docker ps' --description "Docker ps, but only network status"
    if not __fish_docker_test
        return 1
    end
    docker ps --format "table {{.Names}}\t{{.Networks}}\t{{.Ports}}" $argv
end
complete -c dpp -f
