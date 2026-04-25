function run
    command $argv >/dev/null 2>&1 &
    disown
end
