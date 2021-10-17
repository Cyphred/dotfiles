# !/bin/sh
# starts workrave in normal mode

workrave &
sleep 1
dbus-send --type=method_call --dest=org.workrave.Workrave /org/workrave/Workrave/Core org.workrave.CoreInterface.SetOperationMode string:'normal'
