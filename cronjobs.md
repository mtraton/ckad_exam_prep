# Cronjobs

- Create a cron job with image busybox that runs on a schedule of "*/1 * * * *" and writes 'date; echo Hello from the Kubernetes cluster' to standard output
```
k create cj get-date-every-minute \
--image=busybox \
--schedule='*/1 * * * *' \
-- /bin/sh -c 'date; echo Hello from the Kubernetes cluster'
```
