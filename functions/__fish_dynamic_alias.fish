function __fish_dynamic_alias --description 'Alias, but use alternative commands, if available'
    set alias_name $argv[1]
    set arg_idx 2
    set cmd ""
    for arg in $argv[2..];
        if test "$arg" = "%";
            break
        end
        set arg_idx (math $arg_idx + 1)
        if test -n $cmd;
            continue
        end
        set bin (echo $arg | awk '{print $1}')
        if not which $bin >/dev/null;
            continue
        end
        set cmd $arg
    end
    if test -z $cmd
        echo "$alias_name: command not found"
        return 127
    end
    set arg_idx (math $arg_idx + 1)
    set common_options $argv[$arg_idx..]
    eval $cmd $common_options
end
