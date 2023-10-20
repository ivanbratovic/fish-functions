function msleep
    if test (count $argv) -lt 1; or test (count $argv) -gt 1
        echo -e "Usage: \e[1mmsleep\e[0m \e[4mmiliseconds\e[0m"
        return
    end
    sleep (math $argv/1000)
end
