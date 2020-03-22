#!/bin/bash

set -o nounset 
set -o errexit

dir="$( cd "$(dirname "$0")" ; pwd -P )"
bkp_dir=$dir/dotfiles_bkp
files=(vimrc zshrc)

echo "Creating backup directory: $bkp_dir ."
mkdir -p $bkp_dir

for file in $files; do
    echo "Moving existing dotfiles to $bkp_dir ."
    mv ~/.$file $bkp_dir || true
    
    echo "Creating symlink to $file in home directory."
    echo $dir/$file 
    ln -sf $dir/$file ~/.$file
done

