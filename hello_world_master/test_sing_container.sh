#!/bin/bash

singularity run \
--cleanenv \
--home /wkdir/INPUTS \
--bind /wkdir/INPUTS:/INPUTS \
--bind /wkdir/OUTPUTS:/OUTPUTS \
hello_world_master-v1.0.0.simg \
display_string Hello, world! \
filename hello_world.txt \
in_dir /INPUTS \
out_dir /OUTPUTS 
