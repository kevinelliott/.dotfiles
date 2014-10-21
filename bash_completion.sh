# Set git autocompletion and PS1 integration
# git autocompletion in git 1.7.x and below
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

# git autocompletion in git 1.8.x
if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
    . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

# git autocompletion in git 2.1.x
if [ -f `brew --prefix git`/etc/bash_completion.d/git-completion.bash ]; then
	. `brew --prefix git`/etc/bash_completion.d/git-completion.bash
fi

# git autocompletion in git 2.1.x
if [ -f `brew --prefix git`/etc/bash_completion.d/git-prompt.sh ]; then
	. `brew --prefix git`/etc/bash_completion.d/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# ack autocompletion
# TODO: This is broken! Fix.
#if [ -f /usr/local/etc/bash_completion.d/ack.bash_completion.sh ]; then
#    . /usr/local/etc/bash_completion.d/ack.bash_completion.sh
#fi

# hub autocompletion
if [ -f /usr/local/etc/bash_completion.d/hub.bash_completion.sh ]; then
    . /usr/local/etc/bash_completion.d/hub.bash_completion.sh
fi
