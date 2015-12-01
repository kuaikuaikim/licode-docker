#!/bin/bash
if [ ! -d $HOME/licode ]
then
	git clone https://github.com/ging/licode.git
	./licode/scripts/installUbuntuDeps.sh
        ./licode/scripts/installErizo.sh
	./licode/scripts/installNuve.sh	
fi
