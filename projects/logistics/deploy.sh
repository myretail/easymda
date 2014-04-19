#!/bin/sh
### chmod +x deploy.sh
#$JBOSS_HOME/bin/shutdown.sh -S
#mvn -f web/pom.xml
mvn -o -f app/pom.xml -Ddeploy
#$JBOSS_HOME/bin/run.sh