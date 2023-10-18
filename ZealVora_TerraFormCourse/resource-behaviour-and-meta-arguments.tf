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
    ignore_changers = [ tags ]
} #terraform will ignore changes to tags

Meta-Arguments: depends_on, count, for_each, lifecycle, provider
*/

