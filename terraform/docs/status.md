# State

One of the best qualities of terraform is to keep your infrastructure in a certain state. Terraform states is in charge of keeping track of every change made on our terraform resources. State, should represent the actual infrastructure deployed. Changing resources without terraform will be not reflected on the state.
Terraform has two ways to manage states.

#### Local State
 * By default, terraform creates a `terraform.tfstate` file in the root modules's path which holds all the data of your states. Additionally, a second file  `terraform.tfstate.backup` saves the previous state.
 * Local state is generally used for little / medium sized projects. You could save it in github for version controlling.


#### Remote State
