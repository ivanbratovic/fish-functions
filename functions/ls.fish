function ls --wraps=eza
    set cmd (which ls)
    if which eza >/dev/null
        set cmd (which eza)
    else if which exa >/dev/null
        set cmd (which exa)
    end
    $cmd -h --color=auto $argv
end
