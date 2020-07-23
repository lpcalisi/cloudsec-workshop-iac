# Terraform Commands
### CLI Usage

All of this commands must be preceded by `terraform`

| Command  | Description                                                                                                              |
|----------|--------------------------------------------------------------------------------------------------------------------------|
| plan     | Show changes to be made to the infrastructure                                                                            |
| apply    | Applies state                                                                                                            |
| destroy  | Destroys all terraform managed state (WARNING)                                                                           |
| fmt      | Rewrite terraform files to a canonical format and style                                                                  |
| get      | Download or updates modules                                                                                              |
| init     | Start backend                                                                                                            |
| graph    | Create visual representation                                                                                             |
| import   | Try to find the resource identified with ID and import into state                                                        |
| console  | Open interactive terraform consol                                                                                        |
| output   | Stdout output of your resources. Using NAME will only output a specific resource                                         |
| refresh  | Refresh the remote state. Identify differences                                                                           |
| remote   | Configure remote state storage                                                                                           |
| show     | Show human readable output from state or plan                                                                            |
| state    | Use it for advanced state management, e.g. Rename a resource `terraform state mv aws_instance.example aws_instance.prod` |
| taint    | Mark resource as tainted, it will be destructed and recreated at the next apply                                         |
| untaint  | undo a taint                                                                                                             |
| validate | Syntax validation                                                                                                        |
| workspace| Environment management                                                                                                   |


For more docs &rarr; <a href="https://www.terraform.io/docs/commands/index.html"> Terraform Commands </a>
