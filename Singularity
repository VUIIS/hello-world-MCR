Bootstrap: docker 
From: ubuntu:20.04

%setup
  # create folder at the root of the file system within the container
  mkdir -p ${SINGULARITY_ROOTFS}/opt/hello_world


%files
  # Used to copy files into the container
  bin /opt/hello_world
  src /opt/hello_world

%environment
  # Define environment variables that will be set at runtime.
  # Uses same conventions as .bashrc or .profile files


%post
  # Download files from the internet, install new software and libraries, write configuration files, create new directories.
  apt-get update
  apt-get install -y wget unzip openjdk-8-jre xvfb
  
  # Download the Matlab Compiled Runtime installer, install, clean up (might need update)
  mkdir /MCR
  wget -nv -P /MCR https://ssd.mathworks.com/supportfiles/downloads/R2019b/Release/6/deployment_files/installer/complete/glnxa64/MATLAB_Runtime_R2019b_Update_6_glnxa64.zip
  unzip /MCR/MATLAB_Runtime_R2019b_Update_6_glnxa64.zip -d /MCR/MATLAB_Runtime_R2019b_Update_6_glnxa64
  /MCR/MATLAB_Runtime_R2019b_Update_6_glnxa64/install -mode silent -agreeToLicense yes
  rm -r /MCR/MATLAB_Runtime_R2019b_Update_6_glnxa64 /MCR/MATLAB_Runtime_R2019b_Update_6_glnxa64.zip
  rmdir /MCR

 # Create input/output directories for binding
  mkdir /INPUTS && mkdir /OUTPUTS


%runscript
  # contents written to a file within the container that is executed when the image is run.
  sh ${SINGULARITY_ROOTFS}/opt/hello_world/bin/run_hello_world.sh \
  ${SINGULARITY_ROOTFS}/usr/local/MATLAB/MATLAB_Runtime/v97 "$@"


%startscript
  # Contents of this section are written to a file within the container at build time.
  # File is executed when the instance start command is used.
  

%test
  # Check that programs you intend to install in the container are present

%labels
  # Adds metadata to labels.json within container.
  # Format is name-value pairs.
  
  Maintainer r.dylan.lawless@vumc.org
  MyLabel hello_world
  Version v0.0.1

%help
  # Text here is transcribed to metadata file in the container during build.
  # The text can be displayed with the run-help command
  
  hello_world
  
  This is a demo container that creates a text document containing the users input.

  Run with command line below. 

  singularity run \
  --cleanenv \
  --contain \
  --home <input_dir> \
  --bind <input_dir>:/INPUTS \
  --bind <output_dir>:/OUTPUTS \
  <singularity_image> \
  display_string Hello, world! \
  filename hello_world.txt \
  in_dir /INPUTS \
  out_dir /OUTPUTS 
  

