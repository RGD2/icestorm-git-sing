igs.sing: Singularity
	sudo singularity build igs.sing Singularity

shell: igs.sing
	sudo singularity shell igs.sing

clean: 
	sudo rm -rf igs.sing

.PHONY: shell clean

