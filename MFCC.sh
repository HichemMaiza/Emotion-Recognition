#!/bin/bash

dir_mal=$( cd AIBO/wav/AIBO-M )
dir_femal=$( cd AIBO/wav/AIBO-O )
if [ $1 = "male" ]
then 
	cd AIBO/wav/AIBO-M/
	if [ -d MFCCs ]
	then 
		rm -rf MFCCs
		mkdir MFCCs
	else 
		mkdir MFCCs
	fi
	for file in *.wav 
	do 
		base=$( basename $file .wav )
		SMILExtract -C /home/maiza/Téléchargements/openSMILE-2.2rc1/config/IS09_emotion.conf -I $file -O "MFCCs/$base.arff"  
	done
fi 

if [ $1 = "femelle" ]
then 
	cd AIBO/wav/AIBO-O/
	if [ -d MFCCs ]
	then 
		rm -rf MFCCs 
		mkdir MFCCs
	else
		mkdir MFCCs 
	fi
	
	for file in *.wav
	do 	
		base=$( basename $file .wav )
                SMILExtract -C /home/maiza/Téléchargements/openSMILE-2.2rc1/config/IS09_emotion.conf -I $file -O "MFCCs/$base.arff"
	done 
fi
