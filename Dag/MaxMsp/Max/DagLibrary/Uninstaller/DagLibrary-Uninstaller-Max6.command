#!/bin/bash
# This file must be saved in UTF-8


################################
# Uninstallations Methodes
################################
function remove5 {
	echo "Removing DagLibrary for Max5";
	doRemove;
}

function doRemove {
	echo -ne "- DagLibrary Installer Receipt\n"
	sudo rm -Rf "/private/var/db/receipts"/com.cicm.daglibrary.*
	echo -ne "... done.\n"
	
	if [ -e "$C74Folder" ] ; then
		echo -ne "- DagLibrary Folder ($C74Folder/DagLibrary/)"
		sudo rm -Rf "$C74Folder/DagLibrary" && echo -ne "... done.\n" 
	fi
	

	if [ -e "$maxAppFolder" ] ; then
		
		echo -ne "- Extra Files ($maxAppFolder/patches/extras/dag.overview.maxpat)"
		sudo rm -Rf "$maxAppFolder/patches/extras/dag.overview.maxpat" && echo -ne "... done.\n"
	fi
 
	echo -ne "\n";

}


################################
# UnInstallation process
################################
clear

echo "------------------------------"
echo "--- DagLibrary Uninstaller ---"
echo "------------------------------"
echo ""
echo "Hi $USER..."
echo "You must run this script as an Admin user, and may be prompted for your password."
echo ""


################################
#  Version checking
################################
whichVersion=0;

maxAppFolder="/Applications/Max6";
C74Folder="$maxAppFolder/Cycling '74"; 
remove5;

echo -ne "done"
echo -ne "\n\nend of DagLibrary Uninstaller.\n"
echo -ne "(you can quit the Terminal now...)\n"

exit 0;
