function dsh --wraps='docker exec -it' --description "Execute sh in a running Docker container"
    if not __fish_docker_test
        return 1
    end
    if test (count $argv) -ne 1
        echo '"dsh" requires exactly 1 argument.'
        echo ""
        echo "Usage: dsh CONTAINER"
        echo ""
        echo "Run a shell in a running container"
    else
        docker exec -it $argv[1] sh
    end
end
