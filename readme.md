# Icestorm autobuilt from git repositories within a Singularity image

This repo is a simple, relatively safe and quick way to build the icestorm FPGA tools 'like the devs do' from basically any OS, without having to follow long, tedius instructions.

It uses Singularity as a container environment so you don't need to think/worry about the OS or dependancy installations.
It needs about 13 GB of disk space to run, however, and from scratch might take you half and hour or so, in total, depending on your computer and internet connection performance.

This includes icestorm, yosys, arachne-pnr and icotools, all of which are the latest git versions.
This uses a Ubuntu 16.04 Image which is freshly updated and allows for the dependancies to be installed as binaries, which means they're most likely very similar or the same to what the developers of these packages use.



# Installation instruction

1. Install Singularity as per <https://singularity.lbl.gov/install-windows> (or relevant other instructions for your OS)
	- Install vagrant, git for windows, virtualbox, and (if you like) vagrant manager.
	- Use vagrant manager to install a minimal VM for Singularity as directed. I used singularity-2.4
2. Be in 'vagrant@vagrant' shell you'll end up in, after following those instructions.
	- see below for how to get back in here if you get lost
3. Get this repo into your singularity vagrant VM with `git clone https://github.com/RGD2/icestormGitSing`
4. `cd icestormGitSing`
4. `make shell`

## Usage

The git repos are in `/opt` and you will be root within the singularity image.

If you're on windows (running with vagrant inside a virtualbox), then you need to load Oracle VM VirtualBox Manager and 'give' the USB devices corresponding to our FPGA board(s) to the VM. A USB 1.1 Controller should be sufficient, and will not require additional software installation (such the as VirtualBox guest tools).

## Getting back in

1. Get back into the singularity vagrant machine:

Assuming you're on windows, you can either:

A. Open 'Vagrant Manager' bring the singularity vm up and then use the `SSH` menu item for the singularity machine, or:
B. Open 'Git Bash' then:
    - `cd `  
    - `cd singularity-2.4`
    - `vagrant up`
    - `vagrand ssh`

2. `cd icestormGitSing`
3. Reopen the Singularity image with: `make shell`

## Rebuilding with the absolute latest git versions

`make clean shell` 


