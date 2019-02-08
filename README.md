# tfplan

Run `terraform plan` with `-target` specified for autodiscovered resources/modules from given files or location.

## Install

`ln -s $PWD/tfplan /usr/local/bin/tfplan`

### Optional requirements

If `landscape` (install from [here](https://github.com/coinbase/terraform-landscape)) is in PATH,
`terraform plan` will be parsed with it.

## Usage

### Files

`tfplan` with argument of filenames separated with comma sign.

Example:
`tfplan file1.tf,file2.tf`

will run `terraform plan` with `-target` set to all resources/modules present in those files only.

### Path

`tfplan .`

All resources/modules from `.` will be discovered.
