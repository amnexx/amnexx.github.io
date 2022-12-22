if [ "${CODESPACES}" = "true" ]; then
  # Remove the default credential helper
  sudo sed -i -E 's/helper =.*//' /etc/gitconfig

  # Add one that just uses secrets available in the Codespace
  git config --global credential.helper '!f() { sleep 1; echo "username=${GITHUB_USER}"; echo "password=${GH_TOKEN}"; }; f'
fi

# CaskaydiaCove Nerd Font
mkdir -p ${HOME}/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip
unzip CascadiaCode.zip -d ${HOME}/.local/share/fonts
rm CascadiaCode.zip

# OH-MY-ZSH PLUGINS & THEMES (POWERLEVEL10K)
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k --depth=1
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp ./.devcontainer/.zshrc ${HOME}/.zshrc
cp ./.devcontainer/.p10k.zsh ${HOME}/.p10k.zsh