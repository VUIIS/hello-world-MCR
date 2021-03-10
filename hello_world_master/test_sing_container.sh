#!/bin/bash

singularity run \
--cleanenv \
--contain \
--home $(pwd -P)/INPUTS \
--bind $(pwd -P)/INPUTS:/INPUTS \
--bind $(pwd -P)/OUTPUTS:/OUTPUTS \
hello_world.simg \
display_string "Hello, world!" \
filename hello_world.txt \
in_dir /INPUTS \
out_dir /OUTPUTS

