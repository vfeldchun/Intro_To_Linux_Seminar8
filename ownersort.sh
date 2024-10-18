#!/bin/bash

# Check parametr of script
if [ -z $1 ]
        then
                echo "Usage of this script:"
                echo "./ownersort.sh path_to_directory"
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

# Get current directory path
pwd_dir=$( pwd )
# Change on given directory
cd $path_to_dir

# loop of handling of files
for file in *
do
	if [ -e $file ]
		then
			# Geting name of user of file
			owner_name=$( ls -l $file | grep ^- | awk '{print $3}' )
			
			if [ -d $owner_name ]
				then
					cp $file  $owner_name/
				else
					mkdir $owner_name
					cp $file  $owner_name/
			fi
			
			# Set owner of file on original
			chown $owner_name:$ownername $owner_name/$file
	fi
done

# Change directory on original
cd $pwd_dir
