#!/bin/sh
# This script was taken from https://www.atlassian.com/git/tutorials/dotfiles
# Thank you! And it modified quite a bit.
git clone https://github.com/Soupborsh/dotfiles.git --bare "$HOME/.dotfiles"
config() {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}
config checkout
if [ $? -eq 0 ]; then
  echo "Checked out config.";
  else
  	CONFLICTS=$(config checkout 2>&1 | grep -E "\s+\." | awk '{print $1}')
  	echo "There is a conflict in these files:"
  	echo "$CONFLICTS"
  	echo "Would you like to move them into $HOME/.config-backup"
  	echo "And proceed? (y/n):"
  	read -r response
  	if [ "$response" != "y" ] && [ "$response" != "Y" ]; then
  		echo "Cancelled."
  		exit 1
  	fi
    echo "Backing up files.";
    mkdir -p "$HOME/.config-backup"
    echo "$CONFLICTS" | while read -r file; do
    	if [ -n "$file" ]; then
			mkdir -p "$HOME/.config-backup/$(dirname "$file")"
			mv "$HOME/$file" "$HOME/.config-backup/$file"
		fi
	done
	config checkout
fi;
config config status.showUntrackedFiles no
