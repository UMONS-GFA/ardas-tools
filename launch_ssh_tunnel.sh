 #!/usr/bin/env bash

 LOCALHOST='localhost'
 LOCAL_PORT=22
 USERNAME=''
 REMOTE_HOST=''
 REMOTE_PORT=10022
 REMOTE_SSH_PORT=22

 ps auxw | grep $LOCALHOST | grep -v grep > /dev/null

 if [ $? != 0 ]
 then
     /usr/bin/ssh -f -N -R $REMOTE_PORT:$LOCALHOST:$LOCAL_PORT $USERNAME@$REMOTE_HOST -p $REMOTE_SSH_PORT
 fi
