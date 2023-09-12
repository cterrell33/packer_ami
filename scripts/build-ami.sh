#!/bin/bash -ex

template=$(find -name '*.pkr.hcl')

/usr/bin/packer init $template
/usr/bin/packer build \
  -var-file=parameters/dev/pkvar.json \
  $template
