#! /bin/bash
# Get the Jenkins job config for a given job

JENKINS_USER=${JENKINS_USER:-$USER}
JOB_NAME=$1
if [ "$JOB_NAME" == "" ] ; then
    echo usage: $0 JOB_NAME
    exit 1
fi

CONFIG_FILE=$JOB_NAME.xml

if [ ! -r $CONFIG_FILE ] ; then
    echo Can not read file \"$CONFIG_FILE\"
fi

if ! xmllint $CONFIG_FILE > /dev/null ; then
    echo $CONFIG_FILE does not contain valid xml; exiting
    exit 1
fi

URL=http://jenkins.zendev.org/job/$JOB_NAME/config.xml
echo Posting $CONFIG_FILE to $URL
HTTP_STATUS=$(curl -s -u $JENKINS_USER -w "%{http_code}" -X POST --data-binary @$CONFIG_FILE $URL)
if [ "$HTTP_STATUS" != "200" ] ; then
    echo Post Failed: \"$HTTP_STATUS\"
    exit 1
fi

