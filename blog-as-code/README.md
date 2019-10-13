# 2019 All Things Open - Translating My Blog

This is an example demonstrated at All Things Open.

It excerpts one of my blog posts and uses two
rudimentary providers to demonstrate Terraform.

## Pre-Requisites

You will need these plug-ins loaded into `~/.terraform.d/plugins`.

- [joatmon08/terraform-provider-translate](https://github.com/joatmon08/terraform-provider-translate)
- [joatmon08/terraform-provider-medium](https://github.com/joatmon08/terraform-provider-medium)

In addition to the Terraform providers above, you'll need:

- Terraform 0.12.10
- Medium Integration Token
- Google Cloud Platform Service Account with access to Cloud Translate API


## Caveats

- The Terraform Provider for Medium does not support in-place update or
  deletion, due to limitations in the Medium API.
- The Terraform Provider for Google Translate does not support deletion of
  the translation job, since it is a job that is one-time and returned.