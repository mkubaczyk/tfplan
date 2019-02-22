# tfplan

Run `terraform plan` with `-target` specified for autodiscovered resources/modules from given files or location.

## Install

`ln -s $PWD/tfplan /usr/local/bin/tfplan`

### Optional requirements

`ln -s $PWD/tfapply /usr/local/bin/tfapply` can be linked as well, so you can follow naming convention for commands.

If `landscape` (install from [here](https://github.com/coinbase/terraform-landscape)) is in PATH,
`terraform plan` will be parsed with it.

## Usage

```$ tfplan [-f|--file filename] [-l|--limit "rule"] [--dry-run] [positional arguments]```

* `-f|--file`                   filename|directory to discover resources from
* `-l|--limit`                  wildcard style rule to limit resources with (must be wrapped with " "]
* `-h|--help`                   display help
* `--dry-run`                   print steps without invoking them
* `positional arguemnts`        any flag from terraform, that needs to be invoked with tfplan
### Examples

* ```$ tfplan -f . -l "google_compute_firewall.*"``` - will discover all files from . path (current directory) and will limits resources to google_compute_firewall only

* ```$ tfplan --file 10_firewall.tf -l "my_firewall_*"``` - will get resources from 10_firewall.tf file and limit them to those containing \"my_firewall_\" in the name

* ```$ tfplan --file 10_firewall.tf -destroy``` - will destroy every resource from 10_firewall.tf file
