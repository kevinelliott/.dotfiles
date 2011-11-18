function use_textmate () {
  export MATE_PATH=`which mate`
  export EDITOR="$MATE_PATH -w"
  export GEM_OPEN_EDITOR="$MATE_PATH"

  function m {
    if [ "$1" != "" ]; then
      mate $1
    else
      mate .
    fi
  }
}

function use_sublime () {
  alias sub='open -a "/Applications/Sublime Text 2.app"'
  export EDITOR='open -a "/Applications/Sublime Text 2.app"'
  export GEM_OPEN_EDITOR='open -a "/Applications/Sublime Text 2.app"'

  function s {
    if [ "$1" != "" ]; then
      sub $1
    else
      sub .
    fi
  }
}

use_textmate

