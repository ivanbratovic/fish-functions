function fgrep --wraps=grep --description "Alias for grep -F"
    command grep -F --color=auto $argv
end
