# Manage Environment

In real-world app development, separate environments are needed for production, dev, staging, etc.
https://12factor.net/dev-prod-parity

In terraform, several ways exist to make those environments as similar as possible.

## workspaces 

https://developer.hashicorp.com/terraform/cli/workspaces 

The advantage of this approach is that all the environments are similar and reduce code duplication. Still, the disadvantage is that customizing resources for different environments (e.g., dev & prod) becomes challenging.

## directory structure

This approach's advantage is that it is easy to customize different environments separately. For example, the dev environment uses one replica of the VM, but the prod environment uses a minimum of three. The disadvantage is that there is more duplication compared to the previous approach. 

## remote state

There is a use case in which one resource depends on another and has a different lifecycle. for example a connected database instance and a VM. A database is relatively stable and should be running all the time, but VM will be re-created many times (including scale-up / scale-out). There are also case when DB has a separate team and VM is only used by developers. Remote state can also used in **workspaces** or **directory structure**.