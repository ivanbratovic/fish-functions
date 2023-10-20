function usleep
    if test (count $argv) -lt 1; or test (count $argv) -gt 1
        echo -e "Usage: \e[1musleep\e[0m \e[4mmicroseconds\e[0m"
        return
    end
    sleep (math $argv/1000000)
end
