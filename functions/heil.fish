function heil --description "Prints both head and tail of file"
    if test (count $argv) -lt 2; or test (count $argv) -gt 2
        echo -e "Usage: \e[1mheil\e[0m \e[4mtop\e[0m \e[4mbottom\e[0m"
        return
    end
    cat > /tmp/heil.tmp  # not thread safe

    if test (math $argv[1] + $argv[2]) -ge (wc -l /tmp/heil.tmp | cut -d" " -f 1);
        cat /tmp/heil.tmp
    else
        head -n $argv[1] /tmp/heil.tmp
        tail -n $argv[2] /tmp/heil.tmp
    end

    rm /tmp/heil.tmp
end
