# Playing with modules

In this demo, i created a module for create and manage many static websites hosted on S3 buckets. I merge many of terraform concepts such as modules, workspaces and remote state.

---
#### How did we do in this demo?

As we saw before, in theory about modules, it permits us package, reuse and better organizes our configurations.
In this demostration, we created a module called `create_s3_public_static_site` that need to be called with two arguments, domain name of our static website and the tags that should have the S3 bucket, this could allow us for example get the cost of each client.

---

* *First, you need set your S3 bucket in `backend.tf` like you did the previous demos.
* 
