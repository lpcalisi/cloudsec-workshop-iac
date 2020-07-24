# Playing with modules

In this demo, i created a module for create and manage many static websites hosted on S3 buckets. I merge many of terraform concepts such as modules, workspaces and remote state.

---
#### How did we do in this demo?

As we saw before, in theory about modules, it allow us package, reuse and better organizes our configurations.
In this demostration, we created a module called `create_s3_public_static_site` that need to be called with two arguments, domain name of our static website and the tags that should have the S3 bucket, this could allow us for example get the cost of each client.

In the other hand, we have created a script `deploy.sh` that allow us abstract the deployments of the static websites using workspaces and saving all of our differents clients websites in the same backend.

In the future, it would be usefull add to serve the websites with a CDN and support for custom S3 bucket policies (now is public by default)

---



* *Set up your S3 bucket in `backend.tf` like you did the previous demos.*
* *Create a new folder with the `domain name` and copy all your websites files inside it*
* *Make deployment with deploy.sh*
  ```console
  foo$bar:~$ ./deploy.sh -h
  OPTIONS
    -a=<action>: terraform action
    -d=<domain>: domain name
    -t=<tags>: tags for s3 bucket

  EXAMPLE
    host_s3_public_static_site.sh -a=apply -d=example.com -t='{key:value}'
  ```