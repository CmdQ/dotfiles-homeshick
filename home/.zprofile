[[ -e "$HOME/.homesick/repos/homeshick" ]] && chmod -R g-w,o-w "$HOME/.homesick/repos/homeshick"
[[ -e "$HOME/.oh-my-zsh" ]] && chmod -R g-w,o-w "$HOME/.oh-my-zsh"

emulate sh -c ". $HOME/.profile"
