function tree --wraps='exa --tree' --description 'Use eza/exa if it is available'
    __fish_dynamic_alias tree "eza --tree" "exa --tree" tree % $argv
end