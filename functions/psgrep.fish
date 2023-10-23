function psgrep -d "Finds a process by a pattern in the output of the ps command."
    if test (count $argv) -lt 1; or test (count $argv) -gt 1
        echo -e "psaux: Usage: \e[1mpsaux\e[0m \e[4mpattern\e[0m"
        return -1
    end
    set whole_outfile (mktemp || tempfile || echo "/tmp/tmp.psaux")
    set filtered_outfile (mktemp || tempfile || echo "/tmp/tmp.psaux-filtered")
    ps aux > $whole_outfile
    cat $whole_outfile | grep --color=always $argv | egrep -v "grep.*$argv" > $filtered_outfile
    if test (cat $filtered_outfile | wc -l) -gt 0
       head -n 1 $filtered_outfile
       cat $filtered_outfile
    else
        echo "No processes found."
        return 1
    end
    rm $whole_outfile $filtered_outfile
    return 0
end
