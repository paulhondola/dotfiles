# ZSH setup for macOS

# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh compdump
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Plugins for Oh My Zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

plugins=(git zoxide eza fzf gh macos thefuck zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh

# Plugin configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'

# Zoxide setup
eval "$(zoxide init zsh)"
alias cd="z"

# Eza setup
alias ls="eza --hyperlink --icons=auto"
alias lsa="eza -a --hyperlink --icons=auto"
alias lss="eza -s --hyperlink --icons=auto"

# Ripgrep setup
alias grep="rg"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/paulhondola/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/paulhondola/.bun/_bun" ] && source "/Users/paulhondola/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/paulhondola/.lmstudio/bin"
# End of LM Studio CLI section


# Created by `pipx` on 2026-03-31 20:53:56
export PATH="$PATH:/Users/paulhondola/.local/bin"
