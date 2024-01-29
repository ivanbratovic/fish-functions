function dip --description "Print IPs of Docker containers"
    if not __fish_docker_test
        return 1
    end

    set pattern $argv[1]
    if test -z $pattern
        set pattern ".*"
    end

    set docker_networks (docker network ls --format "{{.Name}}")
    set containers (docker ps --format "{{.ID}} {{.Names}}" | egrep "$pattern" | cut -d" " -f2)

    for container_name in $containers
        echo -n $container_name": "
        # Save result of docker inspect command
        set inspection (docker inspect $container_name)
        for network in $docker_networks
            # Get a given IP address for network if it exists
            set container_ip (echo $inspection | jq ".[0].NetworkSettings.Networks.\"$network\".IPAddress" | sed 's/"//g')
            if test "$container_ip" != null
                echo -n $network"("$container_ip") "
            end
        end
        echo
    end
end
complete -c dip -f
