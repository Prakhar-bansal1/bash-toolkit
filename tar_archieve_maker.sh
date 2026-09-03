#!/bin/bash

for file in logfiles/*.log
do
# syntax - tar -czvf <destination_archive> <source_file>
# Create (-c), compress with gzip (-z), print output (-v), using the archive file name specified next (-f)
	tar -czvf $file.tar.gz $file
done
