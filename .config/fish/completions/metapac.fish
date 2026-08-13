# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_metapac_global_optspecs
    string join \n hostname= config-dir= h/help V/version
end

function __fish_metapac_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_metapac_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_metapac_using_subcommand
    set -l cmd (__fish_metapac_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c metapac -n "__fish_metapac_needs_command" -l hostname -d 'specify a different hostname' -r
complete -c metapac -n "__fish_metapac_needs_command" -l config-dir -d 'specify a different config directory' -r -F
complete -c metapac -n "__fish_metapac_needs_command" -s h -l help -d 'Print help'
complete -c metapac -n "__fish_metapac_needs_command" -s V -l version -d 'Print version'
complete -c metapac -n "__fish_metapac_needs_command" -f -a "update" -d 'update packages for the given backend'
complete -c metapac -n "__fish_metapac_needs_command" -f -a "update-all" -d 'update all packages for the given backends'
complete -c metapac -n "__fish_metapac_needs_command" -f -a "clean" -d 'uninstall unmanaged packages'
complete -c metapac -n "__fish_metapac_needs_command" -f -a "sync" -d 'install missing packages from groups'
complete -c metapac -n "__fish_metapac_needs_command" -f -a "unmanaged" -d 'show explicitly installed packages not required by metapac'
complete -c metapac -n "__fish_metapac_needs_command" -f -a "backends" -d 'show the backends found by metapac'
complete -c metapac -n "__fish_metapac_needs_command" -f -a "clean-cache" -d 'clean the caches for the given backends'
complete -c metapac -n "__fish_metapac_needs_command" -f -a "refresh" -d 'refresh local package metadata for the given backends'
complete -c metapac -n "__fish_metapac_needs_command" -f -a "completions" -d 'generate shell completions'
complete -c metapac -n "__fish_metapac_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c metapac -n "__fish_metapac_using_subcommand update" -l backend -d 'the backend for the packages' -r
complete -c metapac -n "__fish_metapac_using_subcommand update" -l packages -d 'the package names' -r
complete -c metapac -n "__fish_metapac_using_subcommand update" -l no-confirm -d 'do not ask for any confirmation'
complete -c metapac -n "__fish_metapac_using_subcommand update" -s h -l help -d 'Print help'
complete -c metapac -n "__fish_metapac_using_subcommand update-all" -l backends -d 'the backends to operate on' -r
complete -c metapac -n "__fish_metapac_using_subcommand update-all" -l no-confirm -d 'do not ask for any confirmation'
complete -c metapac -n "__fish_metapac_using_subcommand update-all" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c metapac -n "__fish_metapac_using_subcommand clean" -l no-confirm -d 'do not ask for any confirmation'
complete -c metapac -n "__fish_metapac_using_subcommand clean" -s h -l help -d 'Print help'
complete -c metapac -n "__fish_metapac_using_subcommand sync" -l no-confirm -d 'do not ask for any confirmation'
complete -c metapac -n "__fish_metapac_using_subcommand sync" -s h -l help -d 'Print help'
complete -c metapac -n "__fish_metapac_using_subcommand unmanaged" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c metapac -n "__fish_metapac_using_subcommand backends" -s h -l help -d 'Print help'
complete -c metapac -n "__fish_metapac_using_subcommand clean-cache" -l backends -d 'the backends to operate on' -r
complete -c metapac -n "__fish_metapac_using_subcommand clean-cache" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c metapac -n "__fish_metapac_using_subcommand refresh" -l backends -d 'the backends to operate on' -r
complete -c metapac -n "__fish_metapac_using_subcommand refresh" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c metapac -n "__fish_metapac_using_subcommand completions" -l shell -d 'the shell to generate completions for' -r -f -a "bash\t''
elvish\t''
fish\t''
powershell\t''
zsh\t''
nushell\t''"
complete -c metapac -n "__fish_metapac_using_subcommand completions" -s h -l help -d 'Print help'
complete -c metapac -n "__fish_metapac_using_subcommand help; and not __fish_seen_subcommand_from update update-all clean sync unmanaged backends clean-cache refresh completions help" -f -a "update" -d 'update packages for the given backend'
complete -c metapac -n "__fish_metapac_using_subcommand help; and not __fish_seen_subcommand_from update update-all clean sync unmanaged backends clean-cache refresh completions help" -f -a "update-all" -d 'update all packages for the given backends'
complete -c metapac -n "__fish_metapac_using_subcommand help; and not __fish_seen_subcommand_from update update-all clean sync unmanaged backends clean-cache refresh completions help" -f -a "clean" -d 'uninstall unmanaged packages'
complete -c metapac -n "__fish_metapac_using_subcommand help; and not __fish_seen_subcommand_from update update-all clean sync unmanaged backends clean-cache refresh completions help" -f -a "sync" -d 'install missing packages from groups'
complete -c metapac -n "__fish_metapac_using_subcommand help; and not __fish_seen_subcommand_from update update-all clean sync unmanaged backends clean-cache refresh completions help" -f -a "unmanaged" -d 'show explicitly installed packages not required by metapac'
complete -c metapac -n "__fish_metapac_using_subcommand help; and not __fish_seen_subcommand_from update update-all clean sync unmanaged backends clean-cache refresh completions help" -f -a "backends" -d 'show the backends found by metapac'
complete -c metapac -n "__fish_metapac_using_subcommand help; and not __fish_seen_subcommand_from update update-all clean sync unmanaged backends clean-cache refresh completions help" -f -a "clean-cache" -d 'clean the caches for the given backends'
complete -c metapac -n "__fish_metapac_using_subcommand help; and not __fish_seen_subcommand_from update update-all clean sync unmanaged backends clean-cache refresh completions help" -f -a "refresh" -d 'refresh local package metadata for the given backends'
complete -c metapac -n "__fish_metapac_using_subcommand help; and not __fish_seen_subcommand_from update update-all clean sync unmanaged backends clean-cache refresh completions help" -f -a "completions" -d 'generate shell completions'
complete -c metapac -n "__fish_metapac_using_subcommand help; and not __fish_seen_subcommand_from update update-all clean sync unmanaged backends clean-cache refresh completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
