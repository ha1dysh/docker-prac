groupadd -g $APP_GROUP $APP_GROUPNAME
useradd -m -s /bin/bash -u $APP_USER -g $APP_GROUP $APP_USERNAME
