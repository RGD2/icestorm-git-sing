# Icestorm autobuilt from git repositories within a Singularity image

This repo is a simple, relatively safe and quick way to build the icestorm FPGA tools 'like the devs do' from basically any OS, without having to follow long, tedius instructions.

It uses Singularity as a container environment so you don't need to think/worry about the OS or dependancy installations.
It needs about 13 GB of disk space to run, however, and from scratch might take you half and hour or so, in total, depending on your computer and internet connection performance.

This includes icestorm, yosys, arachne-pnr and icotools, all of which are the latest git versions.
This uses a Ubuntu 16.04 Image which is freshly updated and allows for the dependancies to be installed as binaries, which means they're most likely very similar or the same to what the developers of these packages use.


## Why?

You might generally be happy with using icestorm through prebuilt binaries (such as with apio). But should you find a bug, it'd be really helpful (and polite) if you verify that it exists in the latest build, such as this will get you. Doing so this way guarantees that you've got the absolute latest version, and probably also that your issue will get attention if you report it directly in the relevant git repository.

It may also solve your issue, such that you may only need to wait for your usual binary distribution to update.

Finally, if you would like to contribute, you can do so from within the image (just set up your github account details with `git config --global user.name ""` and likewise for `user.email` and you should be good to go). Be aware however that any changes you make in the image will get lost as soon as you close it! (unless you push them up to github).

# Installation instructions

1. Install Singularity as per <https://sylabs.io/guides/3.4/user-guide/installation.html#windows> (or relevant other instructions for your OS)
	- Install vagrant, git for windows, virtualbox, and (if you like) vagrant manager.
	- Use vagrant to install a minimal VM for Singularity as directed. I used singularity-2.4
		- (open git-bash, run `vagrant init sylabs/singularity-3.4-ubuntu-bionic64 && vagrant init && vagrant up && vagrant ssh` )
2. Be in 'vagrant@vagrant' shell you'll end up in, after following those instructions.
	- see below for how to get back in here if you get lost
3. Get this repo into your singularity vagrant VM with `git clone https://github.com/RGD2/icestorm-git-sing`
4. `cd icestorm-git-sing`

- If you're not using windows, you can probably just install singularity as usual and skip to step 3.
- For a *much* faster build (if you have the ram for it) git clone into `/dev/shm/`
    - The whole image and build process will take place in a ram disk

## Usage

    `make shell`

The git repos are in `/opt` and you will be root within the singularity image.

If you're on windows (running with vagrant inside a virtualbox), then you need to load Oracle VM VirtualBox Manager and 'give' the USB devices corresponding to our FPGA board(s) to the VM. A USB 1.1 Controller should be sufficient, and will not require additional software installation (such the as VirtualBox guest tools).

## Exiting

CTRL-D a few times will do the trick. You will probably want to use Vagrant Manager to 'Halt' the VM too.
Note that any changes to the image filesystem will be lost after singularity stops.
If you find yourself needing to repeat steps, read the singularity documentation and use this built image as a base for your own singularity build recipe.

## Getting back in

1. Get back into the singularity vagrant machine:

Assuming you're on windows, you can either:

A. Open 'Vagrant Manager' bring the singularity vm up and then use the `SSH` menu item for the singularity machine, or:

B. Open 'Git Bash' then:
- `cd `  
- `cd singularity-2.4`
- `vagrant up`
- `vagrant ssh`

2. `cd icestorm-git-sing`
3. Reopen the Singularity image with: `make shell`

Not on windows? `make shell`

## Rebuilding with the absolute latest git versions

`make clean shell` 

## Timing a build

`time make igs.sing`
