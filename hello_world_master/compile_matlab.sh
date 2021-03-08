#!/bin/sh
#
# Compile the matlab code so we can run it without a matlab license. Required:
#     Matlab 2019b, including compiler, with license

export PATH=/usr/local/MATLAB/R2019b/bin:$PATH

mcc -m -v src/hello_world.m \
	-d bin
chmod go+rx bin/hello_world
chmod go+rx bin/run_hello_world.sh
