/*

Terraform applies config by creating resources that exist in the config but are not associated with a real infra object in the state
Destroys resources that exist in the state but no longer exist in the config
Updates in-place resources whose argumentes have changed
Destroy and re-create resource whose arguments have changed but which cannot be updated in-place due to remote API limitations

Limitations:
You changed something manually on a resource, you want to keep it so "apply" shouldn't touch it.
-> you can add Meta Arguments, that within a resource block can allow some details of this standard resource behavior to be customized on a per-resource basis

Example:
lifecycle {
    ignore_changes = [ tags ]
} #terraform will ignore changes to tags

Meta-Arguments: depends_on, count, for_each, lifecycle, provider

Lifecycle Arguments:
- create_before_destroy: new replacement object is created first, then it is destroyed (true or false)
- prevent_destroy: Terraform to reject with an error any plan that would destroy the infra object associated with the resource (true or false)
    - this can be used as a mesure of safety against the accidental replacement of resource that maybe constly to reproduce (database for example)
    - if you remove the whole config block, it won't save you 
- ignore_changes: ignore changes to the live resource that does not match config
    - this is a list
    - 'all' keyword can be used (can create or destroy, but will never update it)
- replace_triggered_by: replaces the resource when ayn of the referenced items change

*/

