function cat --wraps='batcat' --description 'Use batcat if it is available'
    set bat_cmd (which bat; or which batcat)
    if test -n "$bat_cmd";
        $bat_cmd -P --theme=ansi $argv
        return
    end
    cat $argv
end
