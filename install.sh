#!/bin/bash

#############################################
# back-archive - Installer for back-archive #
# Date: 15-05-2021                          #
# Author: asdo92                            #
# Contact: asdo92@duck.com                  #
#############################################
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

# Show installer for back-archive
rootMessage
echo ""
echo "* back-archive installer ${VERSION} (${M_DATE}) (${LICENSE})"
echo ""
echo -n "* [Default: ${default_install_path}] Type the path to install: " ; read path_install
if [ -z "${path_install}" ] ; then
  install_path="${default_install_path}"
else
  install_path="${path_install}"
fi
# Create directories
echo ""
# Create base directory
mkdir -p "${install_path}"
echo "+ Created base directory (${install_path})."
# Create configs directory
mkdir -p "${install_path}/conf"
echo "+ Created configs directory (${install_path}/conf)."
# Create logs directory
mkdir -p "${install_path}/log"
echo "+ Created logs directory (${install_path}/log)."
# Create backups directory
mkdir -p "${install_path}/archive"
echo "+ Created backups directory (${install_path}/archive)."
# Copy executable of back-archive
cp -rf src/back-archive "${install_path}"/
chmod +x "${install_path}/back-archive"
echo "+ Copied executable to ${install_path}/back-archive."
# Create executable on system path
echo "#!/bin/bash" > /usr/bin/back-archive
echo "" >> /usr/bin/back-archive
echo "# Variable of executable dir for back-archive" >> /usr/bin/back-archive
echo -n "RUN_DIR=" >> /usr/bin/back-archive
echo -n '"' >> /usr/bin/back-archive
echo -n "${install_path}" >> /usr/bin/back-archive
echo '"' >> /usr/bin/back-archive
echo "" >> /usr/bin/back-archive
echo "# Run executable of back-archive" >> /usr/bin/back-archive
echo 'cd "${RUN_DIR}"' >> /usr/bin/back-archive
echo 'bash back-archive "$@"' >> /usr/bin/back-archive
chmod +x /usr/bin/back-archive
echo "+ Created /usr/bin/back-archive redirection file."
echo "           | "
echo "           --> ${install_path}/back-archive"
echo "+ Installation completed."
echo ""

