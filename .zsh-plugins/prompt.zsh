# Customizes the zsh prompt

NEWLINE=$'\n'
ARROW_RIGHT=$'\uE0B0'
ROUNDED_RIGHT=$'\uE0B4'
ROUNDED_LEFT=$'\uE0B6'
APPLE_GLYPH=$'\uE711'
LINUX_GLYPH=$'\uE712'
FOLDER_GLYPH=$'\uF07C'
BRANCH_GLYPH=$'\uF126'

# Load zsh version control extension
autoload -Uz vcs_info

# Run vcs_info before every prompt so it captures the version control info
precmd() { 
  psvar=()

  if [[ "$OSTYPE" == "darwin"* ]]; then
    print -v 'psvar[1]' -Pr -- $APPLE_GLYPH
  else
    print -v 'psvar[1]' -Pr -- $LINUX_GLYPH
  fi

  vcs_info
}

# Configure style of the vcs_info message vars
zstyle ':vcs_info:git:*' formats $' %s \uF126 %b%m'
zstyle ':vcs_info:git:*' actionformats $' %s \uF126 %b|%a%m'

# Allow dynamic substitution in the PROMPT var
setopt PROMPT_SUBST
PROMPT=$'%F{cyan}${ROUNDED_LEFT}%f%F{black}%K{cyan}%1v | ${FOLDER_GLYPH}%(4~|.../%3~|%~)%k%f%F{cyan}%K{yellow}${ARROW_RIGHT}%k%f%F{black}%K{yellow}${vcs_info_msg_0_}%k%f%F{yellow}${ROUNDED_RIGHT}%f${NEWLINE}%# '
