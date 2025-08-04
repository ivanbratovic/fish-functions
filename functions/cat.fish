function cat --wraps='batcat' --description 'Use batcat if available, and ls if arg is dir'
    __fish_dynamic_alias cat "bat -P --theme=ansi" "batcat -P --theme=ansi" cat % $argv
    if test $status -ne 0
        # Try to `ls` if the argument is a directory
        ls -l $argv 2>/dev/null
    end
end
