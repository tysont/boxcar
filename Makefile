SHELL = /bin/bash
CYGHOME = /cygdrive/c$(subst \,/,$(HOMEPATH))

/PHONY: all clean build
all: clean build

clean:
	rm -rf .vagrant
	rm -rf '$(CYGHOME)/VirtualBox VMs/development'

build:
	vagrant up

buildfusion:
	vagrant up --provider vmware_fusion