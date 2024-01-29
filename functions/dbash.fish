function dbash --wraps='docker exec -it' --description "Execute bash in a running Docker container"
    if not __fish_docker_test
        return 1
    end
    if test (count $argv) -ne 1
        echo '"dbash" requires exactly 1 argument.'
        echo ""
        echo "Usage: dbash CONTAINER"
        echo ""
        echo "Run bash in a running container"
    else
        docker exec -it $argv[1] bash
    end
end
complete -c dbash -f
