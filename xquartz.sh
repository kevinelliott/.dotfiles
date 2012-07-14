if [ -n `which xquartz` ] && [ -n /opt/X11/include ]; then
  export CPPFLAGS=-I/opt/X11/include
fi
