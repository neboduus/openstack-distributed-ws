#!/bin/sh

# put the .pub files in this direcotry in ubuntu@217.77.95.88:.ssh/
# for entry in `ls $search_path | grep *.pub`; do
	# scp $entry ubuntu@217.77.95.88:.ssh/
# done

# edit the name of the key
KEYDOC1="daniele.pizzolli.key.pub"

# upload key on the VMs
ssh ubuntu@217.77.95.88 -A << EOF
	ssh-copy-id -f -i .ssh/$KEYDOC1 ubuntu@172.24.4.25
	ssh-copy-id -f -i .ssh/$KEYDOC1 ubuntu@172.24.4.6
	ssh-copy-id -f -i .ssh/$KEYDOC1 ubuntu@172.24.4.21
	ssh-copy-id -f -i .ssh/$KEYDOC1 ubuntu@172.24.4.28
EOF
