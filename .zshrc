# Homebrew if on Mac
if [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Source zsh customization
for i in $(ls ~/.zsh-plugins); do
  source ~/.zsh-plugins/$i
done

# Helpful alias
alias history="history 0"
alias ls="ls --color=auto"
alias ll="ls -al --color=auto"

# Source secrets from .env
[[ -f ~/.env ]] && source ~/.env

fastfetch
