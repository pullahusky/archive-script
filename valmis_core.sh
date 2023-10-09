#!/bin/bash

#setting up the weeklyBackup script

function setup() {
     
    echo "What is the directory you want to backup: "
    read directorytobackup
    
    echo "Name of the backup file(s): "
    read nameofthebackups

    echo "Name of the backup folder: "
    read folderforbackups
    mkdir -p $folderforbackups > /dev/null
   
    echo "Destination directory of the backup package: "
    read wheretoplacepackage

    tar -cvf $nameofthebackups.tar $directorytobackup     
    pbzip2 -zfv9 $nameofthebackups.tar 

    chmod -R  777 $nameofthebackups.tar.bz2
    mv -nv $nameofthebackups.tar.bz2 $folderforbackups        
    mv -nv $folderforbackups  $wheretoplacepackage 

   echo completed
   

   # ./weeklyBackup.sh

}

setup
