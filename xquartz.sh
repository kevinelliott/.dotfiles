if [ -n `which xquartz` ] && [ -n /opt/X11/include ]; then
  echo "Setting up Xquartz"
  export CPPFLAGS=-I/opt/X11/include
fi
