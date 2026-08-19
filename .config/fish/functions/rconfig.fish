function rconfig --wraps='/usr/bin/sudo /usr/bin/git --git-dir=$HOME/.rdotfiles/ --work-tree=/' --description 'alias config=/usr/bin/sudo /usr/bin/git --git-dir=$HOME/.rdotfiles/ --work-tree=/'
    /usr/bin/sudo -E /usr/bin/git --git-dir=$HOME/.rdotfiles/ --work-tree=/ $argv
end
