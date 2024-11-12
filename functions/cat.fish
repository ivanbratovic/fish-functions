function cat --wraps='batcat' --description 'Use batcat if it is available'
    __fish_dynamic_alias cat "bat -P --theme=ansi" "batcat -P --theme=ansi" cat % $argv
end
