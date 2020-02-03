#!/bin/bash


if [ "$#" -ge 1 ]; then

  slStatusTemp=0
  slStatus=0

  sudo apt install curl tmux python3 -y

  echo "Initiating git clone of tmux dependent repositories"
  
  git clone "https://github.com/tmux-plugins/tpm" "${1}/tmux/plugins/tpm"
  git clone "https://github.com/tmux-plugins/tmux-resurrect" "${1}/tmux-resurrect"
  cd "${1}/tmux-resurrect"
  sh ./resurrect.tmux
  if [ $? -ne 0 ]; then
    echo "There was an error when trying to execute the resurrect installation script"
    exit
  fi

  for f in $(ls -A ./home/)
  do
    ln -s ${PWD}/home/${f} ${1}/${f}
    slStatusTemp=$?
    if [ $slStatusTemp -ne 0 ]; then
      slStatus=${slStatusTemp}
    fi
  done
  if [ $slStatus -ne 0 ]; then
    echo "There were some unsuccessful operations attempted while trying to create symlinks."
  else
    echo "Successfully added all dotfiles to directory ${1}"
  fi
else
  echo "Argument requires a home directory: ./startup.sh <home directory>"
  echo "Example: startup.sh /home/samirpatelgx"
  exit 1
fi

echo "Next, go into vim and do :PlugInstall to install all of its plugins based on the .vimrc configuration"
