function psgrep -d "Finds a process by a pattern in the output of the ps command."
    if test (count $argv) -lt 1; or test (count $argv) -gt 1
        echo -e "psaux: Usage: \e[1mpsaux\e[0m \e[4mpattern\e[0m"
        return -1
    end
    ps aux > /tmp/psaux.tmp
    cat /tmp/psaux.tmp | grep --color=always $argv | egrep -v "grep.*$argv" > /tmp/psaux_output.tmp
    if test (cat /tmp/psaux_output.tmp | wc -l) -gt 0
       head -n 1 /tmp/psaux.tmp
       cat /tmp/psaux_output.tmp
    else
        echo "No processes found."
        return 1
    end
    rm /tmp/psaux*.tmp
    return 0
end
