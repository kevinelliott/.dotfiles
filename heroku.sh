if [ -n `which heroku` ]; then
  alias gph='git push heroku HEAD:master'
  alias h='heroku'
fi
