function ls --wraps=eza --wraps=exa --wraps=ls --description 'Use eza/exa if it is available'
    set cmd (which ls)
    if which eza >/dev/null
        set cmd (which eza)
    else if which exa >/dev/null
        set cmd (which exa)
    end
    $cmd -h --color=auto $argv
end
