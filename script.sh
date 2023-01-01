#!/bin/bash

#####################################
# tested on ubuntu-20.04-build-script-v01 #
#####################################

function run-cmd ()
{
 echo ""
 echo ""
 echo "================================================================="
 echo " About to run : $1"
 echo "-----------------------------------------------------------------"
 read -t 10 -p ""
 $1
 echo ""
 
}

# update all repostory indexes so they point to the latest packages #
#-------------------------------------------------------------------#
run-cmd "sudo apt-get update"

# upgrade all installed packages to the version shown in the repository indexes #
#-------------------------------------------------------------------------------#
run-cmd "sudo apt-get upgrade -y"

# install one of the most lightweight desktops #
#----------------------------------------------#
run-cmd "sudo apt-get install xfce4 -y"

# Install additional components for XFCE (panel, file manager, and various plugins) #
#------------#
run-cmd "sudo apt-get install xfce4-goodies -y"

# install the linux package that provides RDP (for windows remote desktop connection) #
#-------------------------------------------------------------------------------------#
run-cmd "sudo apt-get install xrdp -y"

#enable startup xrdp #
#--------------------#
run-cmd "sudo systemctl enable xrdp"

# put a small file in the RDP users directory, letting XRDP know which desktop to start #
#---------------------------------------------------------------------------------------#
run-cmd "echo 'xfce4-session' > /root/.xsession"
# the above command is for presentation only. the nested quotes i needed were causing
# poblems , so i had to hard code the command and run it on the following line
echo "xfce4-session" > /root/.xsession

# add the xrdp user to the ssl-cert group" #
#------------------------------------------#
run-cmd "sudo usermod -a -G ssl-cert xrdp"

# install the version of Virtualbox from the repository #
#-------------------------------------------------------#
# run-cmd "sudo apt-get install virtualbox -y" 

# install the extenionpack as it contains the Virtualbox RDP Server #
#-------------------------------------------------------------------#
# run-cmd "sudo apt install virtualbox-ext-pack -y" 

# show the current status of the firewall #
#-----------------------------------------#
run-cmd "sudo ufw status numbered"

# allow the SSH port , number 22 , through the firewall #
#-------------------------------------------------------#
run-cmd "sudo ufw allow 22"

# allow the RDP port, number 3389, for the main ubuntu server #
#-------------------------------------------------------------#
run-cmd "sudo ufw allow 3389"


# allow the RDP random port 50001 onwards for the 1st, 2nd, 3rd, 4th etc VirtualBox VM if needed #
#------------------------------------------------------------------------------------------------#
# run-cmd "sudo ufw allow 50001"
# run-cmd "sudo ufw allow 50002"
# run-cmd "sudo ufw allow 50003"
# run-cmd "sudo ufw allow 50004"

# enable the firewall, dont worry about the warning message, we have already allowed SSH #
#----------------------------------------------------------------------------------------#
run-cmd "sudo ufw enable"

# show the current status of the firewall #
#-----------------------------------------#
run-cmd "sudo ufw status numbered"

# install the firefox web browser #
#---------------------------------#
run-cmd "sudo apt-get install firefox -y"

# install cpu-x for detail cpu#
#----------------------------------#
run-cmd "sudo apt install cpu-x -y"

# install the Snap Store #
#---------------------------------#
run-cmd "sudo snap install snap-store"

# install the Notepad Plus Plus #
#---------------------------------#
run-cmd "sudo snap install notepad-plus-plus"

# ========= SCRIPT END ============#
