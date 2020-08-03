# Playing with modules

In this demo, I developed a module that creates and manages many static websites hosted on S3 buckets. I merge many of terraform concepts such as modules, workspaces and remote state.

---
#### What did we do in this demo?

As we saw before, in the module's theory section, it let us package, reuse and better organize our configurations.
In this demostration, we created a module called `create_s3_public_static_site` that needs to be call with two arguments, the domain name of our static website and the tags that should have the S3 bucket. This last will allow us, for example, to get the cost of each client separately.

On the other hand, we have created a script `deploy.sh` that allow us to abstract the deployments of the static websites using workspaces and saving all of our different client's websites states in the same backend.

In the future, we can extend this script and integrate it with a CDN  (Cloudflare, Cloudfront, etc) and support for custom S3 bucket policies (now is public by default)

---

* *Set up or create your S3 bucket in `backend.tf` like you did the previous demos.*
    <image src="./images/create_bucket.png">

* *Create a new folder with the `domain name` and copy all your websites files inside it*

  <image src="./images/create_site_folder.gif">
  
* *Make deployment with deploy.sh*
```console
foo@bar:~$ ./deploy.sh -h
  OPTIONS
    -a=<action>: terraform action
    -d=<domain>: domain name
    -t=<tags>: tags for s3 bucket
    -w <creates workspace if not exists>

  EXAMPLE
    host_s3_public_static_site.sh -a=apply -d=example.com -t='{key:value}' -w
```

```console
foo@bar:~$ ./deploy.sh -a=apply -d=workshop-cloudsec-iac-example-1234 \
    -t='{"project" :"workshop", "team":"cloudsec"}' -w
```
  
  <image src="./images/applied.png">
  
  We have seted a output var in module in order to see S3 Webste endpoint. If we try to curl the endpoint, we get our static site.
  
  
  <image src="./images/curl.gif">
  
  
  
