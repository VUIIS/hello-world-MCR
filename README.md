# Example singularity container using Matlab Runtime and Compiler

This document will take you through the steps of creating a singularity container using an example Matlab function.

# File list

	README.md				This file.
	Singularity			        Singularity container recipe
	compile_matlab.sh		    	Shell script to compile Matlab code
	test_sing_container.sh			Shell script to test if Singularity is operational after build
	bin/
		hello_world		        Compiled matlab executable
		run_hello_world.sh	 	Matlab's generated runscript for the executable
		read_me.txt		        Information on Matlab generated files
		<others>			Other files created by Matlab	

	src/
		hello_world.m		      	Matlab main function
		hello_world_run.m	   	Subfunction required for hello_world.m
		test_matlab.m		     	 Test code at Matlab command line


# The process

## Develop and test Matlab code locally
All Matlab code should be contained within the 'src' directory, including a Matlab function to test if the code is operational from the Matlab command line.
A critical point here is that there is a single entrypoint for the processing. In this case it's the function `hello_world.m` which takes file paths and parameters as input and calls the various parts of the pipeline. All outputs should be stored in the `out_dir` that is specified when this function is called. That may also be used as a working directory. In a container, the accessible directories and files will not match the development systems, so some attention needs to be paid to where things are.

## Compile the Matlab code and test
See `compile_matlab.sh`. There is a test script for the compiled code as well: 
`bin/test_compiled_matlab.sh`. Once it is working correctly, proceed to building the container. Matlab code should be compiled on Linux system to function with Singularity. If -c is used it does not embed the deployable archives in binaries. 


The compiled matlab executable will often exceed github's 100 MB file size limit. In that case, [git LFS](https://git-lfs.github.com/) is useful:

    git lfs track bin/example_main

## Create Singularity container recipe
The recipe for singularity container requires a specific structure and organization. The example provides explanations of each section within the recipe. For more detailed instructions, see the [user guide](https://sylabs.io/guides/3.7/user-guide.pdf).
The singularity recipe will designate input and output directories, update and install all required packages, download Matlab Compiled Runtime, and run the compiled Matlab script. Be sure the version of Matlab Compiled Runtime is the same as the Matlab version used to write the code.

## Build the container and test
The container can be built locally on a machine where Singularity is available (i.e. on linux):

	singularity build example-hello-world.simg Singularity

Or, we can take advantage of 
[singularity-hub](https://www.singularity-hub.org/collections/2117)
which will build it for us.

Finally, we have a script to test the container, `test_sing_container.sh`. Commands --cleanenv and --contain should always be used when running a singularity.


# List of commonly required programs and packages

	Programs:
		VirtualBox		  Create a virtual environment for running Linux
		Ubuntu 			  Linux OS for building singularity
		Matlab Runtime 		  Allows user to run compiled Matlab code
		Singularity		  Used to generate singularity containers
	
	Packages:
		wget			  Download software during build
		unzip,zip		  Unzip and zip files
		Imagemagick		  Used to write figures to pdf format
		ghostscript		  Required for ImageMagick
		xvfb			  Required for Matlab Runtime. Displays figures on virtual display.
		openjdk-8-jre		  Required for Matlab Runtime to work.


# Helpful links
[VUMC Matlab License Access](https://www.vumc.org/it/software-store-blog-vumc-it-blog/matlab-anytime-anywhere)

[Matlab compiler documentation](https://www.mathworks.com/help/compiler/index.html?s_tid=CRUX_lftnav)

[Singularity homepage](https://singularity-hub.org/)

[Singularity documentation](https://sylabs.io/guides/3.7/user-guide.pdf)

[Singularity examples](https://github.com/singularityhub/singularity-compose-examples)

[CCI Homepage](https://my.vanderbilt.edu/vuiiscci/)

[Link to identify appropriate headers for singularity recipe](hub.docker.com/_/ubuntu)

[Singularity installation guide](sylabs.io/guides/3.7/admin-guide/installation.html#installation-on-linux)



