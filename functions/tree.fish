function tree --wraps='exa --tree' --description 'Use eza/exa if it is available'
    if which eza >/dev/null; or which exa >/dev/null;
        ls --tree $argv
        return
    else if which tree >/dev/null
        set cmd (which tree)
        $cmd $argv
        return
    end
    echo "tree: command not found"
    return 127
end