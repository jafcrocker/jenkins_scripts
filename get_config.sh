#! /bin/bash
# Get the Jenkins job config for a given job

JENKINS_USER=${JENKINS_USER:-$USER}
JOB_NAME=$1
if [ "$JOB_NAME" == "" ] ; then 
    echo usage: $0 JOB_NAME
    exit 1
fi
URL=http://jenkins.zendev.org/job/$JOB_NAME/config.xml
HTTP_STATUS=$(curl -s -u $JENKINS_USER -w "%{http_code}" -o >( xmllint --format - > $JOB_NAME.xml) $URL)
if [ "$HTTP_STATUS" != "200" ] ; then 
    echo Get Failed: \"$HTTP_STATUS\"
    exit 1
fi
