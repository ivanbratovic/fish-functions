#!/usr/bin/fish
function dps --wraps='docker ps' --description "Docker ps, but without ports"
    docker ps --format "table {{.Names}}\t{{.Image}}\t{{.RunningFor}}\t{{.Status}}" $argv
end
complete -c dps -f
