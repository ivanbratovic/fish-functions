function lla --wraps=ls --description 'List contents of directory, including hidden files in directory using long format'
    ls -l -a $argv
end
