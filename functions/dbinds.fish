function dbinds --description "Print bind-mounts and/or volumes of containers"
    if not __fish_docker_test
        return 1
    end

    set pattern $argv[1]
    if test -z $pattern
        set pattern ".*"
    end

    set containers (docker ps --format "{{.ID}} {{.Names}}" | egrep "$pattern" | cut -d" " -f2)

    for container_name in $containers
        # Save result of docker inspect command
        set inspection (docker inspect $container_name)
        # Get binds if they exist
        set container_binds (echo $inspection | jq '.[0].HostConfig.Binds[]' 2>/dev/null)
        set container_mounts (echo $inspection | jq '.[0].HostConfig.Mounts[]' 2>/dev/null | jq '.Source + ":" + .Target' 2>/dev/null)
        if test (count $container_binds $container_mounts) -gt 0
            echo $container_name": "
            for full_bind in $container_binds $container_mounts
                set full_bind (echo $full_bind | tr -d '"')
                if string match -q "/*" "$full_bind"
                    set prefix BND
                else
                    set prefix VOL
                end
                echo "[$prefix] - "$full_bind
            end
        end
    end
end
complete -c dbinds -f
