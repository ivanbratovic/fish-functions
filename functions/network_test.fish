function network_test
    if ping -c 1 google.com >/dev/null >&1
        echo "Network a-okay."
    else
        echo "Network error."
    end
end
