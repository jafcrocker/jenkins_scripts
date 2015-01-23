Useful scripts for getting/posting configs to jenkins
--------------------

**Workflow:**

1) Get the configuration file for a given job and save it in \<JOB_NAME\>.xml
```
get_config <JOB_NAME>
```

2) Edit \<JOB_NAME\>.xml

3) Post the changes back to Jenkins server (Note: this validates xml before attempting to post)
```
post_config <JOB_NAME>
```

**Environment:**
The scripts use *$USER* for your jenkins login.  If that is not correct, set the *$JENKINS_USER* environment variable.
