if [ -n `which git` ]; then
  alias gst='git status'
  alias gl='git pull'
  alias gp='git push'
  alias gd='git diff --no-color | $EDITOR'
  alias ga='git add'
  alias gcl='git config --list'
  alias gc='git commit -v'
  alias gca='git commit -v -a'
  alias gb='git branch'
  alias gbc='git branch --color'
  alias gba='git branch -a'
  alias gco='git checkout'
  alias gpatch='git diff master -p'
  alias gitrm="git status | grep deleted | awk '{print $3}' | xargs git rm"
fi
