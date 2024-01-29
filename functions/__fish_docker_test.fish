function __fish_docker_test
    if not which docker >/dev/null; or not docker 2>/dev/null 1>&2 # Case #2 For WSL
        echo "Docker command not found"
        return 1
    end
end
