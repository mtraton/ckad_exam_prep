# Cronjobs

- Create a cron job with image busybox that runs on a schedule of "*/1 * * * *" and writes 'date; echo Hello from the Kubernetes cluster' to standard output. Verify logs. Delete cron job.
```
# Create
k create cj get-date \
--image=busybox \
--schedule='*/1 * * * *' \
-- /bin/sh -c 'date; echo Hello from the Kubernetes cluster'
# Verify
sleep 1m; pod_name=$( k get po | grep get-date | cut -d' ' -f1 | head -1 ); k logs "${pod_name}";
# Delete
k delete cj get-date; echo $?
```
- Create a cron job with image busybox that runs every minute and writes 'date; echo Hello from the Kubernetes cluster' to standard output.
- The cron job should be terminated if it takes more than 17 seconds to start execution after its scheduled time (i.e. the job missed its scheduled time).
- See: https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/#starting-deadline
```
# Create and get manifest as yaml
k create cj get-date \
--dry-run=client \
-o yaml \
--image=busybox \
--schedule='*/1 * * * *' \
-- /bin/sh -c 'echo Starting Job; sleep 20; echo Job finished;'
# Add .spec.startingDeadlineSeconds
apiVersion: batch/v1
kind: CronJob
metadata:
  creationTimestamp: null
  name: get-date
spec:
  startingDeadlineSeconds: 1
  jobTemplate:
    metadata:
      creationTimestamp: null
      name: get-date
    spec:
      template:
        metadata:
          creationTimestamp: null
        spec:
          containers:
          - command:
            - /bin/sh
            - -c
            - echo Starting Job; sleep 20; echo Job finished;
            image: busybox
            name: get-date
            resources: {}
          restartPolicy: OnFailure
  schedule: '*/1 * * * *'
status: {}
# Apply file
k apply -f cj.yml
# Verify

# Delete
```

