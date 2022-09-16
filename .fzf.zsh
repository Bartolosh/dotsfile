# Setup fzf
# ---------
if [[ ! "$PATH" == */home/bartolosh/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/bartolosh/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/bartolosh/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/bartolosh/.fzf/shell/key-bindings.zsh"
