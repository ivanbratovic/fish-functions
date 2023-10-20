function fgrep --wraps=grep --description "Alias for grep -F"
    /usr/bin/grep -F --color=auto $argv
end
