function egrep --wraps=grep --description "Alias for grep -E"
    command grep -E --color=auto $argv
end
