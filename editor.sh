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
  export SUBL_PATH=`which subl`
  export EDITOR="$SUBL_PATH -w"
  export GEM_OPEN_EDITOR="$SUBL_PATH"

  function s {
    if [ "$1" != "" ]; then
      subl $1
    else
      subl .
    fi
  }
}

use_sublime

