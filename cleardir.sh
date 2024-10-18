#!/bin/bash

# Check parametr of script
if [ -z $1 ]
	then
		echo "Usage of this script:"
		echo "./cleardir path_to_directory"
		exit 1
fi

# Check if directory exist
if [ -d $1 ]
	then
		path_to_dir=$1
	else
		echo "Directory $1 is not exist or given wrong path"
		exit 1
fi

# Prepare paths to delete files
bak_files_path="$path_to_dir/*.bak"
tmp_files_path="$path_to_dir/*.tmp"
backup_files_path="$path_to_dir/*.backup"

# Delete files with extentions .bak, .tmp, .backup
bak_count=$( ls -la $path_to_dir | grep \.bak | wc -l )
if [ $bak_count -ge 1 ]
	then
		$( rm $bak_files_path )
		echo "Deleted $bak_count files with extention .bak"
fi

tmp_count=$( ls -la $path_to_dir | grep \.tmp | wc -l )
if [ $tmp_count -ge 1 ]
        then
                $( rm $tmp_files_path )
		echo "Deleted $tmp_count files with extention .tmp"
fi

backup_count=$( ls -la $path_to_dir | grep \.backup | wc -l )
if [ $backup_count -ge 1 ]
        then
                $( rm $backup_files_path )
		echo "Deleted $backup_count files with extention .backup"
fi
