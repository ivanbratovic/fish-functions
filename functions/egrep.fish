function egrep --wraps=grep --description "Alias for grep -E"
    /usr/bin/grep -E --color=auto $argv
end
