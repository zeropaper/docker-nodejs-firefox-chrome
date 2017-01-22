XORG=/usr/bin/Xorg
XORGARGS="-noreset +extension GLX +extension RANDR +extension RENDER -logfile ./xorg-99.log -config /etc/X11/xorg.conf :99"
PIDFILE=/var/run/xorg-dummy-server.pid
case "$1" in
  start)
  echo -n "Starting xserver with dummy driver"
  start-stop-daemon --start --quiet --pidfile $PIDFILE --make-pidfile --background --exec $XORG -- $XORGARGS
  echo "."
  ;;
  stop)
  echo -n "Stopping xserver with dummy driver"
  start-stop-daemon --stop --quiet --pidfile $PIDFILE
  echo "."
  ;;
  restart)
  $0 stop
  $0 start
  ;;
  *)
  echo "Usage: /etc/init.d/xorg-dummy-server {start|stop|restart}"
  exit 1
esac

exit 0
