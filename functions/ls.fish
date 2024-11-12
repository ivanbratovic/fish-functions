function ls --wraps=eza --wraps=exa --wraps=ls --description 'Use eza/exa if it is available'
    __fish_dynamic_alias ls eza exa ls % -h --color=auto $argv
end
