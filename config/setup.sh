#!/bin/bash


if [ "$#" -ge 1 ]; then

	dotFilesDir=$(dirname "$(realpath $0)")

  slStatusTemp=0
  slStatus=0

  sudo yum install curl tmux python3 -y

  echo "Initiating git clone of tmux dependent repositories"
  if [[ ! -d ${1}/.tmux/plugins/tpm ]]; then
    git clone "https://github.com/tmux-plugins/tpm" "${1}/.tmux/plugins/tpm"
  else
    echo "tpm directory already cloned. Proceeding with next steps..."
  fi
  if [[ ! -d ${1}/.tmux/plugins/tmux-resurrect ]]; then
    git clone "https://github.com/tmux-plugins/tmux-resurrect" "${1}/.tmux/plugins/tmux-resurrect"
  else
    echo "tmux-resurrect directory already cloned. Proceeding with next steps..."
  fi
  sh ${1}/.tmux/plugins/tmux-resurrect/resurrect.tmux
  if [ $? -ne 0 ]; then
    echo "There was an error when trying to execute the resurrect installation script"
    exit
  fi

  for f in $(ls -A ${dotFilesDir}/home/)
  do
    ln -s ${dotFilesDir}/home/${f} ${1}/${f}
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
