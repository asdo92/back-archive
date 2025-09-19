back-archive - Create backup of files or directories.
=====================================================

### Installation:

* Open terminal and run the following commands:

  ```shell
  $ git clone https://github.com/asdo92/back-archive
  $ cd back-archive
  $ sudo ./install.sh
  ````

* After running the script, you will see the following wizard.

  ```shell
  * back-archive installer 1.0 (150521) (GPL v2.0)

  * [Default: /opt/back-archive] Type the path to install: /opt/back-archive 

  + Created base directory (/opt/back-archive).
  + Created configs directory (/opt/back-archive/conf).
  + Created logs directory (/opt/back-archive/log).
  + Created backups directory (/opt/back-archive/archive).
  + Copied executable to /opt/back-archive/back-archive.
  + Created /usr/bin/back-archive redirection file.
             | 
             --> /opt/back-archive/back-archive
  + Installation completed.
  ````

_Dependencies: `bash`, `coreutils`, `tar`, `cron (opcional)`, `grep`_

### Enable Auto-Backups:

* If you have configured different backups and want them to run daily, you can enable them with the following commands:

  ```shell
  $ sudo su
  $ echo "0 1 * * * root /usr/bin/back-archive -run-all" > /etc/cron.d/back-archive
  ````
  
### Syntax:

* You can show the syntax running the command as root.

  ```shell
  $ sudo back-archive
  
  * back-archive v1.0 (150521) (GPL v2.0)

  - Config dir: /opt/back-archive/conf
  - Backups dir: /opt/back-archive/archive
  - Logs dir: /opt/back-archive/log

  + Syntax:

    $ back-archive -new <name-backup>  --> Create new backup config (no spaces)
    $ back-archive -shw <name-backup>  --> Show configuration of backup config
    $ back-archive -edt <name-backup>  --> Edit configuration of backup config
    $ back-archive -del <name-backup>  --> Remove configuration of backup config
    $ back-archive -log <name-backup>  --> Show logging of backup configuration
    $ back-archive -bck <name-backup>  --> Restore backup of backup configuration
    $ back-archive -run <name-backup>  --> Run backup of selected backup config
    $ back-archive -run-all            --> Run backup of all backup configurations
    $ back-archive -bck-all            --> Restore all created backups
    $ back-archive -list               --> List all backup configurations
    $ back-archive -list-bck           --> List all backup files
    $ back-archive -help               --> Show help
    $ back-archive -about              --> Show about
    ````
    
### External links:

  * [xterm homepage](https://invisible-island.net/xterm/)
  * [Coreutils homepage](https://www.gnu.org/software/coreutils/coreutils.html)
  * [Bash homepage](https://www.gnu.org/software/bash/)
  * [Grep homepage](https://www.gnu.org/software/grep/)



