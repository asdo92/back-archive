#!/bin/bash

###############################################
# back-archive - Uninstaller for back-archive #
# Date: 15-05-2021                            #
# Author: asdo92                              #
# Contact: asdo92@duck.com                    #
###############################################
VERSION="1.0"
M_DATE="150521"
LICENSE="GPL v2.0"

# Default parameters
default_install_path="/opt/back-archive"

# Function to check root permissions.
function rootMessage() {
  mkdir -p /etc/root &> /dev/null
  administrador="$?"
  if [ ${administrador} -eq 0 ] ; then
    rm -rf /etc/root
  else
    echo ""
    echo "* back-archive ${VERSION} (${M_DATE}) (${LICENSE})"
    echo ""
    echo "* Administrator permissions are required."
    echo ""
    exit
  fi
}

# Detect previous installation
rootMessage
if [ -f "/usr/bin/back-archive" ] ; then
  source "/usr/bin/back-archive"
  baseDir="${RUN_DIR}"
  confDir="${baseDir}/conf"
  logDir="${baseDir}/log"
  bckDir="${baseDir}/archive"
  clear
  echo ""
  echo "* back-archive installer ${VERSION} (${M_DATE}) (${LICENSE})"
  echo ""
  echo "* Previous installation detected:"
  echo ""
  echo " - Base dir: ${baseDir}"
  echo " - Config dir: ${confDir}"
  echo " - Logs dir: ${logDir}"
  echo " - Backups dir: ${bckDir}"
  echo " - Run file: ${baseDir}/back-archive"
  echo ""
  echo -n "* [Default: n] Proceed with the uninstallation? (y/n): " ; read uninstall
  if [ "${uninstall}" == "y" ] ; then
    echo ""
    rm -rf "${baseDir}/back-archive"
    echo "+ Removed ${baseDir}/back-archive file."
    rm -rf "${confDir}"
    echo "+ Removed ${confDir} directory."
    rm -rf "${logDir}"
    echo "+ Removed ${logDir} directory."
    rm -rf "${bckDir}"
    echo "+ Removed ${bckDir} directory."
    rm -rf "${baseDir}"
    echo "+ Removed ${baseDir} directory."
    rm -rf "/usr/bin/back-archive"
    echo "+ Removed /usr/bin/back-archive redirection."
    echo "+ Uninstall completed."
    echo ""
  else
    echo ""
  fi
else
  echo ""
  echo "* back-archive installer ${VERSION} (${M_DATE}) (${LICENSE})"
  echo ""
  echo "* No previous installation detected."
  echo ""
fi
