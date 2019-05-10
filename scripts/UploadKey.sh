#!/bin/sh

for entry in `ls $search_path | grep *.pub`; do
	scp $entry ubuntu@217.77.95.88:keyteam
done

KEYDOC1="valentino.key.pub"
KEYDOC2="marian_key.pub"

ssh ubuntu@217.77.95.88 -A << EOF
	ssh-copy-id -f -i keyteam/$KEYDOC1 ubuntu@172.24.4.25
	ssh-copy-id -f -i keyteam/$KEYDOC1 ubuntu@172.24.4.6
	ssh-copy-id -f -i keyteam/$KEYDOC1 ubuntu@172.24.4.21
	ssh-copy-id -f -i keyteam/$KEYDOC1 ubuntu@172.24.4.28
	ssh-copy-id -f -i keyteam/$KEYDOC2 ubuntu@172.24.4.25
	ssh-copy-id -f -i keyteam/$KEYDOC2 ubuntu@172.24.4.6
	ssh-copy-id -f -i keyteam/$KEYDOC2 ubuntu@172.24.4.21
	ssh-copy-id -f -i keyteam/$KEYDOC2 ubuntu@172.24.4.28
EOF
