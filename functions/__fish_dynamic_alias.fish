function __fish_dynamic_alias --description 'Try commands in order until one is found'
    set -l alias_name $argv[1]
    set -l separator_idx (contains -i "%" $argv)

    if not set -q separator_idx
        echo "$alias_name: no separator '%' found"
        return 1
    end

    # Find first available command
    for cmd_spec in $argv[2..(math $separator_idx - 1)]
        set -l cmd_parts (string split " " $cmd_spec)
        if command -q $cmd_parts[1]
            set -l common_args $argv[(math $separator_idx + 1)..]
            command $cmd_parts $common_args
            return
        end
    end

    echo "$alias_name: no commands available"
    return 127
end
