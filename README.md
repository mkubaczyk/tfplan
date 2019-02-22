# tfplan

Run `terraform plan` with `-target` specified for autodiscovered resources/modules from given files or location.

## Install

`ln -s $PWD/tfplan /usr/local/bin/tfplan`

### Optional requirements

`ln -s $PWD/tfapply /usr/local/bin/tfapply` can be linked as well, so you can follow naming convention for commands.

If `landscape` (install from [here](https://github.com/coinbase/terraform-landscape)) is in PATH,
`terraform plan` will be parsed with it.

## Usage

`tfplan <path_or_files> "<glob_limit>" <additional_tf_flags>`

Where:

* `<path_or_files>` is a string that may be used as
    * `file1.tf,file2.tf` - comma separated string of files, where `terraform plan` with `-target` will be run limited to all resources/modules present in those files only
    * `./my-dir` - as a plain string with path so all resources/modules from `./my-dir` path will be discovered

* `<glob_limit>` (comma separated string) allows defining wildcard syntax matching for resources/modules, options are:
    * `"google_compute_address.custom-*"`, so it matches all resources of type `google_compute_address` and name starting with `custom-`
    * `""`, (empty string) so it matches all resources based on autodiscovery from `<path_or_files>` param
    * or even `google_compute_address.*,custom-*`, so it matches all resources of type `google_compute_address` and all resources/modules that have `custom-` string anywhere

PLEASE NOTICE: any glob limit must be defined inside `""` marks so it's not interpreted by your bash.

* `<additional_tf_flags>` defined as comma separated string with tf flags, examples:
    * `-destroy`
    * `-lock=false,-parallelism=1`

## Result

Script prints plan to stdout and creates `plan` file, which later can be used with `terraform apply plan`.

## Example commands

`tfplan "70_cluster.tf" "google_compute_address.*"` 
- loads all `google_compute_address` resources from `70_cluster.tf` file.

`tfplan 70_cluster.tf "google_compute_firewall.my-cluster-*" "-destroy,-lock=false"` 
- loads all `google_compute_firewall` resources where object name starts with `my-cluster-` and set tf flags to `-destroy -lock=false`

`tfplan 70_cluster.tf "google_compute_*"`
- loads all `google_compute_*` resources
